//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ATMSystemGroup4.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Card
    {
        public Card()
        {
            this.Logs = new HashSet<Log>();
        }

        [Required(ErrorMessage = "A CardNo is required")]
        [StringLength(16)]
        public string CardNo { get; set; }
        public string Status { get; set; }
        public Nullable<int> AccountID { get; set; }

        [Required(ErrorMessage = "A PIN is required")]
        [StringLength(6, MinimumLength = 6)]
        public string PIN { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> ExpiredDate { get; set; }
        public Nullable<int> Attempt { get; set; }

        public virtual Account Account { get; set; }
        public virtual ICollection<Log> Logs { get; set; }
    }
}
