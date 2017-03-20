using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;
using Model.EF;
using Model.ClientDAO;
using PagedList;

namespace SachOnline.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index(int? page)
        {
            SachDAO sach = new SachDAO();
            var ListSach = sach.GetSachMoi();

            int pageSize = 9;
            int pageNumber = (page ?? 1);
            return View(ListSach.ToPagedList(pageNumber, pageSize));
        }
    }
}