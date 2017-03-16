using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SachOnline.Controllers
{
    public class ThongBaoController : Controller
    {
        // GET: ThongBao
        public ActionResult DatHangThanhCong()
        {
            if (Session["GioHang"] == null)
            {
                Session.Remove("GioHang");
                return RedirectToAction("Index", "Home");
            }
            
            return RedirectToAction("Index","Home");
        }
    }
}