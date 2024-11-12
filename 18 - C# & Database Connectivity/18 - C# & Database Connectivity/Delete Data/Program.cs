using System;
using System.Data;
using System.Net;
using System.Data.SqlClient;

public class Program
{
    // استبدل بسلسلة الاتصال الفعلية الخاصة بك
    static string connectionString = "Server=.;Database=ContactsDB;User Id=sa;Password=123456;";


    static void DeleteContact(int ContactID)
    {
        // إنشاء اتصال بقاعدة البيانات باستخدام سلسلة الاتصال
        SqlConnection connection = new SqlConnection(connectionString);

        // الاستعلام لتحديث البيانات
        string query = @"DELETE FROM Contacts
                         WHERE ContactID = @ContactID";

        // إعداد الأمر مع الاستعلام وسلسلة الاتصال
        SqlCommand command = new SqlCommand(query, connection);

        // إضافة المعلمات للأمر
        command.Parameters.AddWithValue("@ContactID", ContactID);

        try
        {
            // فتح الاتصال بقاعدة البيانات
            connection.Open();

            // تنفيذ الاستعلام وإرجاع عدد الصفوف المتأثرة
            int rowsAffected = command.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                // إذا تم تحديث البيانات، عرض رسالة النجاح
                Console.WriteLine("Record Deleet successfully.");
            }
            else
            {
                // إذا لم يتم تحديث البيانات، عرض رسالة الفشل
                Console.WriteLine("Record Deleet failed.");
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

        // استدعاء الدالة لتحديث البيانات
        DeleteContact(14);

        // الانتظار حتى يقوم المستخدم بالضغط على مفتاح
        Console.ReadKey();
    }
}
