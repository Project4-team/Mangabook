using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SachOnline.Models;

namespace SachOnline.Models
{
    public class UserDAO
    {
        SachOnlineEntities db = null;
        public UserDAO() {
            db = new SachOnlineEntities();
        }
        public long Insert(KhachHang entity) {
            db.KhachHangs.Add(entity);
            db.SaveChanges();            
            return entity.MaKH;
        }
    }
}