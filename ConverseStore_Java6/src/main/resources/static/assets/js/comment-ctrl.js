app.controller("comment-ctrl", function($scope, $http) {
	$scope.commentitems = [];
	$scope.customers = [];
	$scope.employees = [];
	$scope.products = [];
	$scope.form = {};
	$scope.statusFilter = '';
	$scope.newCommentCount = 0;
	$scope.initialize = function() {
		$http.get("/rest/comments").then(resp => {
			$scope.commentitems = resp.data;
			$scope.commentitems.forEach(commentitem => {
				commentitem.createDate = new Date(commentitem.createDate)
//				commentitem.dateReply = new Date(commentitem.dateReply)
			})
		});

		$http.get("/rest/customers").then(resp => {
			$scope.customers = resp.data;
		});
		
		$http.get("/rest/products").then(resp => {
			$scope.products = resp.data;
		});
		
		$http.get("/rest/employees").then(resp => {
			$scope.employees = resp.data;
		});
	}
	// Bộ lọc
			$scope.filterStatus = function(commentitem) {
			if ($scope.statusFilter === '') {
				return true; // Hiển thị tất cả khi bộ lọc chưa được chọn
			} else if ($scope.statusFilter === 'approved') {
				return commentitem.status === true; // Chỉ hiển thị bình luận đã duyệt
			} else if ($scope.statusFilter === 'pending') {
				return commentitem.status === false; // Chỉ hiển thị bình luận chờ duyệt
			}
		};
		
		//Tìm kiếm
		$scope.search = function() {
    if ($scope.searchComment && $scope.searchComment.trim() !== "") {
        $http.get("/rest/comments/search", {
            params: { keyword: $scope.searchComment }
        }).then(resp => {
            if (resp.data.length > 0) {
                $scope.commentitems = resp.data;
            } else {
                // Hiển thị thông báo không tìm thấy kết quả
                alert("Không tìm thấy kết quả phù hợp.");
            }
        }).catch(error => {
            console.log("Error", error);
        });
    } else {
        $scope.initialize();
    }
};


	//	Xóa form
	$scope.reset = function() {
		$scope.form = {
			createDate: new Date(),
			dateReply: new Date(),
			hidden: true,
			status: false
		};
	}
	//	Khởi đầu
	$scope.initialize();
	$scope.reset();

	//	Hiển thị lên form
	$scope.edit = function(commentitem) {
		alert("Bạn đã chọn mã bình luận " + commentitem.commentID + ". Bạn có thể chỉnh sửa.");
		$scope.form = angular.copy(commentitem);
		document.getElementById("top").scrollIntoView({ behavior: "smooth" });
	}

	//Thêm
	$scope.create = function() {
	var commentitem = angular.copy($scope.form);
		$http.post('/rest/comments', commentitem).then(resp => {
			resp.data.createDate = new Date(resp.data.createDate);
			$scope.commentitems.push(resp.data);
			$scope.reset();
			alert("Thêm mới thành công")
			$scope.newCommentCount++;
		}).catch(error => {
			if (error.status === 400) {
				console.log("Lỗi")
			} else {
				console.log("Error", error);
			}
		});
	}
	
	//	Cập nhật sản phẩm 
	$scope.update = function() {
		var commentitem = angular.copy($scope.form);
		$http.put('/rest/comments/' + commentitem.commentID, commentitem).then(resp => {
			var index = $scope.commentitems.findIndex(p => p.commentID == commentitem.commentID);
			resp.data.createDate = new Date(resp.data.createDate);
			resp.data.dateReply = new Date(resp.data.dateReply);
			$scope.commentitems[index] = commentitem;
			alert("Cập nhật thành công");
		}).catch(error => {
			alert("Cập nhật thất bại!");
			console.log("Error", error);
		})
	}

	//	Xóa sản phẩm 
	$scope.delete = function(commentitem) {
    var confirmDelete = confirm("Bạn có chắc chắn muốn xóa bình luận này?");
    if (confirmDelete) {
        $http.delete('/rest/comments/' + commentitem.commentID).then(resp => {
            var index = $scope.commentitems.findIndex(p => p.commentID == commentitem.commentID);
            console.log(commentitem.commentID); // Sửa productID thành productitem.productID
            $scope.commentitems.splice(index, 1);
            $scope.reset();
            alert("Xóa thành công");
        }).catch(error => {
            alert("Xóa thất bại!");
            console.log("Error", error);
        });
    } else {
        // Người dùng chọn "Cancel", không thực hiện hành động xóa
        alert("Thao tác xóa đã bị hủy.");
    }
}

	//Nhấn enter
	$scope.handleKeyPress = function(event) {
    if (event.keyCode === 13) { // 13 is the key code for "Enter"
        $scope.search(); // Thực hiện tìm kiếm
    }
};

	//	Phân trang
	$scope.pager = {
    page: 0,
    size: 10,
    get commentitems() {
        var filteredItems = $scope.commentitems.filter($scope.filterStatus);
        var start = this.page * this.size;
        return filteredItems.slice(start, start + this.size);
    },
    get count() {
        var filteredItems = $scope.commentitems.filter($scope.filterStatus);
        return Math.ceil(1.0 * filteredItems.length / this.size);
    },
    first() {
        this.page = 0;
    },
    prev() {
        this.page--;
        if (this.page < 0) {
            this.last();
        }
    },
    next() {
        this.page++;
        if (this.page >= this.count) {
            this.first();
        }
    },
    last() {
        this.page = this.count - 1;
    },
};

 $scope.resetNewCommentCount = function() {
        $scope.newCommentCount = 0;
    };

})