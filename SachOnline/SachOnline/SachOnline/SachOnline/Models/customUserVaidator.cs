using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
using SachOnline.Models;
using Model.EF;

namespace SachOnline.Models
{
    public class customUserVaidator : ValidationAttribute
    {
        SachOnlineDbContext db = new SachOnlineDbContext();
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value != null)
            {
                string user = value.ToString();
                if (db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == user) != null)
                {
                    return new ValidationResult("Tên đăng nhập đã tồn tại !");
                }
            }
            return ValidationResult.Success;

        }
    }
}