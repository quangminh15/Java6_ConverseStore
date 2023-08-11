app.controller("product-ctrl", function($scope, $http) {
	$scope.productitems = [];
	$scope.cates = [];
	$scope.brans = [];
	$scope.form = {};
	$scope.form.categories = {};
	$scope.form.brands = {};
	$scope.errorMessage = '';
	$scope.initialize = function() {
		//load product
		$http.get("/rest/products").then(resp => {
			$scope.productitems = resp.data;
			$scope.productitems.forEach(productitem => {
				productitem.createDate = new Date(productitem.createDate)
			})
			$scope.productitems.sort((a, b) => b.createDate - a.createDate);
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

	// Tìm kiếm sản phẩm 
	$scope.searchProductByName = function() {
		if ($scope.searchKeyword && $scope.searchKeyword.trim() !== "") {
			$http.get("/rest/products/search", {
				params: { keyword: $scope.searchKeyword }
			}).then(resp => {
				$scope.productitems = resp.data;
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
	$scope.edit = function(productitem) {
		$scope.form = angular.copy(productitem);
	}

	//	Thêm sản phẩm mới 
	$scope.create = function() {
		//Lỗi bỏ trống tên sản phẩm 
		if (!$scope.form.productName) {
			$scope.errorMessage = "Vui lòng nhập tên sản phẩm!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		//Lỗi trùng tên sản phẩm
		let existingProduct = $scope.productitems.find(productitem => productitem.productName === $scope.form.productName);
		if (existingProduct) {
			$scope.errorMessage = "Tên sản phẩm đã tồn tại!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Lỗi bỏ trống giá sản phẩm 
		if (!$scope.form.price) {
			$scope.errorMessage = "Vui lòng nhập giá sản phẩm!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Lỗi giá sản phẩm < 0
		if ($scope.form.price < 0) {
			$scope.errorMessage = "Vui lòng nhập giá sản phẩm lớn hơn 0!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Lỗi giá sản phẩm > 100.000.000
		if ($scope.form.price > 100000000) {
			$scope.errorMessage = "Vui lòng nhập giá sản phẩm nhỏ hơn 100.000.000đ!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Không chọn danh mục
		if (!$scope.form.categories || !$scope.form.categories.categoryID) {
			$scope.errorMessage = "Vui lòng chọn danh mục!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Không chọn thương hiệu
		if (!$scope.form.brands || !$scope.form.brands.brandID) {
			$scope.errorMessage = "Vui lòng chọn thương hiệu!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		var productitem = angular.copy($scope.form);
		$http.post('/rest/products', productitem).then(resp => {
			resp.data.createDate = new Date(resp.data.createDate);
			$scope.productitems.push(resp.data);
			$scope.reset();
			$scope.errorMessage = ''; // Xóa thông báo lỗi khi thành công
			$scope.messageSuccess = "Thêm mới thành công";
			$scope.initialize();
			$('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			if (error.status === 400) {
				$scope.errorMessage = error.data;
			} else {
				$scope.errorMessage = "Thêm mới thất bại";
				$scope.initialize();
				$('#errorModal').modal('show'); // Show the modal
				console.log("Error", error);
			}
		});
	}

	//	Cập nhật sản phẩm 
	$scope.update = function() {
		//Lỗi bỏ trống tên sản phẩm 
		if (!$scope.form.productName) {
			$scope.errorMessage = "Vui lòng nhập tên sản phẩm!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Lỗi bỏ trống giá sản phẩm 
		if (!$scope.form.price) {
			$scope.errorMessage = "Vui lòng nhập giá sản phẩm!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Lỗi giá sản phẩm < 0
		if ($scope.form.price < 0) {
			$scope.errorMessage = "Vui lòng nhập giá sản phẩm lớn hơn 0!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Lỗi giá sản phẩm > 100.000.000
		if ($scope.form.price > 100000000) {
			$scope.errorMessage = "Vui lòng nhập giá sản phẩm nhỏ hơn 100.000.000đ!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Không chọn danh mục
		if (!$scope.form.categories || !$scope.form.categories.categoryID) {
			$scope.errorMessage = "Vui lòng chọn danh mục!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Không chọn danh mục
		if (!$scope.form.brands || !$scope.form.brands.brandID) {
			$scope.errorMessage = "Vui lòng chọn thương hiệu!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		var productitem = angular.copy($scope.form);
		$http.put('/rest/products/' + productitem.productID, productitem).then(resp => {
			var index = $scope.productitems.findIndex(p => p.productID == productitem.productID);
			resp.data.createDate = new Date(resp.data.createDate);
			$scope.productitems[index] = productitem;
			$scope.messageSuccess = "Cập nhật thành công";
			$scope.initialize();
			$('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			$scope.errorMessage = "Cập nhật thất bại";
			$('#errorModal').modal('show'); // Show the modal
			$scope.initialize();
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
			$scope.messageSuccess = "Xóa thành công";
			$scope.initialize();
			$('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			$scope.errorMessage = "Xóa thất bại";
			$('#errorModal').modal('show'); // Show the modal
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
		get productitems() {
			var start = this.page * this.size;
			return $scope.productitems.slice(start, start + this.size);
		},
		get count() {
			return Math.ceil(1.0 * $scope.productitems.length / this.size);
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