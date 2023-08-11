const app = angular.module("app", []);
app.controller("shopping-cart-ctrl", ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {

	$scope.showAlert = false;
	//----------------------TOAST----------------------------
	
	//Commnet
	$scope.insertComment = function(productID, comment) {
		$http.post(`/rest/comments/addComment?id=${productID}&comment=${comment}`)
			.then(function(response) {
				console.log(response)
            })
			.catch(function(error) {
				console.error('Error:', error);
			});
			
	}
	
	/*
		Quan ly gio hang
	 */
	$scope.addToCart = function (id, size, color, qty) {

		$http.post(`/rest/cart?id=${id}&size=${size}&color=${color}&qty=${qty}`)
			// Nếu không sử dụng Object data cho phương thức bên RestController
			// Thì gán thằng biến lên URL --> truyền data cho @RequestParam(...)
			.then(function (response) {
				console.log('Added to cart: hehe boiii');
				$scope.itemQuantity = qty;
				$scope.showAlert = true;
				//alert("Đã thêm " + qty + " sản phẩm giỏ hàng")
				// Hide the alert after 5 seconds
				$timeout(function () {
					$scope.showAlert = false;
					console.log("time is")
				}, 5000);
			})



			.catch(function (error) {
				console.error('Failed to add to cart:', error);
			});

	};

//load cart
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
				.catch(function (error) {
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
	//xoa cart Item
	$scope.delete = function(item) {
		$http.delete('/rest/cart/delete/' + item.cartItemId).then(resp => {
			var index = $scope.cart.cartItems.findIndex(p => p.cartId == item.cartItemId);
			$scope.items.splice(index, 1);
			$scope.cart.getCartItem();
			$scope.message = "Xóa thành công";
				$scope.showAlert = true;
				//alert("Đã thêm " + qty + " sản phẩm giỏ hàng")
				// Hide the alert after 5 seconds
				$timeout(function () {
					$scope.showAlert = false;
					console.log("time is")
				}, 5000);// Show the modal
		}).catch(error => {
			// Show the modal
			console.log("Error", error);
		})
	}
//tao hoa don
	$scope.createOrder = function (name, address, phone) {
		const tongtien = parseFloat($scope.cart.amount);
		console.log(tongtien);
		if (!$scope.name) {
			$scope.errorMessage = "Vui lòng nhập tên !";
			$('#errorModal').modal('show'); // Show the modal
			return;
		} if (!$scope.phone) {
			$scope.errorMessage = "Vui lòng nhập số điện thoại!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}if (!$scope.address) {
			$scope.errorMessage = "Vui lòng nhập địa chỉ!";
			$('#errorModal').modal('show'); // Show the modal
			return;
		}else {
			$http.post(`/rest/order?name=${name}&address=${address}&phone=${phone}&tongtien=${tongtien}`).then(function (response) {
				console.log('Order created successfully');
				$scope.messageSuccess = "Đã đặt hàng thành công";
			$('#errorModal1').modal('show'); // Show the modal
			return;
			})
				.catch(function (error) {
					console.error('Error creating order:', error.data);
					// Additional error handling
				});
		}
	}

	$scope.updateQuantity = function (id, qty) {

		var data = { qty: qty };  // Create a data object with the quantity

		$http.post(`/rest/cart/update?id=${id}`, data, {
			headers: { 'Content-Type': 'application/json' }
		})
			.then(function (response) {
				console.log('Updated quantity:', qty);
				// Update the quantity for the corresponding cart item
				var updatedItem = $scope.cart.cartItems.find(item => item.cartItemId === id);
				if (updatedItem) {
					updatedItem.quantity = qty;
					// Recalculate the amount for the updated item
					updatedItem.amount = $scope.calculateAmount(updatedItem.productVariant.products.price, qty);
				}
				// Manually trigger the digest cycle
				//$scope.$apply();
			})
			.catch(function (error) {
				if (error.status === 400) {
					console.error('Bad request:', error.data);
				} else {
					console.error('Failed to update quantity:', error);
				}
			});
	};
	$scope.validateAndUpdateQuantity = function (item) {
		var maxQuantity = item.productVariant.quantity;
		var qty = item.qty;

		if (qty == null) {
			item.qty = 1;
		}
		if (qty > maxQuantity) {
			$scope.message = "Số lượng vượt quá giới hạn trong kho";
				$scope.showAlert2 = true;
				//alert("Đã thêm " + qty + " sản phẩm giỏ hàng")
				// Hide the alert after 5 seconds
				$timeout(function () {
					$scope.showAlert2 = false;
					console.log("time is")
				}, 5000);// Show the modal
			item.qty = maxQuantity;
			$scope.updateQuantity(item.cartItemId, maxQuantity);
		} else {
			$scope.updateQuantity(item.cartItemId, qty);
		}
	};
	// Function to calculate the updated amount based on price and quantity
	$scope.calculateAmount = function (price, qty) {
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

    $scope.initialize();
    $scope.favo = {
        items: [],
        add(id){
            // Truyền dữ liệu qua body của request
            var existingItem = $scope.items.find(itemss => itemss.productID === id);
        if (!existingItem){
			$http.post(`/rest/favorite?id=${id}`).then(resp => {
    		console.log("thuy than c6");
    		$scope.favoriteCount++;
	}).catch(function(error) {
   			 console.log(error); 
		});
	}

	$scope.initialize();
	$scope.favo = {
		items: [],
		add(id) {
			// Truyền dữ liệu qua body của request
			var existingItem = $scope.items.find(item => item.productID === id);
			if (!existingItem) {
				$http.post(`/rest/favorite?id=${id}`).then(resp => {
					console.log("thuy than c6");
					$scope.favoriteCount++;
				}).catch(function (error) {
					console.log(error);
				});
			} else {
				console.log("Item already exists.");
				delete (id);
				$scope.favoriteCount--;
			}

		},
		delete(id) {
			// Gọi API để xóa yêu thích dựa trên id
			$http.delete(`/rest/favorite/${id}`).then(resp => {
				console.log("Xóa thành công");
				// Gọi lại hàm initialize để cập nhật danh sách yêu thích sau khi xóa
				$scope.initialize();
			}).catch(function (error) {
				console.log("Lỗi khi xóa", error);
			});
		}
	};
            
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
        },
    };
}])