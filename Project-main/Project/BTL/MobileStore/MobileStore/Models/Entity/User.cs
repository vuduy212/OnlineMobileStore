namespace MobileStore.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        public long UserID { get; set; }
        [StringLength(50)]
        [Required(ErrorMessage = "chưa nhập username")]
        public string Username { get; set; }

        [Required(ErrorMessage = "chưa nhập password")]
        [StringLength(50, MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [StringLength(30)]
        public string Email { get; set; }
    }
}
