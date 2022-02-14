namespace NKNCore.Modals
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
        Google = 10,
        Microsoft = 20
    }
}
