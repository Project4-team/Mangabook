using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;
using PagedList;

namespace SachOnline.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        SachOnlineEntities db = new SachOnlineEntities();
        public ActionResult Index(int? page)
        {
            var ListSach = db.Saches.OrderByDescending(n => n.NgayCapNhat).ToList();
           
            int pageSize = 1;
            int pageNumber = (page ?? 1);
            return View(ListSach.ToPagedList(pageNumber, pageSize));
        }
    }
}