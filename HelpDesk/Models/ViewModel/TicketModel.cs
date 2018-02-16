using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace HelpDesk.Models.ViewModel
{
    public class TicketCreateView
    {
        [Key]
        public int ID { get; set; }
        
        public int UserID { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name = "User Name")]
        public string LoginName { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name = "Severity")]
        public int SeverityID { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name = "Status")]
        public int StatusID { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name = "Department")]
        public int DepartmentID { get; set; }
        public string Comments { get; set; }

    }

    public class TicketProfileView
    {
        [Key]
        public int ID { get; set; }

        public int? UserID { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name = "Login ID")]
        public string LoginName { get; set; }
        [Required(ErrorMessage = "*")]
        public string Severity { get; set; }
        public int? SeverityID { get; set; }
        [Required(ErrorMessage = "*")]
        public string Status { get; set; }
        public int? StatusID { get; set; }
        [Required(ErrorMessage = "*")]
        public string Department { get; set; }
        public int? DepartmentID { get; set; }
        public string Comments { get; set; }
        [Display(Name = "Date Created")]
        public DateTime? RowCreatedDateTime { get; set; }
        public int SYSUserID { get; set; }

    }

    public class LookupSeverity
    {
        [Key]
        public int ID { get; set;}
        public string Severity { get; set; }
    }

    public class LookupStatus
    {
        [Key]
        public int ID { get; set; }
        public string Status { get; set; }
    }

    public class LookupDepartment
    {
        [Key]
        public int ID { get; set; }
        public string Department { get; set; }
    }

    public class TicketSeverities
    {
        public int? SelectedSeverityID { get; set; }
        public IEnumerable<LookupSeverity> SeverityList { get; set; }
    }

    public class TicketStatus
    {
        public int? SelectedStatusID { get; set; }
        public IEnumerable<LookupStatus> StatusList { get; set; }
    }

    public class TicketDepartments
    {
        public int? SelectedDepartmentID { get; set; }
        public IEnumerable<LookupDepartment> DepartmentList { get; set; }
    }

    public class TicketDataView
    {
        public IEnumerable<TicketProfileView> TicketProfile { get; set; }
        public TicketSeverities TicketSeverities { get; set; }
        public TicketStatus TicketStatus { get; set; }
        public TicketDepartments TicketDepartments { get; set; }
    }
}