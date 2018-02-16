using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using HelpDesk.Models.ViewModel;
using HelpDesk.Models.EntityManager;
using HelpDesk.Security;

namespace HelpDesk.Controllers
{
    public class TicketController : Controller
    {
        public ActionResult AddTicket()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddTicket(TicketCreateView TCV)
        {
            if (ModelState.IsValid)
            {
                TicketManager TM = new TicketManager();
                UserManager UM = new UserManager();
                TCV.UserID = UM.GetUserID(TCV.LoginName);
                TM.AddTicket(TCV);
                return RedirectToAction("Welcome", "Home");

            }
            return View();
        }

        public ActionResult ManageTicketPartial(string status = "", int severityID = 0, int statusID = 0, int departmentID = 0)
        {
            if (User.Identity.IsAuthenticated)
            {
                TicketManager TM = new TicketManager();
                TicketDataView TDV = TM.GetTicketDataView(severityID, statusID, departmentID, false);

                string message = string.Empty;
                if (status.Equals("update")) message = "Update Successful";
                else if (status.Equals("delete")) message = "Delete Successful";

                ViewBag.Message = message;

                return PartialView(TDV);
            }

            return View();
        }

        public ActionResult ManageResolvedPartial(string status = "", int severityID = 0, int statusID = 0, int departmentID = 0)
        {
            if (User.Identity.IsAuthenticated)
            {
                TicketManager TM = new TicketManager();
                TicketDataView TDV = TM.GetTicketDataView(severityID, statusID, departmentID, true);

                string message = string.Empty;
                if (status.Equals("update")) message = "Update Successful";
                else if (status.Equals("delete")) message = "Delete Successful";

                ViewBag.Message = message;

                return PartialView(TDV);
            }

            return View();
        }


        [AuthorizeRoles("Admin")]
        public ActionResult EditTicket(int id)
        {
            TicketManager TM = new TicketManager();
            TicketProfileView TPV = TM.GetTicketProfile(id);
            return View(TPV);
        }

        [HttpPost]
        [AuthorizeRoles("Admin")]
        public ActionResult EditTicket(TicketProfileView profile)
        {

            TicketManager TM = new TicketManager();
            UserManager UM = new UserManager();
            profile.UserID = UM.GetUserID(profile.LoginName);

            string user = User.Identity.Name;
            profile.SYSUserID = UM.GetUserID(user);

            TM.UpdateTicket(profile);

            ViewBag.Status = "Update Sucessful!";
            return View(profile);
        }
    }
}