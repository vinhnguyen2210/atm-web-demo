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
    
    public partial class Log
    {
        public int LogID { get; set; }
        public Nullable<int> LogTypeID { get; set; }
        public Nullable<int> ATMID { get; set; }
        public string CardNo { get; set; }
        public Nullable<System.DateTime> LogDate { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public string Details { get; set; }
    
        public virtual ATM ATM { get; set; }
        public virtual Card Card { get; set; }
        public virtual LogType LogType { get; set; }
    }
}
