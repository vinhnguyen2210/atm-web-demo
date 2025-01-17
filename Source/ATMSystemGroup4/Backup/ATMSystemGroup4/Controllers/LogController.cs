﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Objects;
using System.Data.Objects.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ATMSystemGroup4.Models;
using PagedList;

namespace ATMSystemGroup4.Controllers
{
    public class LogController : Controller
    {
        private ATMSystemEntities db = new ATMSystemEntities();


        //
        // SelectPeriod 
        // GET
        public ActionResult SelectPeriod()
        {
            Card card = (Card)Session["Card"];
            ATM atm = (ATM)Session["ATM"];
            if (card != null && atm != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        //
        // SelectPeriod
        // POST
        [HttpPost]
        public ActionResult SelectPeriod(string submitButton)
        {
            switch (submitButton)
            {
                case "1 Week ago":
                    return RedirectToAction("ViewHistory", new { period = "1 Week" });

                case "1 Month ago":
                    return RedirectToAction("ViewHistory", new { period = "1 Month" });

                case "4 Months ago":
                    return RedirectToAction("ViewHistory", new { period = "4 Months" });

                case "6 Months ago":
                    return RedirectToAction("ViewHistory", new { period = "6 Months" });

                case "1 Year ago":
                    return RedirectToAction("ViewHistory", new { period = "1 Year" });

                case "2 Years ago":
                    return RedirectToAction("ViewHistory", new { period = "2 Years" });

                default:
                    return View();

            }
        }



        //
        // GET: /Log/ViewHistory

        public ViewResult ViewHistory(string period, int? page)
        {
            Card card = (Card)Session["Card"];
            var logs = db.Logs.Include(l => l.ATM).Include(l => l.Card).Include(l => l.LogType);
            switch (period)
            {
                case "1 Week":
                    logs = from l in db.Logs
                           where SqlFunctions.DateDiff("dd", l.LogDate, DateTime.Now) <= 7
                           && l.CardNo == card.CardNo
                           select l;                    
                    break;

                case "1 Month":
                    logs = from l in db.Logs
                           where SqlFunctions.DateDiff("dd", l.LogDate, DateTime.Now) <= 30
                           && l.CardNo == card.CardNo
                           select l;                  
                    break;

                case "4 Months":
                    logs = from l in db.Logs
                           where SqlFunctions.DateDiff("dd", l.LogDate, DateTime.Now) <= 120
                           && l.CardNo == card.CardNo
                           select l;                   
                    break;

                case "6 Months":
                    logs = from l in db.Logs
                           where SqlFunctions.DateDiff("dd", l.LogDate, DateTime.Now) <= 180
                           && l.CardNo == card.CardNo
                           select l;                    
                    break;

                case "1 Year":
                    logs = from l in db.Logs
                           where SqlFunctions.DateDiff("dd", l.LogDate, DateTime.Now) <= 365
                           && l.CardNo == card.CardNo
                           select l;                   
                    break;

                case "2 Years":
                    logs = from l in db.Logs
                           where SqlFunctions.DateDiff("dd", l.LogDate, DateTime.Now) <= 700
                           && l.CardNo == card.CardNo
                           select l;                  
                    break;

            }

            logs = logs.OrderByDescending(s => s.LogDate);
            int countLogs = logs.Count();

            Config con = db.Configs.Find(1);
            int pageSize = (int)con.NumPerPage;

            int pageNumber = (page ?? 1);

            ViewBag.Period = period;
            ViewBag.CountLogs = countLogs;

            return View(logs.ToPagedList(pageNumber, pageSize));
        }

        //
        //WriteLog
        public bool WriteLog(int logType, int atmID, string cardNo, decimal amount, string details)
        {
            Log log = new Log();
            log.LogTypeID = logType;
            log.ATMID = atmID;
            log.CardNo = cardNo;
            log.LogDate = DateTime.Now;
            log.Amount = amount;
            log.Details = details;

            db.Logs.Add(log);
            db.SaveChanges();
            return true;
        }

    }
}