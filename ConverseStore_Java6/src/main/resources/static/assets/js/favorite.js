const app = angular.module("favorite-app", []);
app.controller("favorite-ctrl", function($scope, $http){
	$scope.favo = {
		items: [],
		
		add(id){
    var item = this.items.find(item => item.productID == productID);
    if(item){
        this.saveToDatabase(item);
    }else{
        $http.get(`/rest/favorite/${id}`).then(resp => {
            this.items.push(resp.data);
            this.saveToDatabase(resp.data); // Sửa đổi ở đây
        })
    }
},

        saveToDatabase(item) {
    $http.post('/rest/favorite', item).then(resp => {
        console.log('them thanh cong', resp.data);
    }).catch(error => {
        console.error('loi them', error);
    });
}

	}	
})