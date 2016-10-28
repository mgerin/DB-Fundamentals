using System;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;

namespace _02.GetVillainsNames
{
    class GetVillainsNames
    {
        public static SqlConnection Connection = new SqlConnection("Data Source=(local); Initial Catalog=MinionsDB;Integrated Security=True");
        static void Main()
        {
            SqlCommand command = new SqlCommand("SELECT v.Name, COUNT(MinionId) AS c " + "FROM Villains v "
                + "JOIN MinionsVillains mv ON v.Id = mv.VillainId " + "GROUP BY v.Name " 
                + "HAVING COUNT(MinionId) > 3 " + "ORDER BY c DESC", Connection);
            Connection.Open();
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Console.WriteLine(reader[0] + " " + reader[1]);
                }
            }
            Connection.Close();
        }
    }
}
