using System;
using System.Data.SqlClient;

namespace Project_Connection_Database
{
    internal class Program
    {
        static string ConnectionString = "Server=.;Database=EmployeesDB;User Id=sa;Password=123456;";

        static void PrintEmployeesDetails(int Number)
        {
            using (SqlConnection Connection = new SqlConnection(ConnectionString))
            {
                string Query = "Select * from Employees WHERE Salary > @Number";
                SqlCommand Command = new SqlCommand(Query, Connection);

                Command.Parameters.AddWithValue("@Number", Number);
                try
                {
                    Connection.Open();
                    using (SqlDataReader Reader = Command.ExecuteReader())
                    {
                        while (Reader.Read())
                        {
                            int EmployeeID = Reader.IsDBNull(Reader.GetOrdinal("EmployeeID")) ? 0 : Convert.ToInt32(Reader["EmployeeID"]);
                            string Name = Reader.IsDBNull(Reader.GetOrdinal("Name")) ? "Unknown" : Convert.ToString(Reader["Name"]);
                            int ManagerID = Reader.IsDBNull(Reader.GetOrdinal("ManagerID")) ? 0 : Convert.ToInt32(Reader["ManagerID"]);
                            string Salary = Reader.IsDBNull(Reader.GetOrdinal("Salary")) ? "0" : Convert.ToString(Reader["Salary"]);

                            Console.WriteLine($"EmployeeID : {EmployeeID}");
                            Console.WriteLine($"Name  : {Name}");
                            Console.WriteLine($"ManagerID : {ManagerID}");
                            Console.WriteLine($"Salary : {Salary}");
                            Console.WriteLine(); // لإضافة فاصل بين السجلات
                        }
                    }
                }
                catch (Exception Ex)
                {
                    Console.WriteLine($"Error : {Ex.Message}");
                }
            }
        }

        static void Main(string[] args)
        {
            PrintEmployeesDetails(10);
            Console.ReadKey(); // تم وضع Console.ReadKey هنا لانتظار المستخدم بعد عرض كل السجلات
        }
    }
}
