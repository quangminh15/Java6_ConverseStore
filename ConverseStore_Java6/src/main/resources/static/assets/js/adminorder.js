app.controller("order-ctrl", function($scope, $http){
    
    $http.get("/rest/order/admin").then(resp => {
        $scope.items = resp.data;
    });
    $scope.getOne = function(item){
        $http.get("/rest/order/admin/"+item.orderId).then(resp => {
            $scope.itemsd = resp.data;
            console.log(resp.data)
        });
    }
    
    
    $scope.nearestDate = function(item) {
        var currentDate = new Date();
        var orderDate = new Date(item.orderdate);
        return Math.abs(currentDate - orderDate);
    };
})