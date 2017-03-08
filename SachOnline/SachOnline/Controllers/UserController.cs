using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;


namespace SachOnline.Controllers.User
{
    public class UserController : Controller
    {
        SachOnlineEntities db = new SachOnlineEntities();
        public ViewResult ChiTietSach(int masach = 0)
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == masach);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var chude= sach.MaChuDe;
            return View(sach);

        }
        public ViewResult SachTheoTheloai(int matheloai)
        {
            ChuDe cd = db.ChuDes.SingleOrDefault(n => n.MaChuDe == matheloai);
            if (cd == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.cd = cd.TenChuDe;
            List<Sach> SachChuDe = db.Saches.Where(n => n.MaChuDe == matheloai).ToList();
            if (SachChuDe.Count == 0)
            {
                ViewBag.ChuDe = "Không có sách nào thuộc chủ đề này";
            }
            return View(SachChuDe);
        }
        public ViewResult SachTheoNXB(int maNXB)
        {
            NhaXuatBan nxb = db.NhaXuatBans.SingleOrDefault(n => n.MaNXB == maNXB);
            if (nxb == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.nxb = nxb.TenNXB;
            List<Sach> SachNXB = db.Saches.Where(n => n.MaNXB == maNXB).ToList();
            if (SachNXB.Count == 0)
            {
                ViewBag.NXB = "Không có sách nào thuộc nhà xuát bản này";
            }
            return View(SachNXB);
        }
    }
}