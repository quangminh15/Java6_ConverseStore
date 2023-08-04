app.controller("comment-ctrl", function($scope, $http) {
	$scope.comments = [];
	$scope.customers = [];
	$scope.employees = [];
	$scope.products = [];
	$scope.form ={}
	
	$scope.initialize = function() {
		//load comments
		$http.get("/rest/comments").then(resp => {
			$scope.comments = resp.data;
			$scope.comments.forEach(cmt => {
				cmt.createDate = new Date(cmt.createDate)
			})
		});
		$http.get("/rest/products").then(resp => {
			$scope.products = resp.data;
		});
		$http.get("/rest/employees").then(resp => {
			$scope.employees = resp.data;
		});
		$http.get("/rest/customers").then(resp => {
			$scope.customers = resp.data;
		});
		}
		
		$scope.edit = function(comment){
			$scope.form = angular.copy(comment)
		} 
		
		$scope.reset = function(){
			$scope.form = {
				createDate: new Date(),
				dateReply: new Date(),
				hidden: true,
				status: false,
			}
		}
		$scope.initialize();
		$scope.reset();
		
		//	Cập nhật sản phẩm 
	$scope.update = function() {
		var cmt = angular.copy($scope.form);
		$http.put('/rest/comments/' + cmt.commentID, cmt).then(resp => {
			var index = $scope.comments.findIndex(p => p.commentID == cmt.commentID);
			resp.data.createDate = new Date(resp.data.createDate);
			$scope.comments[index] = cmt;
			alert("Cập nhật thành công");
		}).catch(error => {
			alert("Cập nhật thất bại!");
			console.log("Error", error);
		})
	}

	//	Xóa sản phẩm 
	$scope.delete = function(cmt) {
		$http.delete('/rest/comments/' + cmt.commentID).then(resp => {
			var index = $scope.comments.findIndex(p => p.commentID == cmt.commentID);
			console.log(cmt.commentID); // Sửa productID thành productitem.productID
			$scope.comments.splice(index, 1);
			$scope.reset();
			alert("Xóa thành công");
		}).catch(error => {
			alert("Xóa thất bại!");
			console.log("Error", error);
		})
	}
		
		//	Phân trang
	$scope.pager = {
		page: 0,
		size: 10,
		get productitems() {
			var start = this.page * this.size;
			return $scope.productitems.slice(start, start + this.size);
		},
		get count(){
			return Math.ceil(1.0 * $scope.productitems.length / this.size);
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