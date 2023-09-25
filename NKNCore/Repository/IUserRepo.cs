using SLACore.Modals;

namespace SLACore.Repository
{
    public interface IUserRepo
    {
        public User GetUserById(int Id);
        public User GetUserByUserName(string userName);
        public Task<int> AddUser (User user);
        public bool UpdateUser (User user);
    }
}
