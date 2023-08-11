app.controller("promotion-ctrl", function ($scope, $http) {
	$scope.items = [];
	$scope.form = {};
	$scope.errorMessage = "";
	$scope.sortColumn = '';
	$scope.priceFilter = {
		minPrice: null,
		maxPrice: null
	};


	//pager
	$scope.pager = {
		page: 0,
		size: 5,
		pageItems: [],
		get items() {
			var filteredItems = $scope.items.filter($scope.filterPromotions);
			var start = this.page * this.size;
			return filteredItems.slice(start, start + this.size);
		},
		get count() {
			var filteredItems = $scope.items.filter($scope.filterPromotions);
			return Math.ceil(1.0 * filteredItems.length / this.size);
		},
		first() {
			this.page = 0;
		},
		prev() {
			this.page--;
			if (this.page < 0) {
				this.last();
			}
		},
		next() {
			this.page++;
			if (this.page >= this.count) {
				this.first();
			}
		},
		last() {
			this.page = this.count - 1;
		},
	};
	$scope.initialize = function () {
		$http.get("/admins/promotions").then(resp => {
			$scope.items = resp.data;

			// Sắp xếp mảng items theo trạng thái
			$scope.items.sort(function (a, b) {
				var order = 0; // Giá trị sắp xếp mặc định

				if (a.status === 'Đang diễn ra') {
					order = -1; // Đẩy lên đầu nếu là 'Đang diễn ra'
				} else if (a.status === 'Đã kết thúc') {
					order = 1; // Đẩy xuống cuối nếu là 'Đã kết thúc'
				}

				return order;
			});

			// Chuyển ngày thành đối tượng Date
			$scope.items.forEach(item => {
				item.startDate = new Date(item.startDate),
					item.endDate = new Date(item.endDate)
			});
		});
	}

	//xoa form
	$scope.reset = function () {
		$scope.form = {
			startDate: new Date(),
			endDate: new Date()
		};
	}

	//hien thi len form
	$scope.edit = function (item) {
		$scope.form = angular.copy(item);
	}

	//them promotions
	$scope.create = function () {
		//bo trong ten khuyen mai
		if (!$scope.form.promotionName) {
			$scope.errorMessage = "Vui lòng nhập tên khuyến mãi!!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//loi trung
		let existingPromotion = $scope.items.find(item => item.promotionName === $scope.form.promotionName);
		if (existingPromotion) {
			$scope.errorMessage = "Tên khuyến mãi đã tồn tại!!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//bo trong giam gia
		if (!$scope.form.discount) {
			$scope.errorMessage = "Vui lòng nhập giá giảm!!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		} else if (!/^(100|[0-9]{1,2})$/.test($scope.form.discount)) {
			$scope.errorMessage = "Giảm giá 0 đến 100!!!";
			$('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}
		// Kiểm tra ngày bắt đầu
		if (!$scope.form.startDate) {
			$scope.errorMessage = "Vui lòng chọn ngày bắt đầu!!!";
			$('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}
		//lay ngay hien tai
		const currentDate = new Date();
		//lay ngay bat dau
		const startDate = new Date($scope.form.startDate);

		if (startDate < currentDate) {
			$scope.errorMessage = "Ngày tạo phải lớn hơn ngày hiện tại!!";
			$('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}
		// Kiểm tra ngày ket thuc
		if (!$scope.form.endDate) {
			$scope.errorMessage = "Vui lòng chọn ngày kết thúc!!";
			$('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}

		//lay ngay ket thuc
		const endDate = new Date($scope.form.endDate);

		if (endDate < currentDate) {
			$scope.errorMessage = "Ngày kết thúc phải lớn ngày hiện tại!!";
			$('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}
		//ngay ket thuc nho hon ngay bat dau
		if (endDate < startDate) {
			$scope.errorMessage = "Ngày kết thúc phải lớn hơn ngày tạo!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//ngay bat dau bang ngay ket thuc
		if (endDate.getTime() === startDate.getTime()) {
			$scope.errorMessage = "Ngày kết thúc phải khác ngày tạo!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		// Kiểm tra ngày mo ta
		if (!$scope.form.describe) {
			$scope.errorMessage = "Vui lòng nhập mô tả!!";
			$('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}
		let newItem = angular.copy($scope.form);
		$http.post(`/admin/promotions`, newItem).then(response => {
			let data = response.data;
			data.startDate = new Date(data.startDate);
			data.endDate = new Date(data.endDate);

			if (data.startDate >= new Date()) {
				data.status = "Chưa Diễn Ra";
			}

			$scope.items.push(data);
			$scope.reset();
			$scope.messageSuccess = "Thêm thành công khuyến mãi";
			$('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			alert("Lỗi");
			console.log("Error", error);
		});

	}

	//cap nhat promotion
	$scope.update = function () {
		var item = angular.copy($scope.form);
		$http.put(`/admin/promotions/${item.promotionID}`, item).then(resp => {
			var index = $scope.items.findIndex(p => p.promotionID == item.promotionID);
			$scope.items[index] = item;
			$scope.messageSuccess = "Cập nhật thành công khuyến mãi";
			$('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			alert("Loi cap nhat");
			console.log("Error", error);
		})
	}

	//xoa promotions
	$scope.delete = function (item) {
		$http.delete('/admin/promotions/' + item.promotionID).then(resp => {
			var index = $scope.items.findIndex(p => p.promotionID == item.promotionID);
			$scope.items.splice(index, 1);
			$scope.reset();
			$scope.messageSuccess = "Xóa thành công";
			$('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			$scope.errorMessage = "Xóa thất bại";
			$('#errorModal').modal('show'); // Show the modal
			console.log("Error", error);
		})
	}

	//sap xep 
	$scope.sortItems = function () {
		if ($scope.sortColumn !== '') {
			$scope.items.sort(function (a, b) {
				var aValue = a[$scope.sortColumn];
				var bValue = b[$scope.sortColumn];
				return aValue.localeCompare(bValue);
			});
		}
	};

	//loc trang thai
	$scope.filterStatus = ''; // Khởi tạo giá trị ban đầu

	$scope.filterPromotions = function (item) {
		if ($scope.filterStatus === '') {
			
			return true; // Hiển thị tất cả khi bộ lọc chưa được chọn
		} else if ($scope.filterStatus === 'dang' && item.status === 'Đang diễn ra') {
			console.log("dhfhgf")
			return true;
		} else if ($scope.filterStatus === 'chuadr' && item.status === 'Chưa diễn ra') {
			console.log("dshfdgsf")
			return true;
		} else if ($scope.filterStatus === 'ket' && item.status === 'Đã kết thúc') {
			return true;
		}

		return $scope.filterStatus === '';
	};

	//tim kiem theo gia
	$scope.priceFilter = {
		minPrice: null,
		maxPrice: null
	};

	//load dữ liệu lên trang đầu tiên
	// $scope.filterByPrice = function () {
	// 	$scope.pager.page = 0; // Đặt lại trang về 0 khi thực hiện tìm kiếm
	// 	$scope.loadFilteredData();
	// };



	$scope.filterByPrice = function () {
		$scope.pager.page = 0; // Reset page when filtering
		$scope.searchPromotionsByDiscountRange();
	};

	//ham tim kiem theo khoang 
	$scope.loadFilteredData = function () {
		var start = $scope.pager.page * $scope.pager.size;
		var end = start + $scope.pager.size;
		var filteredItems = $scope.items;

		// Apply price filter if provided
		if ($scope.priceFilter.minPrice !== null) {
			filteredItems = filteredItems.filter(item => item.discount >= $scope.priceFilter.minPrice);
		}
		if ($scope.priceFilter.maxPrice !== null) {
			filteredItems = filteredItems.filter(item => item.discount <= $scope.priceFilter.maxPrice);
		}

		// Apply pagination
		$scope.pager.items = filteredItems.slice(start, end);
	};




	// Gọi hàm loadFilteredData khi nhấn Enter trong ô tìm kiếm
	$scope.handlePriceKeyPress = function (event) {
		if (event.keyCode === 13) { // 13 là mã phím cho "Enter"
			$scope.filterByPrice(); // Thực hiện tìm kiếm theo khoản giá
			console.log("ahakdadgkasgksagd")
		}
	};
	$scope.searchPromotionsByDiscountRange = function () {
		if (!$scope.priceFilter.minPrice || !$scope.priceFilter.maxPrice) {
			$scope.errorMessage = "Vui lòng nhập đủ cả hai khoảng giá để tìm kiếm!";
			$('#errorModal').modal('show'); // Hiển thị modal lỗi
			$scope.initialize(); // Gọi lại hàm khởi tạo dữ liệu để hiển thị toàn bộ
			return;
		}
	
		var params = {
			minDiscount: $scope.priceFilter.minPrice,
			maxDiscount: $scope.priceFilter.maxPrice
		};
	
		$http.get("/admins/promotions/searchPro", { params: params }).then(function (response) {
			$scope.items = response.data;
			$scope.pager.loadFilteredData();
			console.log($scope.pager.loadFilteredData())
		}).catch(function (error) {
			console.log("Error searching promotions: ", error);
		});
	};
	
	$scope.initialize();
});