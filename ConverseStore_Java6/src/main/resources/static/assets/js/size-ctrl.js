app.controller("size-ctrl", function($scope, $http) {
	$scope.sizeitems = [];
	$scope.cates = [];
	$scope.brans = [];
	$scope.form = {};
	$scope.errorMessage = '';
	$scope.initialize = function() {
		//load size
		$http.get("/rest/sizes").then(resp => {
			$scope.sizeitems = resp.data;
		});

		//load brands
		$http.get("/rest/brands").then(resp => {
			$scope.brans = resp.data;
		});


		//load category
		$http.get("/rest/sizes").then(resp => {
			$scope.cates = resp.data;
		});
	}


	// Tìm kiếm size sản phẩm 
	$scope.searchSizeByNumber = function() {
		// Kiểm tra nếu searchKeyword không phải là số hợp lệ
		if (isNaN($scope.searchKeyword) || $scope.searchKeyword === "") {
			// Xử lý và thông báo lỗi cho người dùng
			alert("Vui lòng nhập một số hợp lệ để tìm kiếm.");
			return;
		}

		// Chuyển đổi giá trị searchKeyword sang kiểu số
		var searchValue = parseFloat($scope.searchKeyword);

		// Gửi yêu cầu tìm kiếm số sizeNumber bằng biến searchValue
		$http.get("/rest/sizes/search?keyword=" + searchValue).then(function(resp) {
			// Gán kết quả tìm kiếm vào pager.sizeitems để hiển thị trên bảng
			$scope.sizeitems = resp.data;
			// Reset lại trang đầu tiên của pager
			$scope.pager.page = 0;
		}).catch(function(error) {
			alert("Đã xảy ra lỗi khi tìm kiếm.");
			console.log("Error", error);
		});
	};


	//	Xóa form
	$scope.reset = function() {
		$scope.form = {
			sizeActivities: false,
		};
	}
	//	Khởi đầu
	$scope.initialize();
	$scope.reset();

	//	Hiển thị lên form
	$scope.edit = function(sizeitem) {
		$scope.form = angular.copy(sizeitem);
	}

	//	Thêm size 
	$scope.create = function() {
		var sizeitem = angular.copy($scope.form);
		$http.post('/rest/sizes', sizeitem).then(resp => {
			$scope.sizeitems.push(resp.data);
			$scope.reset();
			$scope.errorMessage = ''; // Xóa thông báo lỗi khi thành công
			alert("Thêm mới thành công");
		}).catch(error => {
			if (error.status === 400) {
				$scope.errorMessage = error.data;
			} else {
				alert("Thêm mới thất bại!");
				console.log("Error", error);
			}
		});
	}

	//	Cập nhật màu 
	$scope.update = function() {
		var sizeitem = angular.copy($scope.form);
		$http.put('/rest/sizes/' + sizeitem.sizeID, sizeitem).then(resp => {
			var index = $scope.sizeitems.findIndex(p => p.sizeID == sizeitem.sizeID);
			$scope.sizeitems[index] = sizeitem;
			alert("Cập nhật thành công");
		}).catch(error => {
			alert("Cập nhật thất bại!");
			console.log("Error", error);
		})
	}

	//	Xóa màu
	$scope.delete = function(sizeitem) {
		$http.delete('/rest/sizes/' + sizeitem.sizeID).then(resp => {
			var index = $scope.sizeitems.findIndex(p => p.sizeID == sizeitem.sizeID);
			console.log(sizeitem.sizeID); // Sửa sizeID thành sizeitem.sizeID
			$scope.sizeitems.splice(index, 1);
			$scope.reset();
			alert("Xóa thành công");
		}).catch(error => {
			alert("Xóa thất bại!");
			console.log("Error", error);
		})
	}

	//	Phân trang
	$scope.pager = {
		page: 0,
		size: 10,
		get sizeitems() {
			var start = this.page * this.size;
			return $scope.sizeitems.slice(start, start + this.size);
		},
		get count() {
			return Math.ceil(1.0 * $scope.sizeitems.length / this.size);
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
	}
});