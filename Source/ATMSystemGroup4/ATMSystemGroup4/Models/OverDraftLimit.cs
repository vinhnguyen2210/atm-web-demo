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
    
    public partial class OverDraftLimit
    {
        public OverDraftLimit()
        {
            this.Accounts = new HashSet<Account>();
        }
    
        public int ODID { get; set; }
        public Nullable<decimal> Value { get; set; }
    
        public virtual ICollection<Account> Accounts { get; set; }
    }
}
