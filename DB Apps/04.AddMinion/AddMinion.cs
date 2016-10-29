using System;
using System.Data.SqlClient;

namespace _04.AddMinion
{
    class AddMinion
    {
        public static SqlConnection Connection = new SqlConnection("Data Source=(local);Initial Catalog=MinionsDB;Integrated Security=True");
        static void Main()
        {
            var readLine = Console.ReadLine();
            if (readLine != null)
            {
                string[] minionStrings = readLine.Split();
                string minionName = minionStrings[1];
                int minionAge = int.Parse(minionStrings[2]);
                string minionTown = minionStrings[3];

                string[] villainString = readLine.Split();
                string villainName = villainString[1];

                string townSQL = "SELECT Id FROM Towns WHERE name = @townName";
                SqlCommand command = new SqlCommand(townSQL, Connection);
                command.Parameters.AddWithValue("@townName", minionTown);
                Connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (!reader.HasRows)
                {
                    reader.Close();
                    string addTownSQL = "INSERT INTO Towns (Name, Country) VALUES (@townName, NULL)";
                    SqlCommand addTown = new SqlCommand(addTownSQL, Connection);
                    addTown.Parameters.AddWithValue("@townName", minionTown);
                    addTown.ExecuteNonQuery();
                    Console.WriteLine($"Town {minionTown} was added to the database.");
                }
                reader.Close();

                int townId = (int)command.ExecuteScalar();
                reader.Close();

                string villainSQL = "SELECT * FROM Villains WHERE name = @villainName";
                SqlCommand getVillain = new SqlCommand(villainSQL, Connection);
                getVillain.Parameters.AddWithValue("@villainName", villainName);
                reader = getVillain.ExecuteReader();
                if (!reader.HasRows)
                {
                    reader.Close();
                    string addVillainSQL = "INSERT INTO Villains (Name, EvilnessFactor) VALUES (@villainName, 'evil')";
                    SqlCommand addVillain = new SqlCommand(addVillainSQL, Connection);
                    addVillain.Parameters.AddWithValue("@villainName", villainName);
                    addVillain.ExecuteNonQuery();
                    Console.WriteLine($"Villain {villainName} was added to the database.");
                }
                reader.Close();

                int villainId = (int) getVillain.ExecuteScalar();
                reader.Close();

                string addMinionSQL = "INSERT INTO minions (Name, Age, TownId) VALUES (@name, @age, @townId)";
                SqlCommand addMinion = new SqlCommand(addMinionSQL, Connection);
                addMinion.Parameters.AddWithValue("@name", minionName);
                addMinion.Parameters.AddWithValue("@age", minionAge);
                addMinion.Parameters.AddWithValue("@townId", townId);
                addMinion.ExecuteNonQuery();

                string getMinionIdSQL = "SELECT id FROM Minions WHERE Name = @minionName";
                SqlCommand getMinion = new SqlCommand(getMinionIdSQL, Connection);
                getMinion.Parameters.AddWithValue("@minionName", minionName);
                int minionId = (int)getMinion.ExecuteScalar();

                string addMinionToVillainSQL =
                    "INSERT INTO MinionsVillains (MinionId, VillainId) VALUES (@minionId, @villainId)";
                SqlCommand addMinionToVillain = new SqlCommand(addMinionToVillainSQL, Connection);
                addMinionToVillain.Parameters.AddWithValue("@minionId", minionId);
                addMinionToVillain.Parameters.AddWithValue("@villainId", villainId);
                addMinionToVillain.ExecuteNonQuery();

                Console.WriteLine($"Successfully added {minionName} to be minion of {villainName}");
            }
        }
    }
}
