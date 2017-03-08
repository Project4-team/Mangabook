﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
using SachOnline.Models;

namespace SachOnline.Models
{
    public class customUserVaidator : ValidationAttribute
    {
        SachOnlineEntities db = new SachOnlineEntities();
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value != null)
            {
                string user = value.ToString();
                if (db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == user) == null)
                {
                    return ValidationResult.Success;
                }
                else
                {

                    return new ValidationResult("Tên đăng nhập đã tồn tại !");
                }
            }
            else
            {
                return new ValidationResult("" + validationContext.DisplayName + " không được trống !");
            }

        }
    }
}