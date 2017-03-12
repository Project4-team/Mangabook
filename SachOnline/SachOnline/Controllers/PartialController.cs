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
    }
}