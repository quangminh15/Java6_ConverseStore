app = angular.module("admin-app",["ngRoute"]);

app.config(function ($routeProvider){
	$routeProvider
	.when("/admin_danhmuc", {
		templateUrl: "/assets/admin/admin_DanhMuc.html",
		controller: "category-ctrl"
	})
	
	.when("/admin_thuonghieu", {
		templateUrl: "/assets/admin/admin_ThuongHieu.html",
		controller: "brand-ctrl"
	})
	
	.when("/admin_sanpham", {
		templateUrl: "/assets/admin/admin_SanPham.html",
		controller: "product-ctrl"
	})
	
	.when("/admin_sanphamCT", {
		templateUrl: "/assets/admin/admin_SanPhamCT.html",
		controller: "variant-ctrl"
	})
	
	.when("/admin_mau", {
		templateUrl: "/assets/admin/admin_Mau.html",
		controller: "color-ctrl"
	})
	
	.when("/admin_size", {
		templateUrl: "/assets/admin/admin_Size.html",
		controller: "size-ctrl"
	})
	.when("/admin_KhuyenMai", {
		templateUrl: "/assets/admin/admin_KhuyenMai.html",
		controller: "promotion-ctrl"
	})
	.when("/admin_NhaCungCap", {
		templateUrl: "/assets/admin/admin_NhaCungCap.html",
		controller: "supplier-ctrl"
	})
	.when("/admin_binhluan", {
		templateUrl: "/assets/admin/admin_BinhLuan.html",
		controller: "comment-ctrl"
	})
	.when("/admin_thongkedm", {
		templateUrl: "/assets/admin/reportcates.html",
		controller: "reportcate-ctrl"
	})
	.when("/admin_thongkeyeuthich", {
		templateUrl: "/assets/admin/admin_ThongKe.html",
		controller: "reportfavorite-ctrl"
	})
	.when("/admin_chitietorder", {
		templateUrl: "/assets/admin/admin_ChiTietDonHang.html",
		controller: "order-ctrl"
	}).when("/admin_donhang", {
		templateUrl: "/assets/admin/admin_DonHang.html",
		controller: "order-ctrl"
	})
	.otherwise({
		templateUrl: "/assets/admin/admin_SanPham.html",
		controller: "product-ctrl"
	})
})
