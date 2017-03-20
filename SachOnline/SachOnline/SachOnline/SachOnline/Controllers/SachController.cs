using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;
using Model.EF;
using PagedList;
using Model.ClientDAO;

namespace SachOnline.Controllers
{
    public class SachController : Controller
    {
        SachDAO sachDAO = new SachDAO();
       
        // GET: Sach
        public ActionResult Index()
        {
            return View();
        }
        
        public ViewResult ChiTietSach(int masach = 0)
        {
            Sach sach = sachDAO.ChiTietSach(masach);
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
            ChuDe cd = sachDAO.ChiTietChuDe(matheloai);
            if (cd == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.cd = cd.TenChuDe;
            List<Sach> SachChuDe = sachDAO.SachTheoChuDe(matheloai);
            if (SachChuDe.Count == 0)
            {
                ViewBag.ThongBao = "Không có sách nào thuộc thể loại này!";
            }
            int pageSize = 12;
            int pageNumber = (page ?? 1);
            return View(SachChuDe.ToPagedList(pageNumber, pageSize));
            //return View(SachChuDe);
        }
        public ViewResult SachTheoNXB(int maNXB, int? page)
        {
            NhaXuatBan nxb = sachDAO.ChiTietNXB(maNXB);
            if (nxb == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.nxb = nxb.TenNXB;
            List<Sach> SachNXB = sachDAO.SachTheoNXB(maNXB);
            if (SachNXB.Count == 0)
            {
                ViewBag.ThongBao = "Không có sách nào thuộc nhà xuát bản này!";
            }
            int pageSize = 12;
            int pageNumber = (page ?? 1);
            return View(SachNXB.ToPagedList(pageNumber, pageSize));
        }
        //public JsonResult ListName(string q) {
        //    var data = db.Saches.Where(n=>n.TenSach.Contains(q)).Select(x=>x.TenSach).ToList();
        //    return Json(new {
        //        data = data,
        //        status = true
        //    },JsonRequestBehavior.AllowGet);
        //}
       
    }
}