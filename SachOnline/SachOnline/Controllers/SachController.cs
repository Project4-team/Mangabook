using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;
using PagedList;

namespace SachOnline.Controllers
{
    public class SachController : Controller
    {
        // GET: Sach
        public ActionResult Index()
        {
            return View();
        }
        SachOnlineEntities db = new SachOnlineEntities();
        public ViewResult ChiTietSach(int masach = 0)
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == masach);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var chude = sach.MaChuDe;
            if (sach.SoLuong == 0)
            {
                ViewBag.Soluong = "Hết Hàng";
            }
            else {
                ViewBag.Soluong2 = "Còn Hàng";
            }
            return View(sach);

        }
        public ViewResult SachTheoTheloai(int matheloai, int? page)
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
                ViewBag.ThongBao = "Không có sách nào thuộc thể loại này!";
            }
            int pageSize = 1;
            int pageNumber = (page ?? 1);
            return View(SachChuDe.ToPagedList(pageNumber, pageSize));
            //return View(SachChuDe);
        }
        public ViewResult SachTheoNXB(int maNXB, int? page)
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
                ViewBag.ThongBao = "Không có sách nào thuộc nhà xuát bản này!";
            }
            int pageSize = 1;
            int pageNumber = (page ?? 1);
            return View(SachNXB.ToPagedList(pageNumber, pageSize));
        }
    }
}