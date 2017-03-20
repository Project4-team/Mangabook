using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SachOnline.Models;
using Model.EF;
namespace SachOnline.Models
{
    public class SessionGioHang
    {
         SachOnlineDbContext db = new SachOnlineDbContext();
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