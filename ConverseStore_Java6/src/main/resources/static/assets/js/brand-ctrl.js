app.controller("brand-ctrl", function($scope, $http) {
	$scope.branditems = [];
	$scope.cates = [];
	$scope.brans = [];
	$scope.form = {};
	$scope.errorMessage = '';
	$scope.initialize = function() {
		//load product
		$http.get("/rest/brands").then(resp => {
			$scope.branditems = resp.data;
			$scope.branditems.forEach(branditem => {
				branditem.createDate = new Date(branditem.createDate)
			})
		});

		//load category
		$http.get("/rest/categories").then(resp => {
			$scope.cates = resp.data;
		});
		
		//load product
		$http.get("/rest/products").then(resp => {
			$scope.prods = resp.data;
		});
	}
	
	// Tìm kiếm thương hiệu sản phẩm 
    $scope.searchBrandByName = function() {
        if ($scope.searchKeyword && $scope.searchKeyword.trim() !== "") {
            $http.get("/rest/brands/search", {
                params: { keyword: $scope.searchKeyword }
            }).then(resp => {
                $scope.branditems = resp.data;
            }).catch(error => {
                $scope.errorMessage = "Lỗi khi tìm kiếm thương hiệu sản phẩm!";
            $('#errorModal').modal('show'); // Show the modal
                console.log("Error", error);
            });
        } else {
            // Nếu không có từ khóa tìm kiếm, hiển thị tất cả danh mục
            $scope.initialize();
        }
    };

	//	Xóa form
	$scope.reset = function() {
		$scope.form = {
			brandImage: 'default.png',
			brandActivities: false,
		};
	}
	//	Khởi đầu
	$scope.initialize();
	$scope.reset();

	//	Hiển thị lên form
	$scope.edit = function(branditem) {
		$scope.form = angular.copy(branditem);
	}

	//	Thêm thương hiệu mới 
	$scope.create = function() {
		//Bỏ trống tên thương hiệu 
		if (!$scope.form.brandName) {
			$scope.errorMessage = "Vui lòng nhập tên thương hiệu sản phẩm!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		
		// Kiểm tra trùng tên thương hiệu
		let existingbrandName = $scope.branditems.find(branditem => branditem.brandName === $scope.form.brandName);
		if (existingbrandName) {
			$scope.errorMessage = "Tên thương hiệu này đã tồn tại!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		
    var branditem = angular.copy($scope.form);
    $http.post('/rest/brands', branditem).then(resp => {
			$scope.branditems.push(resp.data);
	        $scope.reset();
	        $scope.errorMessage = ''; // Xóa thông báo lỗi khi thành công
	        $scope.messageSuccess = "Thêm thành công";
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

	//	Cập nhật thương hiệu 
	$scope.update = function() {
		//Bỏ trống tên thương hiệu 
		if (!$scope.form.brandName) {
			$scope.errorMessage = "Vui lòng nhập tên thương hiệu sản phẩm!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		
		
		var branditem = angular.copy($scope.form);
		$http.put('/rest/brands/' + branditem.brandID, branditem).then(resp => {
			var index = $scope.branditems.findIndex(p => p.brandID == branditem.brandID);
			$scope.branditems[index] = branditem;
			$scope.messageSuccess = "Thêm thành công";
            $('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			$scope.errorMessage = "Thêm mới thất bại";
            $('#errorModal').modal('show'); // Show the modal
			console.log("Error", error);
		})
	}

	//	Xóa thương hiệu
	$scope.delete = function(branditem) {
		$http.delete('/rest/brands/' + branditem.brandID).then(resp => {
			var index = $scope.branditems.findIndex(p => p.brandID == branditem.brandID);
			console.log(branditem.brandID); // Sửa brandID thành branditem.brandID
			$scope.branditems.splice(index, 1);
			$scope.reset();
			$scope.messageSuccess = "Xóa thành công";
            $('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			$scope.errorMessage = "Xóa thất bại";
            $('#errorModal').modal('show'); // Show the modal
			console.log("Error", error);
		})
	}


	//	Upload hình ảnh 
	$scope.imageChanged = function(files) {
		var data = new FormData();
		data.append('file', files[0]);
		$http.post('/rest/upload/imageSP', data, {
			transformRequest: angular.identity,
			headers: { 'Content-Type': undefined }
		}).then(resp => {
			$scope.form.brandImage = resp.data.namefile;
		}).catch(error => {
			$scope.errorMessage = "Upload hình ảnh thất bại";
            $('#errorModal').modal('show'); // Show the modal
			console.log("error", error);
		})
	}

	//	Phân trang
	$scope.pager = {
		page: 0,
		size: 10,
		get branditems() {
			var start = this.page * this.size;
			return $scope.branditems.slice(start, start + this.size);
		},
		get count(){
			return Math.ceil(1.0 * $scope.branditems.length / this.size);
		},
		first(){
			this.page = 0;
		},
		prev(){
			this.page--;
			if(this.page < 0){
				this.last();
			}
		},
		next(){
			this.page++;
			if(this.page >= this.count){
				this.first();
			}
		},
		last(){
			this.page = this.count - 1;
		},
	}
});