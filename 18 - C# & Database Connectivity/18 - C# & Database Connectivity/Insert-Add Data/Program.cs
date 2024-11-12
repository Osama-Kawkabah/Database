using System; // استيراد مكتبة System الأساسية
using System.Data.SqlClient; // استيراد مكتبة SqlClient للتعامل مع قواعد بيانات SQL Server

namespace Insert_Add_Data
{
    internal class Program
    {
        // سلسلة الاتصال بقاعدة البيانات
        static string ConnectionDB = "Server=localhost;Database=ContactsDB; User Id=sa;Password=123456";

        public struct stContacts
        {
            public int ContactID { get; } // معرف الاتصال (لا يمكن تعديله بعد تعيينه)
            public string FirstName { get; set; } // الاسم الأول
            public string LastName { get; set; } // الاسم الأخير
            public string Email { get; set; } // البريد الإلكتروني
            public string Phone { get; set; } // رقم الهاتف
            public string Address { get; set; } // العنوان
            public int CountryID { get; set; } // معرف البلد
        }

        static void Insert_AddData_In_Dadabase(stContacts newContacts)
        {
            // إنشاء اتصال بقاعدة البيانات باستخدام سلسلة الاتصال
            SqlConnection Connection = new SqlConnection(ConnectionDB);

            // الاستعلام لإدخال البيانات في جدول Contacts
            string Query = @"INSERT INTO Contacts(FirstName,LastName,Email,Phone,Address,CountryID)
                           VALUES  (@FirstName,@LastName,@Email,@Phone,@Address,@CountryID);
                           SELECT SCOPE_IDENTITY();"; // استخدام SELECT SCOPE_IDENTITY() لاسترجاع ContactID الجديد

            SqlCommand Command = new SqlCommand(Query, Connection); // إنشاء أمر SQL مع الاستعلام وسلسلة الاتصال
            Command.Parameters.AddWithValue("@FirstName", newContacts.FirstName); // إضافة معلمة الاسم الأول
            Command.Parameters.AddWithValue("@LastName", newContacts.LastName); // إضافة معلمة الاسم الأخير
            Command.Parameters.AddWithValue("@Email", newContacts.Email); // إضافة معلمة البريد الإلكتروني
            Command.Parameters.AddWithValue("@Phone", newContacts.Phone); // إضافة معلمة رقم الهاتف
            Command.Parameters.AddWithValue("@Address", newContacts.Address); // إضافة معلمة العنوان
            Command.Parameters.AddWithValue("@CountryID", newContacts.CountryID); // إضافة معلمة معرف البلد

            try
            {
                Connection.Open(); // فتح الاتصال بقاعدة البيانات

                // تنفيذ الاستعلام وإرجاع معرف الاتصال الجديد
                object Resurt = Command.ExecuteScalar();

                if (Resurt != null && int.TryParse(Resurt.ToString(), out int ContactID))
                {
                    // إذا تم إدخال بيانات، عرض معرف الاتصال الجديد
                    Console.WriteLine("Operation succeeded! Contact ID: " + ContactID);
                }
                else
                {
                    // إذا لم يتم إدخال بيانات، عرض رسالة الفشل
                    Console.WriteLine("Operation failed. No rows were affected.");
                }
            }
            catch (Exception Ex)
            {
                // عرض رسالة الخطأ في حال حدوث استثناء
                Console.WriteLine($"Error: {Ex.Message}");
            }

            // إغلاق الاتصال بقاعدة البيانات
            Connection.Close();
        }

        static void Main(string[] args)
        {
            stContacts Contacts = new stContacts
            {
                FirstName = "OsamaAli", // تعيين الاسم الأول
                LastName = "Kokabah", // تعيين الاسم الأخير
                Email = "OsamaAli@gmail.com", // تعيين البريد الإلكتروني
                Phone = "7780632464", // تعيين رقم الهاتف
                Address = "123 Main Street", // تعيين العنوان
                CountryID = 1 // تعيين معرف البلد
            };

            Insert_AddData_In_Dadabase(Contacts); // استدعاء الدالة لإدخال البيانات في قاعدة البيانات
        }
    }
}
