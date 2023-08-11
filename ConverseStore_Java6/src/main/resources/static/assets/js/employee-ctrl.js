app.controller("employee-ctrl", function($scope, $http, $filter) {
	$scope.empList = [];
	$scope.cates = [];
	$scope.brans = [];
	$scope.form = {};
	$scope.form.categories = {};
	$scope.form.brands = {};
	$scope.errorMessage = '';
	$scope.initialize = function() {
		//load customer
		$http.get("/rest/employees").then(resp => {
			$scope.empList = resp.data;
		});
	}

	// Tìm kiếm sản phẩm 
	$scope.searchProductByName = function() {
		if ($scope.searchKeyword && $scope.searchKeyword.trim() !== "") {
			$http.get("/rest/products/search", {
				params: { keyword: $scope.searchKeyword }
			}).then(resp => {
				$scope.empList = resp.data;
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
	$scope.edit = function(e) {
		$scope.form = angular.copy(e);
		$scope.form.lastLogin = $filter('date')($scope.form.lastLogin, ' HH:mm dd/MM/yyyy ');
	}
	
	// birthday
	$scope.showDayPicker2 = function() {
        var selectedDay = window.prompt("Chọn ngày từ 1 đến 30:", $scope.form.customerDay);
        if (selectedDay !== null) {
            var parsedDay = parseInt(selectedDay);
            if (!isNaN(parsedDay) && parsedDay >= 1 && parsedDay <= 31) {
                $scope.form.employeeDay = parsedDay;
            } else {
                alert("Vui lòng nhập ngày hợp lệ từ 1 đến 30!");
            }
        }
    }
    $scope.showMonthPicker2 = function() {
        var selectedMonth = window.prompt("Chọn Tháng từ 1 đến 12:", $scope.form.employeeMonth);
        if (selectedMonth !== null) {
            var parsedMonth = parseInt(selectedMonth);
            if (!isNaN(selectedMonth) && selectedMonth >= 1 && parsedMonth <= 12) {
                $scope.form.employeeMonth = parsedMonth;
            } else {
                alert("Vui lòng nhập tháng hợp lệ từ 1 đến 12!");
            }
        }
    }
 	const currentYear = new Date().getFullYear();
    $scope.showYearPicker2 = function() {
        var selectedYear = window.prompt("Chọn năm từ "+(currentYear-70)+" đến "+currentYear, $scope.form.employeeYear);
        if (selectedYear !== null) {
			var minYear = parseInt(currentYear-70);
			var maxYear = parseInt(currentYear);
            var parsedYear = parseInt(selectedYear);
            if (!isNaN(selectedYear) && selectedYear >= minYear && parsedYear <= maxYear) {
                $scope.form.employeeYear = parsedYear;
            } else {
                alert("Vui lòng nhập năm hợp lệ từ "+(currentYear-70)+" đến "+currentYear);
            }
        }
    }
    

	//	Thêm nhân viên
	$scope.create = function() {
		//Lỗi bỏ trống tên nhân viên
		if (!$scope.form.employeeName) {
			$scope.errorMessage = "Vui lòng nhập tên nhân viên!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//Lỗi bỏ trống SDT
		if (!$scope.form.employeePhone) {
			$scope.errorMessage = "Vui lòng nhập số điện thoại!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//Lỗi bỏ trống Email
		if (!$scope.form.employeeEmail) {
			$scope.errorMessage = "Vui lòng nhập Email!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//Lỗi bỏ birthday
		if (!$scope.form.employeeDay) {
			$scope.errorMessage = "Vui lòng nhập ngày sinh !!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		if (!$scope.form.employeeMonth) {
			$scope.errorMessage = "Vui lòng nhập tháng sinh!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		if (!$scope.form.employeeYear) {
			$scope.errorMessage = "Vui lòng nhập năm sinh!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		

		var e = angular.copy($scope.form);
		// Lấy ngày, tháng và năm hiện tại
		const currentDate = new Date();

		// Tạo đối tượng LocalDate từ ngày, tháng và năm
		const localDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate());
		e.employeePassword ='';
		e.dateCreated =localDate;
		e.employeeImage ='150.png';
		e.lastLogin ='';
		$http.post('/rest/employees', e).then(resp => {
			$scope.empList.push(resp.data);
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
		//Lỗi bỏ trống tên nhân viên
		if (!$scope.form.employeeName) {
			$scope.errorMessage = "Vui lòng nhập tên nhân viên!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//Lỗi bỏ trống SDT
		if (!$scope.form.employeePhone) {
			$scope.errorMessage = "Vui lòng nhập số điện thoại!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//Lỗi bỏ trống Email
		if (!$scope.form.employeeEmail) {
			$scope.errorMessage = "Vui lòng nhập Email!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//Lỗi bỏ birthday
		if (!$scope.form.employeeDay) {
			$scope.errorMessage = "Vui lòng nhập ngày sinh !!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		if (!$scope.form.employeeMonth) {
			$scope.errorMessage = "Vui lòng nhập tháng sinh!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		if (!$scope.form.employeeYear) {
			$scope.errorMessage = "Vui lòng nhập năm sinh!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		
		var e = angular.copy($scope.form);
//		$scope.form.lastLogin = '2023-07-05 08:15:00.000';
		$http.put('/rest/employees/' + e.employeeId, e).then(resp => {
			var index = $scope.empList.findIndex(cus => cus.employeeId == e.employeeId);
			$scope.empList[index] = e;
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
		var e = angular.copy($scope.form);
		e.employeeStatus = false;
		$http.put('/rest/employees/' + e.employeeId, e).then(resp => {
			var index = $scope.empList.findIndex(cus => cus.employeeId == e.employeeId);
			$scope.empList[index] = e;
			$scope.messageSuccess = "Xoá thành công";
			$('#errorModal1').modal('show'); // Show the modal
			$scope.reset();
		}).catch(error => {
			$scope.errorMessage = "Xoá bại";
			$('#errorModal').modal('show'); // Show the modal
			console.log("Error", error);
		})
	}
	
	$scope.hideUser2 = function(e) {
		e.employeeStatus = false;
		$http.put('/rest/employees/' + e.employeeId, e).then(resp => {
			var index = $scope.empList.findIndex(cus => cus.customerId == e.employeeId);
			$scope.empList[index] = e;
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
	$scope.restore = function(e) {
		e.employeeStatus = true;
		$http.put('/rest/employees/' + e.employeeId, e).then(resp => {
			var index = $scope.empList.findIndex(cus => cus.customerId == e.employeeId);
			$scope.empList[index] = e;
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
		get empList() {
			var start = this.page * this.size;
			return $scope.empList.slice(start, start + this.size);
		},
		get count() {
			return Math.ceil(1.0 * $scope.empList.length / this.size);
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