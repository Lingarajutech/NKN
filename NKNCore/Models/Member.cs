using System.ComponentModel.DataAnnotations;

namespace SLACore.Modals
{
    public class Member
    {
        public int Id { get; set; }
        public User User { get; set; }
        public string FirstName { get; set; } =  string.Empty;
        public string LastName { get; set; } = string.Empty;
        public DateTime StartDate { get; set; }
        [StringLength(10)]
        public string Status { get; set; } = string.Empty;
    }
}
