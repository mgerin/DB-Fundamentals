using System.Collections.Generic;
using System.Data.SqlClient;
using CustomORM.Core;

namespace MiniORM
{
    class EntityManager : IDbContext
    {
        private SqlConnection connection;
        private string connectionString;
        private bool isCodeFirst;

        public EntityManager(string connectionString, bool isCodeFirst)
        {
            this.connectionString = connectionString;
            this.isCodeFirst = isCodeFirst;
        }

        public bool Persist(object entity)
        {
            throw new System.NotImplementedException();
        }

        public T FindById<T>(int id)
        {
            throw new System.NotImplementedException();
        }

        public IEnumerable<T> FindAll<T>()
        {
            throw new System.NotImplementedException();
        }

        public IEnumerable<T> FindAll<T>(string @where)
        {
            throw new System.NotImplementedException();
        }

        public T FindFirst<T>()
        {
            throw new System.NotImplementedException();
        }

        public T FindFirst<T>(string @where)
        {
            throw new System.NotImplementedException();
        }

        public void Delete<T>(object entity)
        {
            throw new System.NotImplementedException();
        }

        public void DeleteById<T>(int id)
        {
            throw new System.NotImplementedException();
        }
    }
}
