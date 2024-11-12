using System;
using System.Data;
using System.Data.SqlClient;

class Program
{
    static void Main()
    {
        // تعريف سلسلة الاتصال بقاعدة البيانات
        string connectionString = "Server=.;Database=HR_Database;User Id=sa;Password=123456;";

        // إنشاء DataSet جديد لتخزين البيانات
        DataSet dataSet = new DataSet();

        // إنشاء SqlDataAdapter مع جملة SELECT وسلسلة الاتصال
        string query = "SELECT * FROM Employees;";
        SqlDataAdapter dataAdapter = new SqlDataAdapter(query, connectionString);

        // فتح الاتصال بقاعدة البيانات
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        // تعيين SelectCommand الخاص بـ DataAdapter إلى الاتصال الحالي
        dataAdapter.SelectCommand.Connection = connection;

        // ملء DataSet بالبيانات من المصدر
        dataAdapter.Fill(dataSet, "Employees");

        // إغلاق الاتصال بقاعدة البيانات
        connection.Close();

        // عرض البيانات من DataSet
        DataTable employeesTable = dataSet.Tables["Employees"];
        foreach (DataRow row in employeesTable.Rows)
        {
            // طباعة البيانات على الشاشة
            Console.WriteLine("Employee ID: {0}, Name: {1}, LastName: {2}", row["ID"], row["FirstName"], row["LastName"]);
        }

        // (هنا يمكنك إضافة أكواد لإجراء تغييرات على DataSet مثل الإضافة أو التعديل أو الحذف)

        // تحديث قاعدة البيانات بالتغييرات التي تمت على DataSet
        connection.Open();

        // تعيين UpdateCommand الخاص بـ DataAdapter إلى الاتصال الحالي
        dataAdapter.UpdateCommand.Connection = connection;

        // تحديث مصدر البيانات بالتغييرات
        dataAdapter.Update(dataSet, "Employees");

        // إغلاق الاتصال بقاعدة البيانات
        connection.Close();
    }
}
