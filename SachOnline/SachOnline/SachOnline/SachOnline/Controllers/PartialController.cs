using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.ClientDAO;


namespace SachOnline.Controllers.User
{
    public class PartialController : Controller
    {
        SachDAO sach = new SachDAO();
        public PartialViewResult TheLoaiPartial()
        {
            var ListTheLoai = sach.MenuChuDe();
            return PartialView(ListTheLoai);
        }
        public PartialViewResult NhaXuatBanPartial()
        {
            var ListNhaXuatBan = sach.MenuNXB();
            return PartialView(ListNhaXuatBan);
        }
    }
}