using System;
using System.Data.SqlClient;

namespace Find_Single_Contact
{
    internal class Program
    {
        static string ConnectionDB = "Server=localhost;Database=VehicleMakesDB;Integrated Security=True";

        static bool Find_Single_Contact_Data(int infData, ref stContact Contact)
        {
            bool IsFound = false;
            SqlConnection Connection = new SqlConnection(ConnectionDB);

            string Query = "SELECT ID, MakeID, ModelID, SubModelID, BodyID, Vehicle_Display_Name, Year, DriveTypeID, Engine, NumDoors FROM VehicleDetails WHERE ID = @infData";
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.AddWithValue("@infData", infData);
            try
            {
                Connection.Open();
                SqlDataReader Reader = Command.ExecuteReader();

                if (Reader.Read())
                {
                    IsFound = true;
                    Contact.ID = TryParseInt(Reader["ID"]);
                    Contact.MakeID = TryParseInt(Reader["MakeID"]);
                    Contact.ModelID = TryParseInt(Reader["ModelID"]);
                    Contact.SubModelID = TryParseInt(Reader["SubModelID"]);
                    Contact.BodyID = TryParseInt(Reader["BodyID"]);
                    Contact.Vehicle_Display_Name = Reader["Vehicle_Display_Name"] != DBNull.Value ? Reader["Vehicle_Display_Name"].ToString() : string.Empty;
                    Contact.Year = TryParseInt(Reader["Year"]);
                    Contact.DriveTypeID = TryParseInt(Reader["DriveTypeID"]);
                    Contact.Engine = TryParseInt(Reader["Engine"]);
                    Contact.NumDoors = Reader["NumDoors"] != DBNull.Value ? Reader["NumDoors"].ToString() : string.Empty;
                }
                else
                {
                    IsFound = false;
                }
                Reader.Close();
                Connection.Close();
            }
            catch (Exception Ex)
            {
                Console.WriteLine("Error: " + Ex.Message);
                Console.WriteLine("Stack Trace: " + Ex.StackTrace);
            }
            return IsFound;
        }

        static int TryParseInt(object value)
        {
            int result = 0;
            if (value != DBNull.Value)
            {
                int.TryParse(value.ToString(), out result);
            }
            return result;
        }

        struct stContact
        {
            public int ID { get; set; }
            public int MakeID { get; set; }
            public int ModelID { get; set; }
            public int SubModelID { get; set; }
            public int BodyID { get; set; }
            public string Vehicle_Display_Name { get; set; }
            public int Year { get; set; }
            public int DriveTypeID { get; set; }
            public int Engine { get; set; }
            public string NumDoors { get; set; }
        }

        static void Main(string[] args)
        {
            stContact contact = new stContact();
            if (Find_Single_Contact_Data(223333, ref contact))
            {
                Console.WriteLine($"ID: {contact.ID}");
                Console.WriteLine($"MakeID: {contact.MakeID}");
                Console.WriteLine($"ModelID: {contact.ModelID}");
                Console.WriteLine($"SubModelID: {contact.SubModelID}");
                Console.WriteLine($"BodyID: {contact.BodyID}");
                Console.WriteLine($"Vehicle_Display_Name: {contact.Vehicle_Display_Name}");
                Console.WriteLine($"Year: {contact.Year}");
                Console.WriteLine($"DriveTypeID: {contact.DriveTypeID}");
                Console.WriteLine($"Engine: {contact.Engine}");
                Console.WriteLine($"NumDoors: {contact.NumDoors}");
                Console.WriteLine("------------------------------------------------");
            }
            else
            {
                Console.WriteLine("Data Is Not Found!");
            }
            Console.ReadLine();
        }
    }
}
