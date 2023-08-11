app.controller("user-ctrl", function($scope, $http, $filter) {
	$scope.cusList = [];
	$scope.cates = [];
	$scope.brans = [];
	$scope.form = {};
	$scope.form.categories = {};
	$scope.form.brands = {};
	$scope.errorMessage = '';
	$scope.initialize = function() {
		//load customer
		$http.get("/rest/customers").then(resp => {
			$scope.cusList = resp.data;
		});

	}

	// Tìm kiếm sản phẩm 
	$scope.searchProductByName = function() {
		if ($scope.searchKeyword && $scope.searchKeyword.trim() !== "") {
			$http.get("/rest/products/search", {
				params: { keyword: $scope.searchKeyword }
			}).then(resp => {
				$scope.cusList = resp.data;
			}).catch(error => {
				$scope.errorMessage = "Lỗi khi tìm kiếm sản phẩm!";
				$('#errorModal').modal('show'); // Show the modal
				console.log("Error", error);
			});
		} else {
			// Nếu không có từ khóa tìm kiếm, hiển thị tất cả sản phảm
			$scope.initialize();
		}
	};

	//	Xóa form
	$scope.reset = function() {
		$scope.form = {
			createDate: new Date(),
			productImage1: 'default.png',
			productImage2: 'default.png',
			productImage3: 'default.png',
			productType: true,
			productActivities: false,
		};
	}
	//	Khởi đầu
	$scope.initialize();
	$scope.reset();

	//	Hiển thị lên form
	$scope.edit = function(c) {
		$scope.form = angular.copy(c);
		$scope.form.lastLogin = $filter('date')($scope.form.lastLogin, ' HH:mm dd/MM/yyyy ');
	}
	
	// birthday
	$scope.showDayPicker = function() {
        var selectedDay = window.prompt("Chọn ngày từ 1 đến 30:", $scope.form.customerDay);
        if (selectedDay !== null) {
            var parsedDay = parseInt(selectedDay);
            if (!isNaN(parsedDay) && parsedDay >= 1 && parsedDay <= 31) {
                $scope.form.customerDay = parsedDay;
            } else {
                alert("Vui lòng nhập ngày hợp lệ từ 1 đến 30!");
            }
        }
    }
    $scope.showMonthPicker = function() {
        var selectedMonth = window.prompt("Chọn Tháng từ 1 đến 12:", $scope.form.customerMonth);
        if (selectedMonth !== null) {
            var parsedMonth = parseInt(selectedMonth);
            if (!isNaN(selectedMonth) && selectedMonth >= 1 && parsedMonth <= 12) {
                $scope.form.customerMonth = parsedMonth;
            } else {
                alert("Vui lòng nhập tháng hợp lệ từ 1 đến 12!");
            }
        }
    }
 	const currentYear = new Date().getFullYear();
    $scope.showYearPicker = function() {
        var selectedYear = window.prompt("Chọn năm từ "+(currentYear-70)+" đến "+currentYear, $scope.form.customerYear);
        if (selectedYear !== null) {
			var minYear = parseInt(currentYear-70);
			var maxYear = parseInt(currentYear);
            var parsedYear = parseInt(selectedYear);
            if (!isNaN(selectedYear) && selectedYear >= minYear && parsedYear <= maxYear) {
                $scope.form.customerYear = parsedYear;
            } else {
                alert("Vui lòng nhập năm hợp lệ từ "+(currentYear-70)+" đến "+currentYear);
            }
        }
    }
    

	//	Thêm nhân viên
	$scope.create = function() {
		//Lỗi bỏ trống tên sản phẩm 
		if (!$scope.form.customerName) {
			$scope.errorMessage = "Vui lòng nhập tên người dùng!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		if (!$scope.form.customerPhone) {
			$scope.errorMessage = "Vui lòng nhập số điện thoại!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		if (!$scope.form.customerEmail) {
			$scope.errorMessage = "Vui lòng nhập cus!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		if (!$scope.form.customerName) {
			$scope.errorMessage = "Vui lòng nhập tên người dùng!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		

		var productitem = angular.copy($scope.form);
		$http.post('/rest/products', productitem).then(resp => {
			resp.data.createDate = new Date(resp.data.createDate);
			$scope.cusList.push(resp.data);
			$scope.reset();
			$scope.errorMessage = ''; // Xóa thông báo lỗi khi thành công
			$scope.messageSuccess = "Thêm mới thành công";
			$('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			if (error.status === 400) {
				$scope.errorMessage = error.data;
			} else {
				$scope.errorMessage = "Thêm mới thất bại";
				$('#errorModal').modal('show'); // Show the modal
				console.log("Error", error);
			}
		});
	}

	//	Cập nhật người dùng
	$scope.update = function() {
		//Lỗi bỏ trống tên người dùng
		if (!$scope.form.customerName) {
			$scope.errorMessage = "Vui lòng nhập tên người dùng!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//Lỗi bỏ trống SDT
		if (!$scope.form.customerPhone) {
			$scope.errorMessage = "Vui lòng nhập số điện thoại!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//Lỗi bỏ trống Email
		if (!$scope.form.customerEmail) {
			$scope.errorMessage = "Vui lòng nhập Email!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//Lỗi bỏ birthday
		if (!$scope.form.customerDay) {
			$scope.errorMessage = "Vui lòng nhập ngày sinh !!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		if (!$scope.form.customerMonth) {
			$scope.errorMessage = "Vui lòng nhập tháng sinh!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		if (!$scope.form.customerYear) {
			$scope.errorMessage = "Vui lòng nhập năm sinh!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		var c = angular.copy($scope.form);
		$http.put('/rest/customers/' + c.customerId, c).then(resp => {
			var index = $scope.cusList.findIndex(cus => cus.customerId == c.customerId);
			$scope.cusList[index] = c;
			$scope.messageSuccess = "Cập nhật thành công";
			$('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			$scope.errorMessage = "Cập nhật thất bại";
			$('#errorModal').modal('show'); // Show the modal
			console.log("Error", error);
		})
	}


	//	Ẩn người dùng
	$scope.hideUser = function() {
		var c = angular.copy($scope.form);
		c.customerStatus = false;
		$http.put('/rest/customers/' + c.customerId, c).then(resp => {
			var index = $scope.cusList.findIndex(cus => cus.customerId == c.customerId);
			$scope.cusList[index] = c;
			$scope.messageSuccess = "Xoá thành công";
			$('#errorModal1').modal('show'); // Show the modal
			$scope.reset();
		}).catch(error => {
			$scope.errorMessage = "Xoá bại";
			$('#errorModal').modal('show'); // Show the modal
			console.log("Error", error);
		})
	}
	$scope.hideUser2 = function(c) {
		c.customerStatus = false;
		$http.put('/rest/customers/' + c.customerId, c).then(resp => {
			var index = $scope.cusList.findIndex(cus => cus.customerId == c.customerId);
			$scope.cusList[index] = c;
			$scope.messageSuccess = "Xoá thành công";
			$('#errorModal1').modal('show'); // Show the modal
			$scope.reset();
		}).catch(error => {
			$scope.errorMessage = "Xoá thất bại";
			$('#errorModal').modal('show'); // Show the modal
			console.log("Error", error);
		})
	}
	//	restore user
	$scope.restore = function(c) {
		c.customerStatus = true;
		$http.put('/rest/customers/' + c.customerId, c).then(resp => {
			var index = $scope.cusList.findIndex(cus => cus.customerId == c.customerId);
			$scope.cusList[index] = c;
			$scope.messageSuccess = "Khôi phục thành công";
			$('#errorModal1').modal('show'); // Show the modal
			$scope.reset();
		}).catch(error => {
			$scope.errorMessage = "Khôi phục thất bại";
			$('#errorModal').modal('show'); // Show the modal
			console.log("Error", error);
		})
	}

	//	Xóa form
	$scope.reset = function() {
		$scope.form = {
			customerId: '',
			customerImage :'150.png'
		};
	}

	//	Upload hình ảnh 1
	$scope.imageChanged1 = function(files) {
		var data = new FormData();
		data.append('file', files[0]);
		$http.post('/rest/upload/imageSP', data, {
			transformRequest: angular.identity,
			headers: { 'Content-Type': undefined }
		}).then(resp => {
			$scope.form.productImage1 = resp.data.namefile;
		}).catch(error => {
			$scope.errorMessage = "lỗi upload hình ảnh 1";
			$('#errorModal').modal('show'); // Show the modal
			console.log("error", error);
		})
	}

	//	Upload hình ảnh 2
	$scope.imageChanged2 = function(files) {
		var data = new FormData();
		data.append('file', files[0]);
		$http.post('/rest/upload/imageSP', data, {
			transformRequest: angular.identity,
			headers: { 'Content-Type': undefined }
		}).then(resp => {
			$scope.form.productImage2 = resp.data.namefile;
		}).catch(error => {
			$scope.errorMessage = "lỗi upload hình ảnh 2";
			$('#errorModal').modal('show'); // Show the modal
			console.log("error", error);
		})
	}

	//	Upload hình ảnh3
	$scope.imageChanged3 = function(files) {
		var data = new FormData();
		data.append('file', files[0]);
		$http.post('/rest/upload/imageSP', data, {
			transformRequest: angular.identity,
			headers: { 'Content-Type': undefined }
		}).then(resp => {
			$scope.form.productImage3 = resp.data.namefile;
		}).catch(error => {
			$scope.errorMessage = "lỗi upload hình ảnh 3";
			$('#errorModal').modal('show'); // Show the modal
			console.log("error", error);
		})
	}

	//	Phân trang
	$scope.pager = {
		page: 0,
		size: 5,
		get cusList() {
			var start = this.page * this.size;
			return $scope.cusList.slice(start, start + this.size);
		},
		get count() {
			return Math.ceil(1.0 * $scope.cusList.length / this.size);
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
})