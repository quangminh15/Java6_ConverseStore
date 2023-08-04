app.controller("color-ctrl", function($scope, $http) {
	$scope.coloritems = [];
	$scope.cates = [];
	$scope.brans = [];
	$scope.form = {};
	$scope.errorMessage = '';
	$scope.initialize = function() {
		//load color
		$http.get("/rest/colors").then(resp => {
			$scope.coloritems = resp.data;
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
		
		//load category
		$http.get("/rest/colors").then(resp => {
			$scope.cates = resp.data;
		});
	}

	//	Xóa form
	$scope.reset = function() {
		$scope.form = {
			colorActivities: false,
		};
	}
	//	Khởi đầu
	$scope.initialize();
	$scope.reset();

	//	Hiển thị lên form
	$scope.edit = function(coloritem) {
		$scope.form = angular.copy(coloritem);
	}

	//	Thêm màu mới 
	$scope.create = function() {
    var coloritem = angular.copy($scope.form);
    $http.post('/rest/colors', coloritem).then(resp => {
			$scope.coloritems.push(resp.data);
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
		var coloritem = angular.copy($scope.form);
		$http.put('/rest/colors/' + coloritem.colorID, coloritem).then(resp => {
			var index = $scope.coloritems.findIndex(p => p.colorID == coloritem.colorID);
			$scope.coloritems[index] = coloritem;
			alert("Cập nhật thành công");
		}).catch(error => {
			alert("Cập nhật thất bại!");
			console.log("Error", error);
		})
	}

	//	Xóa màu
	$scope.delete = function(coloritem) {
		$http.delete('/rest/colors/' + coloritem.colorID).then(resp => {
			var index = $scope.coloritems.findIndex(p => p.colorID == coloritem.colorID);
			console.log(coloritem.colorID); // Sửa colorID thành coloritem.colorID
			$scope.coloritems.splice(index, 1);
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
		size: 10,
		get coloritems() {
			var start = this.page * this.size;
			return $scope.coloritems.slice(start, start + this.size);
		},
		get count(){
			return Math.ceil(1.0 * $scope.coloritems.length / this.size);
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