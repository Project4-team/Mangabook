namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("GiaoHang")]
    public partial class GiaoHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public GiaoHang()
        {
            DonHangs = new HashSet<DonHang>();
        }

        [Key]
        public int MaGiaoHang { get; set; }

        [StringLength(150)]
        public string TenNguoiNhan { get; set; }

        public string DiaChi { get; set; }

        [StringLength(20)]
        public string SDT { get; set; }

        [StringLength(150)]
        public string Email { get; set; }

        public int? QuaTang { get; set; }

        public string LoiNhan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DonHang> DonHangs { get; set; }
    }
}
