const app = angular.module("shopping-cart-app", []);
app.controller("shopping-cart-ctrl", function($scope, $http) {

	/*
		Quan ly gio hang
	 */
	$scope.cart = {
		items: [],
		//them vao gio hang
		add(id) {
			var item = this.items.find(item => item.id == id)
			if (item) {
				item.qty++;
				this.saveToLocalStorage()
			}
			else {
				$http.get(`/rest/products/${id}`).then(resp => {
					resp.data.qty = 1;
					this.items.push(resp.data)
					this.saveToLocalStorage()
				})
			}
		},
		remove(id){
			var index = this.items.find(item=>item.id == id)
			this.items.splice(index, 1);
			this.saveToLocalStorage();
		},
		clear(){
			this.items=[]
			this.saveToLocalStorage();
		},
		//dem san pham
		get count() {
			return this.items.map(item => item.qty)
				.reduce((total, qty) => total += qty, 0)
		},
		//tong tien
		get amount() {
			return this.items.map(item => item.qty * item.price )
				.reduce((total, qty) => total += qty, 0)
		}
		,//them vao local
		saveToLocalStorage() {
			var json = JSON.stringify(angular.copy(this.items))
			localStorage.setItem("cart", json);
		},
		//hien thi tu local
		loadFromLocalStorage(){
			var json = localStorage.getItem("cart")
			this.items = json ? JSON.parse(json):[]
		}

	}
	$scope.cart.loadFromLocalStorage();
})