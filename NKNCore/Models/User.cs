namespace SLACore.Modals
{
    public class User
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public AuthProvider AuthProvider { get; set; }
        public string  Status { get; set; }
    }

    public enum AuthProvider
    {
        Unknown = 0,
        Google = 1,
        Microsoft = 2
    }
}
