using System;
using System.Data;
using System.Net;
using System.Data.SqlClient;

public class Program
{
    // استبدل بسلسلة الاتصال الفعلية الخاصة بك
    static string connectionString = "Server=.;Database=ContactsDB;User Id=sa;Password=123456;";
   
    public struct stContact
    {
        public string FirstName { get; set; } // الاسم الأول
        public string LastName { get; set; } // الاسم الأخير
        public string Email { get; set; } // البريد الإلكتروني
        public string Phone { get; set; } // رقم الهاتف
        public string Address { get; set; } // العنوان
        public int CountryID { get; set; } // معرف البلد
    }

    static void UpdateContact(int ContactID, stContact ContactInfo)
    {
        // إنشاء اتصال بقاعدة البيانات باستخدام سلسلة الاتصال
        SqlConnection connection = new SqlConnection(connectionString);

        // الاستعلام لتحديث البيانات
        string query = @"Update Contacts  
                            set FirstName = @FirstName, 
                                LastName = @LastName, 
                                Email = @Email, 
                                Phone = @Phone, 
                                Address = @Address, 
                                CountryID = @CountryID
                                where ContactID = @ContactID";

        // إعداد الأمر مع الاستعلام وسلسلة الاتصال
        SqlCommand command = new SqlCommand(query, connection);

        // إضافة المعلمات للأمر
        command.Parameters.AddWithValue("@ContactID", ContactID);
        command.Parameters.AddWithValue("@FirstName", ContactInfo.FirstName);
        command.Parameters.AddWithValue("@LastName", ContactInfo.LastName);
        command.Parameters.AddWithValue("@Email", ContactInfo.Email);
        command.Parameters.AddWithValue("@Phone", ContactInfo.Phone);
        command.Parameters.AddWithValue("@Address", ContactInfo.Address);
        command.Parameters.AddWithValue("@CountryID", ContactInfo.CountryID);

        try
        {
            // فتح الاتصال بقاعدة البيانات
            connection.Open();

            // تنفيذ الاستعلام وإرجاع عدد الصفوف المتأثرة
            int rowsAffected = command.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                // إذا تم تحديث البيانات، عرض رسالة النجاح
                Console.WriteLine("Record Updated successfully.");
            }
            else
            {
                // إذا لم يتم تحديث البيانات، عرض رسالة الفشل
                Console.WriteLine("Record Update failed.");
            }
        }
        catch (Exception ex)
        {
            // عرض رسالة الخطأ في حال حدوث استثناء
            Console.WriteLine("Error: " + ex.Message);
        }
        finally
        {
            // إغلاق الاتصال بقاعدة البيانات
            connection.Close();
        }
    }

    public static void Main()
    {
        // إنشاء اتصال جديد بالمعلومات المطلوبة
        stContact ContactInfo = new stContact
        {
            FirstName = "Osama", // تعيين الاسم الأول
            LastName = "Abu-Mohammed", // تعيين الاسم الأخير
            Email = "Osama@game.com", // تعيين البريد الإلكتروني
            Phone = "238767237", // تعيين رقم الهاتف
            Address = "123 Main Street", // تعيين العنوان
            CountryID = 1 // تعيين معرف البلد
        };

        // استدعاء الدالة لتحديث البيانات
        UpdateContact(1, ContactInfo);

        // الانتظار حتى يقوم المستخدم بالضغط على مفتاح
        Console.ReadKey();
    }
}
