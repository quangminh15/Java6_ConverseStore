app.controller("product-ctrl", function($scope, $http) {
	$scope.productitems = [];
	$scope.cates = [];
	$scope.brans = [];
	$scope.form = {};
	$scope.errorMessage = '';
	$scope.initialize = function() {
		//load product
		$http.get("/rest/products").then(resp => {
			$scope.productitems = resp.data;
			$scope.productitems.forEach(productitem => {
				productitem.createDate = new Date(productitem.createDate)
			})
		});

		//load category
		$http.get("/rest/categories").then(resp => {
			$scope.cates = resp.data;
		});
		
		//load brand
		$http.get("/rest/brands").then(resp => {
			$scope.brans = resp.data;
		});
	}

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
	$scope.edit = function(productitem) {
		$scope.form = angular.copy(productitem);
	}

	//	Thêm sản phẩm mới 
	$scope.create = function() {
    var productitem = angular.copy($scope.form);
    $http.post('/rest/products', productitem).then(resp => {
        resp.data.createDate = new Date(resp.data.createDate);
			$scope.productitems.push(resp.data);
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
	
	
//	$scope.create = function() {
//		// Kiểm tra các trường bắt buộc
//    if (!$scope.form.productName || !$scope.form.price || !$scope.form.productDescription || !$scope.form.categories || !$scope.form.brands) {
//        $scope.errorMessage = 'Vui lòng nhập đủ thông tin vào các trường bắt buộc.';
//        return; // Dừng tiến trình nếu có lỗi
//    }
//		
//		var productitem = angular.copy($scope.form);
//		$http.post('/rest/products', productitem).then(resp => {
//			resp.data.createDate = new Date(resp.data.createDate);
//			$scope.productitems.push(resp.data);
//			$scope.reset();
//			$scope.errorMessage = ''; // Xóa thông báo lỗi khi thành công
//			alert("Thêm mới thành công");
//		}).catch(error => {
//			alert("Thêm mới thất bại!");
//			console.log("Error", error);
//		})
//	}

	//	Cập nhật sản phẩm 
	$scope.update = function() {
		var productitem = angular.copy($scope.form);
		$http.put('/rest/products/' + productitem.productID, productitem).then(resp => {
			var index = $scope.productitems.findIndex(p => p.productID == productitem.productID);
			resp.data.createDate = new Date(resp.data.createDate);
			$scope.productitems[index] = productitem;
			alert("Cập nhật thành công");
		}).catch(error => {
			alert("Cập nhật thất bại!");
			console.log("Error", error);
		})
	}

	//	Xóa sản phẩm 
	$scope.delete = function(productitem) {
		$http.delete('/rest/products/' + productitem.productID).then(resp => {
			var index = $scope.productitems.findIndex(p => p.productID == productitem.productID);
			console.log(productitem.productID); // Sửa productID thành productitem.productID
			$scope.productitems.splice(index, 1);
			$scope.reset();
			alert("Xóa thành công");
		}).catch(error => {
			alert("Xóa thất bại!");
			console.log("Error", error);
		})
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
			alert("Lỗi upload hình ảnh 1");
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
			alert("Lỗi upload hình ảnh 2");
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
			alert("Lỗi upload hình ảnh 3");
			console.log("error", error);
		})
	}

	//	Phân trang
	$scope.pager = {
		page: 0,
		size: 10,
		get productitems() {
			var start = this.page * this.size;
			return $scope.productitems.slice(start, start + this.size);
		},
		get count(){
			return Math.ceil(1.0 * $scope.productitems.length / this.size);
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


})