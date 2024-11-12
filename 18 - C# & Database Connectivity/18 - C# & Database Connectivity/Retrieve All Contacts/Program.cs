using System;
using System.Data;
using System.Net; // استيراد مكتبة النظام للشبكات (لا تُستخدم في هذا الكود ويمكن إزالتها)
using System.Data.SqlClient; // استيراد مكتبة التعامل مع SQL Server

public class Program
{
    // تعريف سلسلة الاتصال بقاعدة البيانات (يجب استبدالها بمعلومات الاتصال الفعلية)
    static string connectionString = "Server=.;Database=ContactsDB;User Id=sa;Password=123456;";

    // تعريف دالة لطباعة جميع جهات الاتصال من قاعدة البيانات
    static void PrintAllContacts()
    {
        // إنشاء اتصال جديد باستخدام سلسلة الاتصال
        SqlConnection connection = new SqlConnection(connectionString);

        // تعريف الاستعلام الذي يسترجع جميع السجلات من جدول "Contacts"
        string query = "SELECT * FROM Contacts";

        // إنشاء أمر SQL باستخدام الاستعلام والاتصال
        SqlCommand command = new SqlCommand(query, connection);

        try
        {
            // فتح الاتصال بقاعدة البيانات
            connection.Open();

            // تنفيذ الأمر واسترجاع البيانات باستخدام SqlDataReader
            SqlDataReader reader = command.ExecuteReader();

            // قراءة البيانات وعرضها على الشاشة
            while (reader.Read())
            {
                // قراءة كل حقل من السجل الحالي وتخزينه في متغيرات
                int contactID = (int)reader["ContactID"];
                string firstName = (string)reader["FirstName"];
                string lastName = (string)reader["LastName"];
                string email = (string)reader["Email"];
                string phone = (string)reader["Phone"];
                string address = (string)reader["Address"];
                int countryID = (int)reader["CountryID"];

                // عرض البيانات على الشاشة
                Console.WriteLine($"Contact ID: {contactID}");
                Console.WriteLine($"Name: {firstName} {lastName}");
                Console.WriteLine($"Email: {email}");
                Console.WriteLine($"Phone: {phone}");
                Console.WriteLine($"Address: {address}");
                Console.WriteLine($"Country ID: {countryID}");
                Console.WriteLine("ــــــــــــــــــــــــــــــــ");
                Console.WriteLine();
                
            }

            // إغلاق الـ SqlDataReader
            reader.Close();
            // إغلاق الاتصال بقاعدة البيانات
            connection.Close();

        }
        catch (Exception ex) // التعامل مع أي خطأ يحدث أثناء الاتصال أو القراءة من قاعدة البيانات
        {
            // عرض رسالة الخطأ على الشاشة
            Console.WriteLine("Error: " + ex.Message);
        }
    }

    // الدالة الرئيسية التي تنفذ عند تشغيل البرنامج
    public static void Main()
    {
        // استدعاء دالة طباعة جميع جهات الاتصال
        PrintAllContacts();

        // انتظار المستخدم للضغط على أي مفتاح قبل إغلاق البرنامج
        Console.ReadKey();
    }

}
