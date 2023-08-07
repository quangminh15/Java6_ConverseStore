/*const app = angular.module("favorite-app", []);
app.controller("favorite-ctrl", function($scope, $http){
	$scope.favo = {
		items: [],
		add(id){
        	$http.post(`/rest/favorite?id=${id}`).then(resp => {  	
				console.log("thuy than c6");
        }).catch(function(error) {
			console.log(error);
		})
			
		
	},

	}	
})*/

const app = angular.module("favorite-app", []);

app.controller("favorite-ctrl", function($scope, $http){
	$scope.favoriteCount = 0;
	$scope.initialize = function(){
        //load promotions
        $http.get("/rest/favorite").then(resp => {
            $scope.items = resp.data;
            $scope.favoriteCount = $scope.items.length;
        });
    }

    $scope.initialize();
    $scope.favo = {
        items: [],
        add(id){
            // Truyền dữ liệu qua body của request
            var existingItem = $scope.items.find(item => item.productID === id);
        if (!existingItem){
			$http.post(`/rest/favorite?id=${id}`).then(resp => {
    		console.log("thuy than c6");
    		$scope.favoriteCount++;
	}).catch(function(error) {
   			 console.log(error);
   			 $scope.favoriteCount--; 
		});
		}else{
			console.log("Item already exists.");
			$scope.favoriteCount--;
		}
            
        },
        delete(id){
            // Gọi API để xóa yêu thích dựa trên id
            $http.delete(`/rest/favorite/${id}`).then(resp => {
                console.log("Xóa thành công");
                // Gọi lại hàm initialize để cập nhật danh sách yêu thích sau khi xóa
                $scope.initialize();
            }).catch(function(error) {
                console.log("Lỗi khi xóa", error);
            });
        }
    };
});