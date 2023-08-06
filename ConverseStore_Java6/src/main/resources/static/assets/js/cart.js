const app = angular.module("shopping-cart-app", []);
app.controller("shopping-cart-ctrl", function($scope, $http) {

	/*
		Quan ly gio hang
	 */
	$scope.addToCart = function(id, size, color, qty) {

		$http.post(`/rest/cart?id=${id}&size=${size}&color=${color}&qty=${qty}`)
			// Nếu không sử dụng Object data cho phương thức bên RestController
			// Thì gán thằng biến lên URL --> truyền data cho @RequestParam(...)
			.then(function(response) {
				console.log('Added to cart: hehe boiii');
			})
			.catch(function(error) {
				console.error('Failed to add to cart:', error);
			});
	};
	$scope.cart = {
		cartItems: [],

		getCartItem() {
			$http.get(`/rest/cart`)

				.then(resp => {
					this.cartItems = resp.data;

					// Calculate the amounts for each item on first load
					this.cartItems.forEach(item => {
						this.getSubtotalForItem(item)
					});

					console.log(resp.data)

				})
				.catch(function(error) {
					console.error('Error fetching cart items:', error);
				});
		},
		get amount() {
			return this.cartItems.map(item => item.quantity * item.productVariant.products.price)
				.reduce((total, qty) => total += qty, 0)
		},
		get count() {
			return this.cartItems.map(item => item.quantity)
				.reduce((total, qty) => total += qty, 0)
		},
		getSubtotalForItem(item) {
        return item.quantity * item.productVariant.products.price;
    }
	};

	$scope.updateQuantity = function(id, qty) {

		var data = { qty: qty };  // Create a data object with the quantity

		$http.post(`/rest/cart/update?id=${id}`, data, {
			headers: { 'Content-Type': 'application/json' }
		})
			.then(function(response) {
				console.log('Updated quantity:', qty);
				// Update the quantity for the corresponding cart item
				var updatedItem = $scope.cart.cartItems.find(item => item.cartItemId === id);
				if (updatedItem) {
					updatedItem.quantity = qty;
					// Recalculate the amount for the updated item
					updatedItem.amount = $scope.calculateAmount(updatedItem.productVariant.products.price, qty);
				}
				// Manually trigger the digest cycle
				$scope.$apply();
			})
			.catch(function(error) {
				if (error.status === 400) {
					console.error('Bad request:', error.data);
				} else {
					console.error('Failed to update quantity:', error);
				}
			});
	};
	// Function to calculate the updated amount based on price and quantity
	$scope.calculateAmount = function(price, qty) {
		return price * qty;
	};



	// Function to update the amount in the scope
	function updateAmountInScope(cartItemId, qty) {
		var updatedItem = $scope.cart.cartItems.find(item => item.cartItemId === cartItemId);
		if (updatedItem) {
			updatedItem.amount = $scope.calculateAmount(updatedItem.productVariant.products.price, qty);
		}
	};



	$scope.cart.getCartItem();
})