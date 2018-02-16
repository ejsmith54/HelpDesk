using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HelpDesk.Models.DB;
using HelpDesk.Models.ViewModel;

namespace HelpDesk.Models.EntityManager
{
    public class TicketManager
    {
        public void AddTicket(TicketCreateView ticket)
        {
            using (mwdEntities db = new mwdEntities())
            {
                helpdesk HD = new helpdesk();
                HD.UserID = ticket.UserID;
                HD.StatusID = ticket.StatusID;
                HD.SeverityID = ticket.SeverityID;
                HD.DepartmentID = ticket.DepartmentID;
                HD.Comments = ticket.Comments;
                HD.RowCreatedSYSUserID = ticket.UserID > 0 ? ticket.UserID : 1;
                HD.RowModifiedSYSUserID = ticket.UserID > 0 ? ticket.UserID : 1;
                HD.RowCreatedDateTime = DateTime.Now;
                HD.RowModifiedDateTime = DateTime.Now;

                db.helpdesks.Add(HD);
                db.SaveChanges();
            }
        }

        public List<LookupSeverity> GetAllSeverities()
        {
            using (mwdEntities db = new mwdEntities())
            {
                var severities = db.Severities.Select(o => new LookupSeverity
                {
                    ID = o.ID,
                    Severity = o.Severity1
                }).ToList();

                return severities;
            }
        }

        public List<LookupStatus> GetAllStatus()
        {
            using (mwdEntities db = new mwdEntities())
            {
                var status = db.Status.Select(o => new LookupStatus
                {
                    ID = o.ID,
                    Status = o.Status1
                }).ToList();

                return status;
            }
        }

        public List<LookupDepartment> GetAllDepartments()
        {
            using (mwdEntities db = new mwdEntities())
            {
                var departments = db.Departments.Select(o => new LookupDepartment
                {
                    ID = o.ID,
                    Department = o.Department1
                }).ToList();

                return departments;
            }
        }

        public List<TicketProfileView> GetAllTicketProfiles(bool resolved)
        {
            List<TicketProfileView> profiles = new List<TicketProfileView>();

            using (mwdEntities db = new mwdEntities())
            {
                TicketProfileView TPV;
                IQueryable<helpdesk> tickets;
                //var tickets = db.helpdesks.Where(o => o.StatusID != 3);

                if (resolved)
                {
                    tickets = db.helpdesks.Where(o => o.StatusID == 3);
                }
                else
                {
                    tickets = db.helpdesks.Where(o => o.StatusID != 3);
                }

                foreach (helpdesk h in tickets)
                {
                    TPV = new TicketProfileView();
                    TPV.ID = h.ID;
                    TPV.UserID = h.UserID;
                    TPV.Comments = h.Comments;
                    TPV.SeverityID = h.SeverityID;
                    TPV.StatusID = h.StatusID;
                    TPV.DepartmentID = h.DepartmentID;
                    TPV.RowCreatedDateTime = h.RowCreatedDateTime;

                    var SUP = db.SYSUsers.Find(h.UserID);
                    if (SUP != null)
                    {
                        TPV.LoginName = SUP.LoginName;
                    }

                    var SEV = db.Severities.Find(h.SeverityID);
                    if (SEV != null)
                    {
                        TPV.Severity = SEV.Severity1;
                    }

                    var STA = db.Status.Find(h.StatusID);
                    if (STA != null)
                    {
                        TPV.Status = STA.Status1;
                    }

                    var DEP = db.Departments.Find(h.DepartmentID);
                    if (DEP != null)
                    {
                        TPV.Department = DEP.Department1;
                    }

                    profiles.Add(TPV);
                }
            }

            return profiles;
        }

        public TicketDataView GetTicketDataView(int severityID, int statusID, int departmentID, bool resolved)
        {
            TicketDataView TDV = new TicketDataView();
            List<TicketProfileView> profiles = GetAllTicketProfiles(resolved);
            List<LookupSeverity> severities = GetAllSeverities();
            List<LookupStatus> status = GetAllStatus();
            List<LookupDepartment> departments = GetAllDepartments();

            TDV.TicketProfile = profiles;
            TDV.TicketSeverities = new TicketSeverities
            {
                SelectedSeverityID = severityID,
                SeverityList = severities
            };

            TDV.TicketStatus = new TicketStatus
            {
                SelectedStatusID = statusID,
                StatusList = status
            };

            TDV.TicketDepartments = new TicketDepartments
            {
                SelectedDepartmentID = departmentID,
                DepartmentList = departments
            };

            return TDV;
        }

        public void UpdateTicket(TicketProfileView ticket)
        {

            using (mwdEntities db = new mwdEntities())
            {
                using (var dbContextTransaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        helpdesk HD = db.helpdesks.Find(ticket.ID);
                        HD.UserID = ticket.UserID;
                        HD.SeverityID = ticket.SeverityID;
                        HD.StatusID = ticket.StatusID;
                        HD.DepartmentID = ticket.DepartmentID;
                        HD.Comments = ticket.Comments;
                        HD.RowModifiedSYSUserID = ticket.SYSUserID;
                        HD.RowModifiedDateTime = DateTime.Now;

                        db.SaveChanges();
                        dbContextTransaction.Commit();
                    }
                    catch
                    {
                        dbContextTransaction.Rollback();
                    }
                }
            }
        }

        public TicketProfileView GetTicketProfile(int ticketID)
        {
            TicketProfileView TPV = new TicketProfileView();
            using (mwdEntities db = new mwdEntities())
            {
                var ticket = db.helpdesks.Find(ticketID);
                if (ticket != null)
                {
                    TPV.ID = ticket.ID;
                    TPV.UserID = ticket.UserID;
                    TPV.Comments = ticket.Comments;
                    TPV.SeverityID = ticket.SeverityID;
                    TPV.StatusID = ticket.StatusID;
                    TPV.DepartmentID = ticket.DepartmentID;
                    TPV.RowCreatedDateTime = ticket.RowCreatedDateTime;

                    var SUP = db.SYSUsers.Find(ticket.UserID);
                    if (SUP != null)
                    {
                        TPV.LoginName = SUP.LoginName;
                    }

                    var SEV = db.Severities.Find(ticket.SeverityID);
                    if (SEV != null)
                    {
                        TPV.Severity = SEV.Severity1;
                    }

                    var STA = db.Status.Find(ticket.StatusID);
                    if (STA != null)
                    {
                        TPV.Status = STA.Status1;
                    }

                    var DEP = db.Departments.Find(ticket.DepartmentID);
                    if (DEP != null)
                    {
                        TPV.Department = DEP.Department1;
                    }
                }
            }

            return TPV;
        }
    }
}