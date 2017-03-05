using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MangaBook.Models;

namespace MangaBook.Controllers.User
{
    public class HomeController : Controller
    {
        MangaBookEntities db = new MangaBookEntities();
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult DanhMucPartial() {
            var listDanhMuc = db.ChuDes.ToList();
            return PartialView(listDanhMuc);
        }
    }
}