using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;

namespace SachOnline.Controllers
{
    public class QuanLyController : Controller
    {
        SachOnlineEntities db = new SachOnlineEntities();
        // GET: QuanLy
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Dangky() {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(KhachHang kh) {
            db.KhachHangs.Add(kh);
            db.SaveChanges(); 
            return View();
        }
    }
}