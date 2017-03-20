using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
using SachOnline.Models;

namespace SachOnline.Models
{
    public class customDateTimeVaid : ValidationAttribute
    {
        
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value != null)
            {
                DateTime date = Convert.ToDateTime(value);
                if (date > DateTime.Now)
                {
                    return new ValidationResult("Ngày sinh ở tương lai !");
                }
                
            }
            
          return ValidationResult.Success;
            

        }
    }
}