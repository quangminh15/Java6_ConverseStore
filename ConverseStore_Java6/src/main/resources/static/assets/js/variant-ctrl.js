app.controller("variant-ctrl", function($scope, $http) {
	$scope.variantitems = [];
	$scope.cates = [];
	$scope.sizs = [];
	$scope.cols = [];
	$scope.prods = [];
	$scope.form = {};
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

	//	Thêm màu mới 
	$scope.create = function() {
    var variantitem = angular.copy($scope.form);
    $http.post('/rest/productvariants', variantitem).then(resp => {
			$scope.variantitems.push(resp.data);
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
		var variantitem = angular.copy($scope.form);
		$http.put('/rest/productvariants/' + variantitem.variantID, variantitem).then(resp => {
			var index = $scope.variantitems.findIndex(p => p.variantID == variantitem.variantID);
			$scope.variantitems[index] = variantitem;
			alert("Cập nhật thành công");
		}).catch(error => {
			alert("Cập nhật thất bại!");
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
			alert("Xóa thành công");
		}).catch(error => {
			alert("Xóa thất bại!");
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
		get count(){
			return Math.ceil(1.0 * $scope.variantitems.length / this.size);
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