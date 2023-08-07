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
	
	// Tìm kiếm màu sản phẩm 
    $scope.searchColorByName = function() {
        if ($scope.searchKeyword && $scope.searchKeyword.trim() !== "") {
            $http.get("/rest/colors/search", {
                params: { keyword: $scope.searchKeyword }
            }).then(resp => {
                $scope.coloritems = resp.data;
            }).catch(error => {
               
                $scope.errorMessage = "Lỗi khi tìm kiếm màu sản phẩm!";
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
		//Bỏ trống tên màu
		if (!$scope.form.colorName) {
			$scope.errorMessage = "Vui lòng nhập màu của sản phẩm!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		
		// Kiểm tra trùng màu
		let existingMau = $scope.coloritems.find(coloritem => coloritem.colorName === $scope.form.colorName);
		if (existingMau) {
			$scope.errorMessage = "Màu này đã tồn tại!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		
    var coloritem = angular.copy($scope.form);
    $http.post('/rest/colors', coloritem).then(resp => {
			$scope.coloritems.push(resp.data);
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
		//Bỏ trống tên màu
		if (!$scope.form.colorName) {
			$scope.errorMessage = "Vui lòng nhập màu của sản phẩm!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		
		var coloritem = angular.copy($scope.form);
		$http.put('/rest/colors/' + coloritem.colorID, coloritem).then(resp => {
			var index = $scope.coloritems.findIndex(p => p.colorID == coloritem.colorID);
			$scope.coloritems[index] = coloritem;
			$scope.messageSuccess = "Cập nhật thành công";
            $('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			 $scope.errorMessage = "Cập nhật thất bại";
            $('#errorModal').modal('show'); // Show the modal
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