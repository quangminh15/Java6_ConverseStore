app.controller("category-ctrl", function($scope, $http) {
	$scope.categoryitems = [];
	$scope.cates = [];
	$scope.brans = [];
	$scope.form = {};
	$scope.errorMessage = '';
	$scope.initialize = function() {
		//load categories
		$http.get("/rest/categories").then(resp => {
			$scope.categoryitems = resp.data;
		});

		//load brands
		$http.get("/rest/brands").then(resp => {
			$scope.brans = resp.data;
		});
		
		//load product
		$http.get("/rest/products").then(resp => {
			$scope.prods = resp.data;
			$scope.categoryitems.forEach(productitem => {
			productitem.createDate = new Date(productitem.createDate)
			})
		});
	}
	
	// Tìm kiếm danh mục sản phẩm 
    $scope.searchCategoryByName = function() {
        if ($scope.searchKeyword && $scope.searchKeyword.trim() !== "") {
            $http.get("/rest/categories/search", {
                params: { keyword: $scope.searchKeyword }
            }).then(resp => {
                $scope.categoryitems = resp.data;
            }).catch(error => {
                $scope.errorMessage = "Lỗi khi tìm kiếm danh mục sản phẩm!";
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
			categoryImage: 'default.png',
			categoryActivities: false,
		};
	}
	//	Khởi đầu
	$scope.initialize();
	$scope.reset();

	//	Hiển thị lên form
	$scope.edit = function(categoryitem) {
		$scope.form = angular.copy(categoryitem);
	}

	//	Thêm danh mục mới 
	$scope.create = function() {
		//Bỏ trống tên danh mục 
		if (!$scope.form.categoryName) {
			$scope.errorMessage = "Vui lòng nhập tên danh mục sản phẩm!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		
		// Kiểm tra trùng tên danh mục
		let existingCategoryName = $scope.categoryitems.find(categoryitem => categoryitem.categoryName === $scope.form.categoryName);
		if (existingCategoryName) {
			$scope.errorMessage = "Tên danh mục này đã tồn tại!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		
    var categoryitem = angular.copy($scope.form);
    $http.post('/rest/categories', categoryitem).then(resp => {
			$scope.categoryitems.push(resp.data);
	        $scope.reset();
	        $scope.errorMessage = ''; // Xóa thông báo lỗi khi thành công
	        $scope.messageSuccess = "Thêm thành công danh mục sản phẩm";
            $('#errorModal1').modal('show'); // Show the modal
    }).catch(error => {
        if (error.status === 400) {
            $scope.errorMessage = error.data;
        } else {
            alert("Thêm mới thất bại!");
            console.log("Error", error);
        }
    });
}

	//	Cập nhật danh mục 
	$scope.update = function() {
		//Bỏ trống tên danh mục 
		if (!$scope.form.categoryName) {
			$scope.errorMessage = "Vui lòng nhập tên danh mục sản phẩm!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		
		var categoryitem = angular.copy($scope.form);
		$http.put('/rest/categories/' + categoryitem.categoryID, categoryitem).then(resp => {
			var index = $scope.categoryitems.findIndex(p => p.categoryID == categoryitem.categoryID);
			$scope.categoryitems[index] = categoryitem;
			$scope.messageSuccess = "Cập nhật thành công";
            $('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			$scope.errorMessage = "Cập nhật thất bại!!";
            $('#errorModal').modal('show'); // Show the modal
			console.log("Error", error);
		})
	}

	//	Xóa danh mục
	$scope.delete = function(categoryitem) {
		$http.delete('/rest/categories/' + categoryitem.categoryID).then(resp => {
			var index = $scope.categoryitems.findIndex(p => p.categoryID == categoryitem.categoryID);
			console.log(categoryitem.categoryID); // Sửa categoryID thành categoryitem.categoryID
			$scope.categoryitems.splice(index, 1);
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
			$scope.form.categoryImage = resp.data.namefile;
		}).catch(error => {
			$scope.errorMessage = "Lỗi upload hình ảnh";
            $('#errorModal').modal('show'); // Show the modal
			console.log("error", error);
		})
	}

	//	Phân trang
	$scope.pager = {
		page: 0,
		size: 5,
		get categoryitems() {
			var start = this.page * this.size;
			return $scope.categoryitems.slice(start, start + this.size);
		},
		get count(){
			return Math.ceil(1.0 * $scope.categoryitems.length / this.size);
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