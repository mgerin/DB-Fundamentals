using System;
using System.Data;
using System.Data.SqlClient;

namespace _03.GetMinionNames
{
    class GetMinionNames
    {
        public static SqlConnection Connection = new SqlConnection("Data Source=(local);Initial Catalog=MinionsDB;Integrated Security=True");
        static void Main()
        {
            int id = int.Parse(Console.ReadLine());
            string villainNameSQL = "SELECT Name FROM Villains WHERE id = @villainId";
            SqlCommand command = new SqlCommand(villainNameSQL, Connection);
            command.Parameters.AddWithValue("@villainId", id);
            Connection.Open();
            using (SqlDataReader reader = command.ExecuteReader(CommandBehavior.SingleResult))
            {
                if (!reader.HasRows)
                {
                    Console.WriteLine("No villain with ID " + id + " exists in the database.");
                    return;
                }
                reader.Read();
                string villainName = reader[0].ToString();
                Console.WriteLine("Villain: " + villainName);
    
            }
            Connection.Close();

            string minionsSQL = "SELECT m.Name, Age " + "FROM Villains v " +
                                "JOIN MinionsVillains mv ON v.Id=mv.VillainId "
                                + "JOIN Minions m ON m.Id=mv.MinionId " + "WHERE v.Id = @villainId";
            command = new SqlCommand(minionsSQL, Connection);
            command.Parameters.AddWithValue("@villainId", id);
            Connection.Open();

            using (SqlDataReader reader = command.ExecuteReader() )
            {
                if (!reader.HasRows)
                {
                    Console.WriteLine("<no minions>");
                    return;
                }

                int counter = 1;
                while (reader.Read())
                {
                    Console.WriteLine(counter + " " + reader["name"] + " " + reader["age"]);
                    counter++;
                }
            }

            Connection.Close();
        }
    }
}
