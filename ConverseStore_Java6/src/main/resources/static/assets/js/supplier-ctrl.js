app.controller("supplier-ctrl", function($scope, $http){
    $scope.items = [];
    $scope.form = {};

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
		let newItem = angular.copy($scope.form);
		$http.post(`/admins/supplierss`, newItem).then(response => {
			let data = response.data;
			$scope.items.push(data);
			$scope.reset();
			alert("Thêm thành công");
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
            alert("Cap nhat thanh cong");
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
            alert("Xoa thanh cong");
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