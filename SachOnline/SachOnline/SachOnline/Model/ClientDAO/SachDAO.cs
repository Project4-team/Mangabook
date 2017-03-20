using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.ClientDAO
{   
    
    public class SachDAO
    {
        SachOnlineDbContext db = null;
        public SachDAO() {
            db = new SachOnlineDbContext();
        }
        public List<Sach> GetSachMoi() {
            List<Sach> list = db.Saches.OrderByDescending(n => n.NgayCapNhat).Where(m => m.TrangThai == 1).ToList();
            return list;
        }
        public List<ChuDe> MenuChuDe() {
            List<ChuDe> list = db.ChuDes.ToList();
            return list;
        }
        public List<NhaXuatBan> MenuNXB() {
            List<NhaXuatBan> list = db.NhaXuatBans.ToList();
            return list;
        }
        public Sach ChiTietSach(int maSach) {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == maSach);
            return sach;
        }
        public ChuDe ChiTietChuDe(int maChuDe)
        {
            ChuDe chude = db.ChuDes.SingleOrDefault(n => n.MaChuDe ==maChuDe);
            return chude;
        }
        public NhaXuatBan ChiTietNXB(int maNXB) {
            NhaXuatBan NXB = db.NhaXuatBans.SingleOrDefault(n => n.MaNXB == maNXB);
            return NXB;
        }
        public List<Sach> SachTheoChuDe(int maChuDe) {
            List<Sach> list = db.Saches.Where(n => n.MaChuDe == maChuDe).OrderByDescending(n => n.NgayCapNhat).Where(m => m.TrangThai == 1).ToList();
            return list;
        }
        public List<Sach> SachTheoNXB(int maNXB)
        {
            List<Sach> list = db.Saches.Where(n => n.MaNXB == maNXB).Where(m => m.TrangThai == 1).ToList();
            return list;
        }
    }
}
