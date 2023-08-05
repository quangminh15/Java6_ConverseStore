app.controller("promotion-ctrl", function($scope, $http){
    $scope.items = [];
    $scope.form = {};

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
		let newItem = angular.copy($scope.form);
		$http.post(`/admin/promotions`, newItem).then(response => {
			let data = response.data;
			data.startDate = new Date(data.startDate);
			data.endDate = new Date(data.endDate);
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
        $http.put(`/admin/promotions/${item.promotionID}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.promotionID == item.promotionID);
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
        $http.delete(`/admin/promotions/${item.promotionID}`).then(resp => {
            var index = $scope.items.findIndex(p => p.promotionID == item.promotionID);
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