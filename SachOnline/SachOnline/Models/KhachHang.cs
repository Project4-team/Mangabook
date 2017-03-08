﻿
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace SachOnline.Models
{

    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class KhachHang
    {

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KhachHang()
        {

            this.DonHangs = new HashSet<DonHang>();

        }

        [Display(Name = "Mã Khách Hàng")]
        [Required(ErrorMessage = "{0} không được để trống !")]
        public int MaKH { get; set; }
        [Display(Name = "Họ Tên")]
        [Required(ErrorMessage = "{0} không được để trống !")]
        public string HoTen { get; set; }
        [Display(Name = "Tên Tài Khoản")]
        [Required(ErrorMessage = "{0} không được để trống !")]
        [customUserVaidator]
        public string TaiKhoan { get; set; }
        [Display(Name = "Mật Khẩu")]
        [Required(ErrorMessage = "{0} không được để trống !")]
        [StringLength(100,ErrorMessage ="Mật khẩu phải nhiều hơn 6 kí tự !",MinimumLength =6)]
        [DataType(DataType.Password)]
        public string MaKhau { get; set; }

        //[Display(Name = "Nhập lại mật khẩu")]
        //[Required(ErrorMessage = "{0} không đươc dể trống !")]
        //[Compare("MatKhau", ErrorMessage ="Mật khẩu bạn nhập lại không đúng !")]
        //[DataType(DataType.Password)]
        //public string RePass { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "{0} không được để trống !")]
        [RegularExpression(@"^([\w-\.]+)@((\[[0-9]{1,3]\.)|(([\w-]+\.)+))([a-zA-Z{2,4}|[0-9]{1,3})(\]?)$", ErrorMessage = "Sai định dạng email!")]
        public string Email { get; set; }
        [Display(Name = "Địa chỉ")]
        [Required(ErrorMessage = "{0} không được để trống !")]
        public string DiaChi { get; set; }
        [Display(Name = "Điện Thoại")]
        [Required(ErrorMessage = "{0} không được để trống !")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"/^(09|012|04)[0-9]{8}$/",ErrorMessage =" {0} không đúng")]
        public string DienThoai { get; set; }
        [Display(Name = "Giới Tính")]
        [Required(ErrorMessage = "{0} không được để trống !")]
        public string GioiTinh { get; set; }
        [Display(Name = "Ngày Sinh")]
        [Required(ErrorMessage = "{0} không được để trống !")]
        [DataType(DataType.Date)]
        public Nullable<System.DateTime> NgaySinh { get; set; }



        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

        public virtual ICollection<DonHang> DonHangs { get; set; }

    }

}
