using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;
using System.Data.Entity;

namespace SachOnline.Controllers
{
    public class UserController : Controller
    {
        SachOnlineEntities db = new SachOnlineEntities();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Dangky()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangKy(KhachHang kh)
        {

            if (ModelState.IsValid)
            {
                kh.MatKhau = Encryptor.MD5Hash(kh.MatKhau);
                db.KhachHangs.Add(kh);
                db.SaveChanges();
                Session["TaiKhoan"] = kh;
                Session["id"]=kh.maKH;
                Session["hoten"] = kh.HoTen;
                return Redirect(Url.Action("Index", "Home"));
            }

            return View();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {

            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            string sTaiKhoan = f.Get("username").ToString();
            string sMatKhau = Encryptor.MD5Hash(f.Get("password").ToString());
            KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan && n.MatKhau == sMatKhau);
            if (kh != null)
            {
                ViewBag.ThongBao = "Đăng Nhập Thành Công !";
                Session["TaiKhoan"] = kh;
                Session["id"]=kh.maKH;
                Session["hoten"] = kh.HoTen;

                return Redirect(Url.Action("Index", "Home"));
            }

            ViewBag.ThongBao = "Đăng Nhập Không Thành Công!";
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int maKH)
        {
            KhachHang kh = new KhachHang();
            kh = db.KhachHangs.Find(maKH);
            if (kh != null)
            {
                if (Session["TaiKhoan"] == kh)
                {
                    return View(kh);
                }
                else
                {
                    Response.StatusCode = 404;
                    return Redirect(Url.Action("Index", "Home"));
                }
            }
            return Redirect(Url.Action("Index", "Home"));


        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(KhachHang kh)
        {
            var user = db.KhachHangs.SingleOrDefault(n => n.MaKH == kh.MaKH);
            user.HoTen = kh.HoTen;
            user.DiaChi = kh.DiaChi;
            user.Email = kh.Email;
            user.GioiTinh = kh.GioiTinh;
            user.DienThoai = kh.DienThoai;
            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
            return Redirect(Url.Action("Index", "Home"));

        }

    }
}
