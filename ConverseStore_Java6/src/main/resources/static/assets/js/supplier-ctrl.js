app.controller("supplier-ctrl", function($scope, $http){
    $scope.items = [];
   $scope.form = {
        supplierName: '',
        email: '',
        phone: '',
        address: '',
        statuss: true // Khởi tạo trạng thái ban đầu
    };

    $scope.initialize = function(){
        // Load suppliers
        $http.get("/admins/supplierss").then(resp => {
            $scope.items = resp.data;
        }).catch(error => {
            console.log("Error fetching suppliers:", error);
            // Xử lý lỗi ở đây (ví dụ: hiển thị thông báo lỗi)
        });
    }
    

    $scope.initialize();

    //xoa form
    $scope.reset = function(){
        $scope.form = {
            statuss: true
        };
    }

    //hien thi len form
    $scope.edit = function(item){
        $scope.form = angular.copy(item);
    }

    //them promotions
    $scope.create = function() {
		//loi bo trong 
		if (!$scope.form.supplierName) {
			$scope.errorMessage = "Vui lòng nhập tên nhà cung cấp!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		//loi trung
		let existingSupplier = $scope.items.find(item => item.supplierName === $scope.form.supplierName);
		if (existingSupplier) {
			$scope.errorMessage = "Tên nhà cung cấp đã tồn tại!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		//bo trong email
		if (!$scope.form.email) {
			$scope.errorMessage = "Vui lòng nhập email!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		} else if (!/\S+@\S+\.\S+/.test($scope.form.email)) {
			$scope.errorMessage = "Email không hợp lệ. Vui lòng nhập email chính xác!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}

		// Kiểm tra trùng email
		let existingEmail = $scope.items.find(item => item.email === $scope.form.email);
		if (existingEmail) {
			$scope.errorMessage = "Email đã tồn tại!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		//bo trong so dien thoai
		if (!$scope.form.phone) {
			$scope.errorMessage = "Vui lòng nhập số điện thoại!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		} else if (!/^0\d{9}$/.test($scope.form.phone)) {
			$scope.errorMessage = "Số điện thoại không hợp lệ!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}

		// Kiểm tra trùng số điện thoại
		let existingPhone = $scope.items.find(item => item.phone === $scope.form.phone);
		if (existingPhone) {
			$scope.errorMessage = "Số điện thoại đã tồn tại!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
		
		//bo trong dia chi
		if (!$scope.form.addresss) {
			$scope.errorMessage = "Vui lòng nhập địa chỉ!!";
            $('#errorModal').modal('show'); // Show the modal
			return;
		}
    
		let newItem = angular.copy($scope.form);
		$http.post(`/admins/supplierss`, newItem).then(response => {
			let data = response.data;
			$scope.items.push(data);
			$scope.reset();
			$scope.messageSuccess = "Thêm thành công nhà cung cấp";
            $('#errorModal1').modal('show'); // Show the modal
		}).catch(error => {
			alert("Lỗi");
			console.log("Error", error);
		});
	}

    //cap nhat promotion
    $scope.update = function(){
        var item = angular.copy($scope.form);
        $http.put(`/admins/supplierss/${item.supplierID}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.supplierID == item.supplierID);
            $scope.items[index] = item;
            $scope.messageSuccess = "Cập nhật thành công nhà cung cấp";
            $('#errorModal1').modal('show'); // Show the modal
        }).catch(error => {
            alert("Loi cap nhat");
            console.log("Error", error);
        })
    }

    //xoa promotions
    $scope.delete = function(item){
        var item = angular.copy($scope.form);
        $http.delete(`/admins/supplierss/${item.supplierID}`).then(resp => {
            var index = $scope.items.findIndex(p => p.supplierID == item.supplierID);
            $scope.items.splice(index, 1);
            $scope.reset();
            $scope.messageSuccess = "Xóa thành công nhà cung cấp";
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
        }
    }
});