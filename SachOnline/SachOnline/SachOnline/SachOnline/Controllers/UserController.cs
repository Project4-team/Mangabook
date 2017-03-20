using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;
using System.Data.Entity;
using Model.EF;

namespace SachOnline.Controllers
{
    public class UserController : Controller
    {
        SachOnlineDbContext db = new SachOnlineDbContext();
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
                if (db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == kh.TaiKhoan) != null)
                {
                    ModelState.AddModelError("", "Tài khoản đã có người sử dụng");
                }
                else if (db.KhachHangs.SingleOrDefault(n => n.Email == kh.Email) != null)
                {
                    ModelState.AddModelError("", "Email đã có người sử dụng");
                }
                else
                {
                    if (kh.MatKhau != null)
                    {
                        kh.MatKhau = Encryptor.MD5Hash(kh.MatKhau);
                    }
                    kh.NgayTao = DateTime.Now;
                    db.KhachHangs.Add(kh);
                    db.SaveChanges();
                    Session["TaiKhoan"] = kh;
                    Session["id"] = kh.MaKH;
                    Session["hoten"] = kh.HoTen;
                    return Redirect(Url.Action("Index", "Home"));
                }
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
            System.Threading.Thread.Sleep(1000);
            string sTaiKhoan = f.Get("username").ToString();
            string sMatKhau = Encryptor.MD5Hash(f.Get("password").ToString());
            KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan && n.MatKhau == sMatKhau);
            if (kh != null)
            {
                ViewBag.ThongBao = "Tên tài khoản hoặc mật khẩu không đúng!";
                Session["TaiKhoan"] = kh;
                Session["id"] = kh.MaKH;
                Session["hoten"] = kh.HoTen;

                return PartialView("ThongBao", "Dang Nhap thanh cong");
            }
            ModelState.AddModelError("", "Tên tài khoản hoặc mật khẩu không đúng!");
           
            return PartialView("ThongBao","Dang Nhap khong thanh cong");
        }
        [HttpGet]
        public ActionResult Edit(int maKH)
        {
            if (Session["id"] != null)
            {
                int m = int.Parse(Session["id"].ToString());
                if (m == maKH)
                {
                    KhachHang kh = new KhachHang();
                    kh = db.KhachHangs.Find(maKH);
                    return View(kh);
                }
                return Redirect(Url.Action("Index", "Home"));
            }
            else
            {
                Response.StatusCode = 404;
                return Redirect(Url.Action("Index", "Home"));
            }




        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(KhachHang kh)
        {
            var user = db.KhachHangs.SingleOrDefault(n => n.MaKH == kh.MaKH);
            user.HoTen = kh.HoTen;
            user.DiaChi = kh.DiaChi;
            user.Email = kh.Email;
            user.DienThoai = kh.DienThoai;
            user.NgaySua = DateTime.Now;
            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
            return Redirect(Url.Action("Index", "Home"));

        }
        public ActionResult Logout()
        {


            if (Session["id"] != null)
            {
                Session.Remove("id");
                Session.Remove("TaiKhoan");
                Session.Remove("hoten");
            }

            return Redirect(Url.Action("Index", "Home"));
        }
        public ActionResult QuanlyDonHang() {
            if (Session["TaiKhoan"]!=null)
            {
                KhachHang kh = (KhachHang)Session["TaiKhoan"];
                if (db.DonHangs.Where(n => n.MaKH == kh.MaKH)==null)
                {
                    return Redirect(Url.Action("Index", "Home"));
                }
                List<DonHang> lisDonHang = db.DonHangs.Where(n => n.MaKH == kh.MaKH).ToList();
                return View(lisDonHang);
            }
            return Redirect(Url.Action("Index", "Home"));
        } 
        public ActionResult XemChiTietDonHang(int maDonHang)
        {
            if (Session["TaiKhoan"] != null)
            {
                KhachHang kh = (KhachHang)Session["TaiKhoan"];
                if (db.DonHangs.Where(n => n.MaDonHang == maDonHang).SingleOrDefault(m => m.MaKH == kh.MaKH)!=null)
                {
                    List<ChiTietDonHang> listChiTiet = db.ChiTietDonHangs.Where(n => n.MaDonHang == maDonHang).ToList();
                    ViewBag.maDonHang = maDonHang;
                    return View(listChiTiet);
                }
                return Redirect(Url.Action("Index", "Home"));
            }
            return Redirect(Url.Action("Index", "Home"));

        }
    }
}
