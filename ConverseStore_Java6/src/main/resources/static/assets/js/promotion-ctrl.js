app.controller("promotion-ctrl", function($scope, $http){
    $scope.items = [];
    $scope.form = {};
	$scope.errorMessage = "";
    $scope.initialize = function(){
        //load promotions
        $http.get("/admin/promotions").then(resp => {
            $scope.items = resp.data;
            $scope.items.forEach(item => {
                item.startDate = new Date(item.startDate),
				item.endDate = new Date(item.endDate)
            })
        });
    }

    $scope.initialize();

    //xoa form
    $scope.reset = function(){
        $scope.form = {
            startDate: new Date(),
			endDate: new Date()
        };
    }

    //hien thi len form
    $scope.edit = function(item){
        $scope.form = angular.copy(item);
    }

    //them promotions
    $scope.create = function() {
		//bo trong ten khuyen mai
		if (!$scope.form.promotionName) {
			$scope.errorMessage = "Vui lòng nhập tên khuyến mãi!!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		//loi trung
		let existingPromotion = $scope.items.find(item => item.promotionName === $scope.form.promotionName);
		if (existingPromotion) {
			$scope.errorMessage = "Tên khuyến mãi đã tồn tại!!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		//bo trong giam gia
		if (!$scope.form.discount) {
			$scope.errorMessage = "Vui lòng nhập giá giảm!!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		} else if (!/^(100|[0-9]{1,2})$/.test($scope.form.discount)) {
			$scope.errorMessage = "Giảm giá 0 đến 100!!!";
            $('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}
		// Kiểm tra ngày bắt đầu
		if (!$scope.form.startDate) {
			$scope.errorMessage = "Vui lòng chọn ngày bắt đầu!!!";
            $('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}
		//lay ngay hien tai
		const currentDate = new Date();
		//lay ngay bat dau
		const startDate = new Date($scope.form.startDate);

		if (startDate < currentDate) {
			$scope.errorMessage = "Ngày bắt đầu phải lớn hơn ngày hiện tại!!";
            $('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}
		// Kiểm tra ngày ket thuc
		if (!$scope.form.endDate) {
			$scope.errorMessage = "Vui lòng chọn ngày kết thúc!!";
            $('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}

		//lay ngay ket thuc
		const endDate = new Date($scope.form.endDate);

		if (endDate < currentDate) {
			$scope.errorMessage = "Ngày kết thúc phải lớn ngày hiện tại!!";
            $('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}
		//ngay ket thuc nho hon ngay bat dau
		if (endDate < startDate) {
			$scope.errorMessage = "Ngày kết thúc phải lớn hơn ngày bắt đầu!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		//ngay bat dau bang ngay ket thuc
		if (endDate.getTime() === startDate.getTime()) {
			$scope.errorMessage = "Ngày kết thúc phải khác ngày bắt đầu!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		// Kiểm tra ngày mo ta
		if (!$scope.form.describe) {
			$scope.errorMessage = "Vui lòng nhập mô tả!!";
            $('#errorModal').modal('show'); // Show the modal
			return; // Ngừng thực hiện hàm nếu có lỗi
		}
		let newItem = angular.copy($scope.form);
		$http.post(`/admin/promotions`, newItem).then(response => {
			let data = response.data;
			data.startDate = new Date(data.startDate);
			data.endDate = new Date(data.endDate);
			$scope.items.push(data);
			$scope.reset();
			$scope.messageSuccess = "Thêm thành công khuyến mãi";
            $('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			alert("Lỗi");
			console.log("Error", error);
		});
	}

    //cap nhat promotion
    $scope.update = function(){
        var item = angular.copy($scope.form);
        $http.put(`/admin/promotions/${item.promotionID}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.promotionID == item.promotionID);
            $scope.items[index] = item;
            $scope.messageSuccess = "Cập nhật thành công khuyến mãi";
            $('#errorModal1').modal('show'); // Show the modal
        }).catch(error => {
            alert("Loi cap nhat");
            console.log("Error", error);
        })
    }

    //xoa promotions
    $scope.delete = function(item){
        var item = angular.copy($scope.form);
        $http.delete(`/admin/promotions/${item.promotionID}`).then(resp => {
            var index = $scope.items.findIndex(p => p.promotionID == item.promotionID);
            $scope.items.splice(index, 1);
            $scope.reset();
            $scope.messageSuccess = "Xóa thành công khuyến mãi";
            $('#errorModal1').modal('show'); // Show the modal
        }).catch(error => {
            alert("Loi xoa");
            console.log("Error", error);
        })
    }

    //pager
    $scope.pager = {
        page: 0,
        size: 5,
        get items(){
            var start = this.page * this.size;
            return $scope.items.slice(start, start + this.size);
        },
        get count(){
            return Math.ceil(1.0 * $scope.items.length / this.size);
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