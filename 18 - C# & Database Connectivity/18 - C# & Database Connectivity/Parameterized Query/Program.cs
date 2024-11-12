using System;
using System.Data.SqlClient;

namespace Parameterized_Query
{
    internal class Program
    {
        static string ConnectionDB = "Server=localhost;Database=VehicleMakesDB;Integrated Security=True";

        static void PrintAllVehicle(string NumeVehicle)
        {
            string Query = "SELECT * FROM VehicleDetails WHERE Vehicle_Display_Name LIKE @NumeVehicle";
            using (SqlConnection Connection = new SqlConnection(ConnectionDB))
            using (SqlCommand Command = new SqlCommand(Query, Connection))
            {
                // استخدام معلمة للتصفية. تأكد من تضمين نسبة (%) للبحث عن أي جزء من الاسم.
                Command.Parameters.AddWithValue("@NumeVehicle", "%" + NumeVehicle);

                try
                {
                    Connection.Open();
                    using (SqlDataReader Reader = Command.ExecuteReader())
                    {
                        while (Reader.Read())
                        {
                            int ID = Reader.IsDBNull(Reader.GetOrdinal("ID")) ? 0 : Convert.ToInt32(Reader["ID"]);
                            int MakeID = Reader.IsDBNull(Reader.GetOrdinal("MakeID")) ? 0 : Convert.ToInt32(Reader["MakeID"]);
                            int ModelID = Reader.IsDBNull(Reader.GetOrdinal("ModelID")) ? 0 : Convert.ToInt32(Reader["ModelID"]);
                            int SubModelID = Reader.IsDBNull(Reader.GetOrdinal("SubModelID")) ? 0 : Convert.ToInt32(Reader["SubModelID"]);
                            int BodyID = Reader.IsDBNull(Reader.GetOrdinal("BodyID")) ? 0 : Convert.ToInt32(Reader["BodyID"]);
                            string Vehicle_Display_Name = Reader.IsDBNull(Reader.GetOrdinal("Vehicle_Display_Name")) ? string.Empty : Convert.ToString(Reader["Vehicle_Display_Name"]);
                            int Year = Reader.IsDBNull(Reader.GetOrdinal("Year")) ? 0 : Convert.ToInt32(Reader["Year"]);
                            int DriveTypeID = Reader.IsDBNull(Reader.GetOrdinal("DriveTypeID")) ? 0 : Convert.ToInt32(Reader["DriveTypeID"]);
                            string Engine = Reader.IsDBNull(Reader.GetOrdinal("Engine")) ? string.Empty : Convert.ToString(Reader["Engine"]);
                            int Engine_CC = Reader.IsDBNull(Reader.GetOrdinal("Engine_CC")) ? 0 : Convert.ToInt32(Reader["Engine_CC"]);
                            int Engine_Cylinders = Reader.IsDBNull(Reader.GetOrdinal("Engine_Cylinders")) ? 0 : Convert.ToInt32(Reader["Engine_Cylinders"]);
                            decimal Engine_Liter_Display = Reader.IsDBNull(Reader.GetOrdinal("Engine_Liter_Display")) ? 0.0m : Convert.ToDecimal(Reader["Engine_Liter_Display"]);
                            int FuelTypeID = Reader.IsDBNull(Reader.GetOrdinal("FuelTypeID")) ? 0 : Convert.ToInt32(Reader["FuelTypeID"]);
                            int NumDoors = Reader.IsDBNull(Reader.GetOrdinal("NumDoors")) ? 0 : Convert.ToInt32(Reader["NumDoors"]);

                            Console.WriteLine($"ID: {ID}");
                            Console.WriteLine($"MakeID: {MakeID}");
                            Console.WriteLine($"ModelID: {ModelID}");
                            Console.WriteLine($"SubModelID: {SubModelID}");
                            Console.WriteLine($"BodyID: {BodyID}");
                            Console.WriteLine($"Vehicle_Display_Name: {Vehicle_Display_Name}");
                            Console.WriteLine($"Year: {Year}");
                            Console.WriteLine($"DriveTypeID: {DriveTypeID}");
                            Console.WriteLine($"Engine: {Engine}");
                            Console.WriteLine($"Engine_CC: {Engine_CC}");
                            Console.WriteLine($"Engine_Cylinders: {Engine_Cylinders}");
                            Console.WriteLine($"Engine_Liter_Display: {Engine_Liter_Display}");
                            Console.WriteLine($"FuelTypeID: {FuelTypeID}");
                            Console.WriteLine($"NumDoors: {NumDoors}");
                            Console.WriteLine("------------------------------------------------");
                        }
                    }
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Error: " + Ex.Message);
                    Console.WriteLine("Stack Trace: " + Ex.StackTrace);
                }
            }
        }

        static string RetrieveaSingleValue(string NumeVehicle)
        {
            string VehicleDisplayName = "";

            using (SqlConnection Connection = new SqlConnection(ConnectionDB))
            {
                string Query = "SELECT TOP 1 Vehicle_Display_Name FROM VehicleDetails WHERE Vehicle_Display_Name LIKE @NumeVehicle";
                using (SqlCommand Command = new SqlCommand(Query, Connection))
                {
                    Command.Parameters.AddWithValue("@NumeVehicle", "%" + NumeVehicle + "%");

                    try
                    {
                        Connection.Open();
                        object Result = Command.ExecuteScalar();
                        if (Result != DBNull.Value && Result != null)
                        {
                            VehicleDisplayName = Result.ToString();
                        }
                    }
                    catch (Exception Ex)
                    {
                        Console.WriteLine("Error: " + Ex.Message);
                    }
                }
            }

            return VehicleDisplayName;
        }

        static void Main(string[] args)
        {
            PrintAllVehicle(RetrieveaSingleValue("x"));
            Console.WriteLine(RetrieveaSingleValue("x"));
            Console.ReadLine();

        }
    }
}
