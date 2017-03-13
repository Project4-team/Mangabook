using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SachOnline.Models;

namespace SachOnline.Models
{
    public class SessionGioHang
    {
        SachOnlineEntities db = new SachOnlineEntities();
         public int iMaSach { get; set; }
        public string iTenSach { get; set; }
        public string iHinhAnh { get; set; }
        public int iSoLuong { get; set; }
        public int iDonGia { get; set; }
        public int iSach { get; set; }
        public int iTongGia {
            get { return iSoLuong * iDonGia; }
        }
        public SessionGioHang(int MaSach) {
            iMaSach = MaSach;
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == iMaSach);
            iTenSach = sach.TenSach;
            iHinhAnh = sach.AnhBia;
            iDonGia = int.Parse(sach.GiaBan.ToString());
            iSoLuong = 1;

        }
     }
}