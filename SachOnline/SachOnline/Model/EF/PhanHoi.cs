namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhanHoi")]
    public partial class PhanHoi
    {
        [Key]
        public int MaPhanHoi { get; set; }

        [StringLength(50)]
        public string Ten { get; set; }

        [StringLength(150)]
        public string Email { get; set; }

        [Column("PhanHoi")]
        public string PhanHoi1 { get; set; }
    }
}
