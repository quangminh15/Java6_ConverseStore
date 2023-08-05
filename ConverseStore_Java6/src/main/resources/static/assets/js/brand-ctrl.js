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
    var branditem = angular.copy($scope.form);
    $http.post('/rest/brands', branditem).then(resp => {
			$scope.branditems.push(resp.data);
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

	//	Cập nhật thương hiệu 
	$scope.update = function() {
		var branditem = angular.copy($scope.form);
		$http.put('/rest/brands/' + branditem.brandID, branditem).then(resp => {
			var index = $scope.branditems.findIndex(p => p.brandID == branditem.brandID);
			$scope.branditems[index] = branditem;
			alert("Cập nhật thành công");
		}).catch(error => {
			alert("Cập nhật thất bại!");
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
			$scope.form.brandImage = resp.data.namefile;
		}).catch(error => {
			alert("Lỗi upload hình ảnh 1");
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