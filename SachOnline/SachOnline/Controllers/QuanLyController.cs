using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;

namespace SachOnline.Controllers
{
    public class QuanLyController : Controller
    {
        SachOnlineEntities db = new SachOnlineEntities();
        // GET: QuanLy
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Dangky() {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangKy(KhachHang kh) {
            if (ModelState.IsValid)
            {
                db.KhachHangs.Add(kh);
                db.SaveChanges();
            }
 
            return View();
        }
        [HttpGet]
        public ActionResult DangNhap() {

            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f) {
            string sTaiKhoan = f.Get("username").ToString();
            string sMatKhau = f.Get("password").ToString();
            KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan && n.MatKhau == sMatKhau);
            if (kh != null)
            {
                ViewBag.ThongBao = "Đăng Nhập Thành Công !";
                Session["TaiKhoan"] = kh.MaKH;
                Session["hoten"] = kh.HoTen;
                return View();
            }
            ViewBag.ThongBao = "Đăng Nhập Không Thành Công!";     
                return View();
        }
    }
}