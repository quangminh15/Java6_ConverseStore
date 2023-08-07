app.controller("variant-ctrl", function($scope, $http) {
	$scope.variantitems = [];
	$scope.cates = [];
	$scope.sizs = [];
	$scope.cols = [];
	$scope.prods = [];
	$scope.form = {};
	$scope.form.products = {};
	$scope.form.sizes = {};
	$scope.form.colors = {};
	$scope.errorMessage = '';
	$scope.initialize = function() {
		//load ProductVariants
		$http.get("/rest/productvariants").then(resp => {
			$scope.variantitems = resp.data;
		});

		//load color
		$http.get("/rest/colors").then(resp => {
			$scope.cols = resp.data;
		});

		//load brands
		$http.get("/rest/brands").then(resp => {
			$scope.brans = resp.data;
		});

		//load product
		$http.get("/rest/products").then(resp => {
			$scope.prods = resp.data;
			$scope.productitems.forEach(productitem => {
				productitem.createDate = new Date(productitem.createDate)
			})
		});

		//load category
		$http.get("/rest/colors").then(resp => {
			$scope.cates = resp.data;
		});

		//load size
		$http.get("/rest/sizes").then(resp => {
			$scope.sizs = resp.data;
		});
	}

	//	Xóa form
	$scope.reset = function() {
		$scope.form = {
			quantity: 0,
		};
	}
	//	Khởi đầu
	$scope.initialize();
	$scope.reset();

	//	Hiển thị lên form
	$scope.edit = function(variantitem) {
		$scope.form = angular.copy(variantitem);
	}

	function checkDuplicateVariant(variantitem) {
		// Kiểm tra sự trùng lặp dựa trên productID, sizeID và colorID
		var isDuplicate = $scope.variantitems.some(function(item) {
			return (
				item.products.productID === variantitem.products.productID &&
				item.sizes.sizeID === variantitem.sizes.sizeID &&
				item.colors.colorID === variantitem.colors.colorID
			);
		});

		return isDuplicate;
	}


	//	Thêm màu mới 
	$scope.create = function() {
		//Không chọn sản phẩm
		if (!$scope.form.products || !$scope.form.products.productID) {
			$scope.errorMessage = "Vui lòng chọn sản phẩm!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Không chọn size
		if (!$scope.form.sizes || !$scope.form.sizes.sizeID) {
			$scope.errorMessage = "Vui lòng chọn size!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Không chọn màu
		if (!$scope.form.colors || !$scope.form.colors.colorID) {
			$scope.errorMessage = "Vui lòng chọn màu!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Lỗi số lượng sản phẩm < 0
		if ($scope.form.quantity < 0) {
			$scope.errorMessage = "Vui lòng nhập số lượng sản phẩm lớn hơn 0!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Lỗi số lượng sản phẩm > 100.000
		if ($scope.form.quantity > 100000) {
			$scope.errorMessage = "Vui lòng nhập số lượng sản phẩm nhỏ hơn 100.000!!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		// Kiểm tra sự trùng lặp
		var isDuplicate = checkDuplicateVariant($scope.form);
		if (isDuplicate) {
			$scope.errorMessage = "Sản phẩm này đã tồn tại với màu và kích thước đã chọn!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		var variantitem = angular.copy($scope.form);
		$http.post('/rest/productvariants', variantitem).then(resp => {
			$scope.variantitems.push(resp.data);
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

	//	Cập nhật màu 
	$scope.update = function() {
		//Không chọn sản phẩm
		if (!$scope.form.products || !$scope.form.products.productID) {
			$scope.errorMessage = "Vui lòng chọn sản phẩm!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Không chọn size
		if (!$scope.form.sizes || !$scope.form.sizes.sizeID) {
			$scope.errorMessage = "Vui lòng chọn size!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}

		//Không chọn màu
		if (!$scope.form.colors || !$scope.form.colors.colorID) {
			$scope.errorMessage = "Vui lòng chọn màu!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}
		var variantitem = angular.copy($scope.form);
		$http.put('/rest/productvariants/' + variantitem.variantID, variantitem).then(resp => {
			var index = $scope.variantitems.findIndex(p => p.variantID == variantitem.variantID);
			$scope.variantitems[index] = variantitem;
			$scope.messageSuccess = "Cập nhật thành công";
			$('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			$scope.errorMessage = "Cập nhật thất bại";
			$('#errorModal').modal('show'); // Show the modal
			console.log("Error", error);
		})
	}

	//	Xóa màu
	$scope.delete = function(variantitem) {
		$http.delete('/rest/productvariants/' + variantitem.variantID).then(resp => {
			var index = $scope.variantitems.findIndex(p => p.variantID == variantitem.variantID);
			console.log(variantitem.variantID); // Sửa variantID thành variantitem.variantID
			$scope.variantitems.splice(index, 1);
			$scope.reset();
			$scope.messageSuccess = "Xóa thành công";
			$('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			$scope.errorMessage = "Xóa thất bại";
			$('#errorModal').modal('show'); // Show the modal
			console.log("Error", error);
		})
	}

	//	Phân trang
	$scope.pager = {
		page: 0,
		size: 20,
		get variantitems() {
			var start = this.page * this.size;
			return $scope.variantitems.slice(start, start + this.size);
		},
		get count() {
			return Math.ceil(1.0 * $scope.variantitems.length / this.size);
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