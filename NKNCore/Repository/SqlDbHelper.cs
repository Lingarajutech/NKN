using Microsoft.Data.SqlClient;
using System.Data;
using System.Reflection;

namespace NKNCore.Repository
{
    public class SqlDbHelper <T> : IDbHelper<T> where T : new()
    {
        private readonly IConfiguration Configuration;

        public SqlDbHelper(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        private string GetConnectionStirng ()
        {
            return this.Configuration.GetConnectionString("DefaultConnectionString");
        }
        public List<T> GetResults (string query)
        {
            var dbset = new DataSet();
            using (var connection = new SqlConnection(GetConnectionStirng()))
            {
                var command = new SqlCommand(query, connection);
                var adaptor = new SqlDataAdapter(command);
                adaptor.Fill(dbset);
            }

            return ConvertDataTable<T>(dbset.Tables[0]);
        }

        private static List<T> ConvertDataTable<T>(DataTable dt)
        {
            List<T> data = new List<T>();
            foreach (DataRow row in dt.Rows)
            {
                T item = GetItem<T>(row);
                data.Add(item);
            }
            return data;
        }
        private static T GetItem<T>(DataRow dr)
        {
            Type temp = typeof(T);
            T obj = Activator.CreateInstance<T>();

            foreach (DataColumn column in dr.Table.Columns)
            {
                foreach (PropertyInfo pro in temp.GetProperties())
                {
                    if (pro.Name.Equals(column.ColumnName, StringComparison.OrdinalIgnoreCase))
                        pro.SetValue(obj, dr[column.ColumnName], null);
                    else
                        continue;
                }
            }
            return obj;
        }

        public async Task<int> InsertEntity (T entity)
        {
            var query = GetInsertStatement(entity) + "; SELECT SCOPE_IDENTITY();";
            object result;

            using (var connection = new SqlConnection(GetConnectionStirng()))
            {
                await connection.OpenAsync();
                var command = new SqlCommand(query, connection);
                command.CommandType = CommandType.Text;
                result = await command.ExecuteScalarAsync();
            }
            return Convert.ToInt32(result);
        }

        private static string GetInsertStatement(T entity)
        {
            var quertText = $"Insert Into dbo.[{entity.GetType().Name}] (";
            var valueText = "Values(";

            T obj = Activator.CreateInstance<T>();
            Type temp = typeof(T);
            foreach (PropertyInfo pro in temp.GetProperties())
            {
                if (!pro.Name.Equals("Id", StringComparison.OrdinalIgnoreCase)) // exclude Id column. Expected this to be identity column.
                {
                    quertText += pro.Name + ",";
                    if (pro.PropertyType.IsEnum)
                    {
                        var value = entity.GetType().GetProperty(pro.Name).GetValue(entity, null);
                        var underlyingValue = Convert.ChangeType(value, Enum.GetUnderlyingType(value.GetType()));
                        valueText += "'" + underlyingValue + "',";
                    }
                    else
                    {
                        valueText += "'" + entity.GetType().GetProperty(pro.Name).GetValue(entity, null) + "',";
                    }
                }
                else
                    continue;
            }
            quertText = quertText.Substring(0, quertText.Length - 1) + ") ";
            valueText = valueText.Substring(0, valueText.Length - 1) + ")";

            return quertText + valueText;
        }
    }
}
