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
            List<Sach> SachChuDe = db.Saches.Where(n => n.MaChuDe == matheloai).ToList();
            if (SachChuDe.Count == 0)
            {
                ViewBag.Sach = "Không có sách nào thuộc chủ đề này";
            }
            return View(SachChuDe);
        }

    }
}