using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace SachOnline
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");


            routes.MapRoute(
            name: "DangNhap",
            url: "dang-nhap",
            defaults: new { controller = "User", action = "DangNhap", id = UrlParameter.Optional },
            namespaces: new[] { "SachOnline.Controllers" }
            );
            routes.MapRoute(
            name: "DangKy",
            url: "dang-ky",
            defaults: new { controller = "User", action = "DangKy", id = UrlParameter.Optional },
            namespaces: new[] { "SachOnline.Controllers" }
            );
            routes.MapRoute(
            name: "TheLoai",
            url: "the-loai/{matheloai}-{page}",
            defaults: new { controller = "Sach", action = "SachTheoTheloai", matheloai = UrlParameter.Optional, page = UrlParameter.Optional },
            namespaces: new[] { "SachOnline.Controllers" }
            );
            routes.MapRoute(
            name: "NhaXuatBan",
            url: "NXB/{maNXB}-{page}",
            defaults: new { controller = "Sach", action = "SachTheoNXB", maNXB = UrlParameter.Optional, page = UrlParameter.Optional },
            namespaces: new[] { "SachOnline.Controllers" }
            );
            routes.MapRoute(
            name: "ChiTiet",
            url: "sach/{masach}",
            defaults: new { controller = "Sach", action = "ChiTietSach", masach = UrlParameter.Optional },
            namespaces: new[] { "SachOnline.Controllers" }
            );
            routes.MapRoute(
           name: "GioHang",
           url: "gio-hang",
           defaults: new { controller = "GioHang", action = "GioHang", masach = UrlParameter.Optional },
           namespaces: new[] { "SachOnline.Controllers" }
           );
            routes.MapRoute(
          name: "DatHang",
          url: "dat-hang",
          defaults: new { controller = "GioHang", action = "DatHang", masach = UrlParameter.Optional },
          namespaces: new[] { "SachOnline.Controllers" }
          );
            routes.MapRoute(
            name: "Default",
            url: "{controller}/{action}/{id}",
            defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }

    }
}
