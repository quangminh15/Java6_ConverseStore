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
    var categoryitem = angular.copy($scope.form);
    $http.post('/rest/categories', categoryitem).then(resp => {
			$scope.categoryitems.push(resp.data);
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

	//	Cập nhật danh mục 
	$scope.update = function() {
		var categoryitem = angular.copy($scope.form);
		$http.put('/rest/categories/' + categoryitem.categoryID, categoryitem).then(resp => {
			var index = $scope.categoryitems.findIndex(p => p.categoryID == categoryitem.categoryID);
			$scope.categoryitems[index] = categoryitem;
			alert("Cập nhật thành công");
		}).catch(error => {
			alert("Cập nhật thất bại!");
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
			alert("Xóa thành công");
		}).catch(error => {
			alert("Xóa thất bại!");
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
			alert("Lỗi upload hình ảnh 1");
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