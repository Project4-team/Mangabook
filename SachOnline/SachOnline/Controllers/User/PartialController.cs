using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;


namespace SachOnline.Controllers.User
{
    public class PartialController : Controller
    {
        SachOnlineEntities db = new SachOnlineEntities();
        // GET: Partial
        public PartialViewResult TheLoaiPartial()
        {
            var ListTheLoai = db.ChuDes.ToList();
            return PartialView(ListTheLoai);
        }
        public PartialViewResult NhaXuatBanPartial()
        {
            var ListNhaXuatBan = db.NhaXuatBans.ToList();
            return PartialView(ListNhaXuatBan);
        }
        public PartialViewResult SachPartial()
        {
            var ListSach = db.Saches.ToList();
            return PartialView(ListSach);
        }
        public ViewResult ChiTietSachView(int masach=0) {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == masach);
            if (sach==null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sach);
        }
        public ViewResult SachTheoTheloai(int machude) {
            ChuDe cd = db.ChuDes.SingleOrDefault(n => n.MaChuDe == machude);
            if (cd == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<Sach> SachChuDe = db.Saches.Where(n => n.MaChuDe == machude).ToList();
            if (SachChuDe.Count ==0)
            {
                ViewBag.Sach = "Không có sách nào thuộc chủ đề này";
            }
            return View(SachChuDe);
        }
    }
}