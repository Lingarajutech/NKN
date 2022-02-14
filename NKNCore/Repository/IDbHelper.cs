using System.Data;

namespace NKNCore.Repository
{
    public interface IDbHelper <T> where T : new()
    {
        public List<T> GetResults(string query);

        public Task<int> InsertEntity(T entity);
    }
}
