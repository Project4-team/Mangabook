using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;

namespace SachOnline.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        SachOnlineEntities db = new SachOnlineEntities();
        public List<SessionGioHang> ktGioHang()
        {
            List<SessionGioHang> listGioHang = Session["SessionGioHang"] as List<SessionGioHang>;
            if (listGioHang == null)
            {
                listGioHang = new List<SessionGioHang>();
                Session["SessionGioHang"] = listGioHang;

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
        public ActionResult CapNhapGioHang(int MaSach, FormCollection f) {
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
                gh.iSoLuong = int.Parse(f["txtSoluong"].ToString());
            }
            return View();
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
                Session.Remove("SessionGioHang");
                return RedirectToAction("Index", "Home");
               
            }
            return RedirectToAction("Giohang");

        }
        public ActionResult GioHang() {
            if (Session["SessionGioHang"]==null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<SessionGioHang> listHang = ktGioHang();
            ViewBag.TongGiaTien = TongTien();
            return View(listHang);
        }
        private int TongSoLuong() {
            int iTongSoLuong = 0;
            List<SessionGioHang> listGioHang = Session["SessionGioHang"] as List<SessionGioHang>;
            if (listGioHang != null)
            {
                iTongSoLuong = listGioHang.Sum(n => n.iSoLuong);
            }
            return iTongSoLuong;

        }
        private int TongTien()
        {
            int iTongTien = 0;
            List<SessionGioHang> listGioHang = Session["SessionGioHang"] as List<SessionGioHang>;
            if (listGioHang != null)
            {
                iTongTien = listGioHang.Sum(n => n.iTongGia);
            }
            return iTongTien;

        }
        private int TongSach() {
            int iTongSach = 0;
            List<SessionGioHang> listGioHang = Session["SessionGioHang"] as List<SessionGioHang>;
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
    }
}