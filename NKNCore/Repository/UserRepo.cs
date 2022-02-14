using NKNCore.Modals;

namespace NKNCore.Repository
{
    public class UserRepo : IUserRepo
    {
        private SqlDbHelper<User> sqlHelper;
        public UserRepo(IDbHelper<User> sqlDbHelper)
        {
            this.sqlHelper = (SqlDbHelper<User>)sqlDbHelper;
        }
        public async Task<int> AddUser(User user)
        {
            var result = await this.sqlHelper.InsertEntity(user);
            return result;
        }

        public User GetUserById(int Id)
        {
            var query = $"SELECT * FROM [user] WHERE Id = {Id}";
            var result = this.sqlHelper.GetResults(query);
            return result.FirstOrDefault<User>();
        }

        public User GetUserByUserName(string userName)
        {
            //Sql injection issue. Refactor to pass it as param.
            var query = $"SELECT * FROM user WHERE userName = {userName}";
            var result = this.sqlHelper.GetResults(query);
            return result.FirstOrDefault<User>();
        }

        public bool UpdateUser(User user)
        {
            throw new NotImplementedException();
        }
    }
}
