using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;
using PagedList;
using Model.EF;

namespace SachOnline.Controllers
{
    public class TimKiemController : Controller
    {
        SachOnlineDbContext db = new SachOnlineDbContext();
        // GET: TimKiem
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult TimKiem(FormCollection f, int? page)
        {
            string sTukhoa = f["txtTimKiem"].ToString();
            ViewBag.TuKhoa = sTukhoa;
            List<Sach> kq = db.Saches.Where(n => n.TenSach.Contains(sTukhoa)).ToList();

            if (kq.Count == 0)
            {
                ViewBag.ThongBao = "Không có sản phẩm nào !";
            }
            int pageSize = 1;
            int pageNumber = (page ?? 1);
            return View(kq.OrderBy(n => n.TenSach).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult TimKiem(string sTuKhoa, int? page)
        {
            List<Sach> kq = db.Saches.Where(n => n.TenSach.Contains(sTuKhoa)).ToList();

            if (kq.Count == 0)
            {
                ViewBag.ThongBao = "Không có sản phẩm nào !";
            }
            int pageSize = 1;
            int pageNumber = (page ?? 1);
            return View(kq.OrderBy(n => n.TenSach).ToPagedList(pageNumber, pageSize));
        }
    }
}