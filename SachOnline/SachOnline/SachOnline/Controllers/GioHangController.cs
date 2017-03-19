using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;
using System.Web.Script.Serialization;
using System.Data.Entity;
using Model.EF;

namespace SachOnline.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        SachOnlineDbContext db = new SachOnlineDbContext();
        public List<SessionGioHang> ktGioHang()
        {
            List<SessionGioHang> listGioHang = Session["GioHang"] as List<SessionGioHang>;
            if (listGioHang == null)
            {
                listGioHang = new List<SessionGioHang>();
                Session["GioHang"] = listGioHang;

            }
            return listGioHang;

        }
        public ActionResult ThemGioHang(int MaSach, string strurl,FormCollection f)
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == MaSach);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<SessionGioHang> listGioHang = ktGioHang();
            SessionGioHang gh = listGioHang.Find(n => n.iMaSach == MaSach);
            if (gh == null)
            {
                gh = new SessionGioHang(MaSach);
                gh.iSach = 1;
                if (f["Soluong"] != null)
                {
                    gh.iSoLuong = int.Parse(f["Soluong"]);
                }
                else {
                    gh.iSoLuong = 1;
                }
                       
                listGioHang.Add(gh);
                return Redirect(strurl);
            }
            else
            {   
                if (f["Soluong"] != null)
                {
                    gh.iSoLuong = gh.iSoLuong+int.Parse(f["Soluong"]);
                }
                else {
                    gh.iSoLuong++;
                }
                
                return Redirect(strurl);
            }

        }
        public ActionResult XoaHang(int MaSach) {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == MaSach);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<SessionGioHang> listGioHang = ktGioHang();
            SessionGioHang gh = listGioHang.Find(n => n.iMaSach == MaSach);
            if (gh != null)
            {
                listGioHang.RemoveAll(n => n.iMaSach == MaSach);
            }
            if (listGioHang.Count==0)
            {
                Session.Remove("GioHang");
                return RedirectToAction("Index", "Home");
               
            }
            return RedirectToAction("Giohang");

        }
        public ActionResult GioHang() {
            if (Session["GioHang"]==null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<SessionGioHang> listHang = ktGioHang();
            ViewBag.TongGiaTien = TongTien();
            return View(listHang);
        }
        private int TongSoLuong() {
            int iTongSoLuong = 0;
            List<SessionGioHang> listGioHang = Session["GioHang"] as List<SessionGioHang>;
            if (listGioHang != null)
            {
                iTongSoLuong = listGioHang.Sum(n => n.iSoLuong);
            }
            return iTongSoLuong;

        }
        private int TongTien()
        {
            int iTongTien = 0;
            List<SessionGioHang> listGioHang = Session["GioHang"] as List<SessionGioHang>;
            if (listGioHang != null)
            {
                iTongTien = listGioHang.Sum(n => n.iTongGia);
            }
            return iTongTien;

        }
        private int TongSach() {
            int iTongSach = 0;
            List<SessionGioHang> listGioHang = Session["GioHang"] as List<SessionGioHang>;
            if (listGioHang != null)
            {
                iTongSach = listGioHang.Sum(n => n.iSach);
            }
            return iTongSach;

        }
        public PartialViewResult TongSachPar() {
            if (TongSach()<=0)
            {
                return PartialView();
                
            }
            ViewBag.TongSach = TongSach().ToString();
            return PartialView();
        }

        public ActionResult UpdateQuantity(string proID, int quantity)
        {
            int id = Convert.ToInt32(proID.Substring(7, proID.Length - 7));
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == id);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<SessionGioHang> listGioHang = ktGioHang();
            SessionGioHang gh = listGioHang.Find(n => n.iMaSach == id);
            if (gh != null)
            {
                gh.iSoLuong = quantity;
            }
            return View();
        }
        public ActionResult CapNhapGioHang(int MaSach, int SoLuong)
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == MaSach);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<SessionGioHang> listGioHang = ktGioHang();
            SessionGioHang gh = listGioHang.Find(n => n.iMaSach == MaSach);
            if (gh != null)
            {
                gh.iSoLuong = SoLuong;
            }
            return View();
        }
        public ActionResult DatHang(FormCollection f) {
            if (Session["TaiKhoan"]==null)
            {              
                return RedirectToAction("DangNhap", "User");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            KhachHang kh = (KhachHang)Session["TaiKhoan"];
            DonHang ddh = new DonHang();
            GiaoHang giaohang = new GiaoHang();
            List<SessionGioHang> gh = ktGioHang();

            giaohang.TenNguoiNhan = f["hoten"];
            giaohang.DiaChi = f["diachi"];
            giaohang.SDT = f["dienthoai"];
            giaohang.Email = f["email"];
            giaohang.LoiNhan = f["nhan"];
            db.GiaoHangs.Add(giaohang);
            ddh.MaKH = kh.MaKH;
            ddh.MaGiaoHang = giaohang.MaGiaoHang;
            ddh.NgayDat = DateTime.Now;
            ddh.TongGia = TongTien();
            db.DonHangs.Add(ddh);
            db.SaveChanges();
           
            foreach (var item in gh)
            {
                ChiTietDonHang ctdh = new ChiTietDonHang();
                ctdh.MaDonHang = ddh.MaDonHang;
                ctdh.MaSach = item.iMaSach;
                ctdh.SoLuong = item.iSoLuong;
                ctdh.DonGia = item.iDonGia;
                db.ChiTietDonHangs.Add(ctdh);
                db.SaveChanges();
            }
            foreach (var item in gh)
            {
                Sach sach = db.Saches.Find(item.iMaSach);
                if (sach.SoLuong - item.iSoLuong<=0)
                {
                    sach.SoLuong = 0;
                }
                else
                {
                    sach.SoLuong = sach.SoLuong - item.iSoLuong;
                }
                db.Entry(sach).State = EntityState.Modified;
                db.SaveChanges();
            }
            Session.Remove("GioHang");
            return RedirectToAction("Index","Home");
        }
    }
}