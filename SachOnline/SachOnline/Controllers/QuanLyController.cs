using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;
using System.Security.Cryptography;

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
        public string GetMD5(string chuoi)
        {
            string str_md5 = "";
            byte[] mang = System.Text.Encoding.UTF8.GetBytes(chuoi);

            MD5CryptoServiceProvider my_md5 = new MD5CryptoServiceProvider();
            mang = my_md5.ComputeHash(mang);

            foreach (byte b in mang)
            {
                str_md5 += b.ToString("x2");//Nếu là "X2" thì kết quả sẽ tự chuyển sang ký tự in Hoa
            }

            return str_md5;
        }

    }
}