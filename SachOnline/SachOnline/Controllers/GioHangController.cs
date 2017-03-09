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
        public List<SessionGioHang> ktGioHang() {
            List<SessionGioHang> listGioHang = Session["SessionGioHang"] as List<SessionGioHang>;
            if (listGioHang==null)
            {
                listGioHang = new List<SessionGioHang>();
                Session["SessionGioHang"] = listGioHang;
                
            }
            return listGioHang;

        }
        public ActionResult ThemGioHang(int MaSach, string strurl) {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == MaSach);
            if (sach==null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<SessionGioHang> listGioHang = ktGioHang();
            SessionGioHang gh = listGioHang.Find(n => n.iMaSach == MaSach);
            if (gh == null)
            {
                gh = new SessionGioHang(MaSach);
                return Redirect(strurl);
            }
            else {
                gh.iSoLuong++;
                return Redirect(strurl);
            }
           
        }
    }
}