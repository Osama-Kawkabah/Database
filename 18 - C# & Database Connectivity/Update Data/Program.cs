﻿using System;
using System.Data;
using System.Net;
using System.Data.SqlClient;

public class Program
{
    static string connectionString = "Server=.;Database=ContactsDB;User Id=sa;Password=123456;"; // Replace with your actual connection string


    public struct stContact
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public int CountryID { get; set; }
    }

    static void UpdateContact(int ContactID, stContact ContactInfo)
    {


        SqlConnection connection = new SqlConnection(connectionString);
        
        string query = @"Update  Contacts  
                            set FirstName = @FirstName, 
                                LastName = @LastName, 
                                Email = @Email, 
                                Phone = @Phone, 
                                Address = @Address, 
                                CountryID = @CountryID
                                where ContactID = @ContactID";

        SqlCommand command = new SqlCommand(query, connection);
            
                command.Parameters.AddWithValue("@ContactID", ContactID);
                command.Parameters.AddWithValue("@FirstName", ContactInfo.FirstName);
                command.Parameters.AddWithValue("@LastName", ContactInfo.LastName);
                command.Parameters.AddWithValue("@Email", ContactInfo.Email);
                command.Parameters.AddWithValue("@Phone", ContactInfo.Phone);
                command.Parameters.AddWithValue("@Address", ContactInfo.Address);
                command.Parameters.AddWithValue("@CountryID", ContactInfo.CountryID);

                try
                {
                    connection.Open();

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Console.WriteLine("Record Updated successfully.");
                    }
                    else
                    {
                        Console.WriteLine("Record Upadate failed.");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            
        
    }

    public static void Main()
    {

        // Create a new contact with the required information
        stContact ContactInfo = new stContact
        {
            FirstName = "Mohammed",
            LastName = "Abu-Hadhoud",
            Email = "m@example.com",
            Phone = "1234567890",
            Address = "123 Main Street",
            CountryID = 1
        };

        UpdateContact(1, ContactInfo);

        Console.ReadKey();

    }

}
