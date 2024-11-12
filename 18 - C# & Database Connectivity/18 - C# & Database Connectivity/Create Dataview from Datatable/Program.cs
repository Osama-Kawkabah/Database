using System;
using System.Data;

namespace Create_Dataview_from_Datatable
{
    internal class Program
    {
        static void Main(string[] args)
        {
            DataTable EmployeesDataTable = new DataTable();

            // تعريف الأعمدة مع ملاحظات توضيحية
            DataColumn idColumn = new DataColumn();
            idColumn.ColumnName = "ID"; // ملاحظة: معرف الموظف
            idColumn.DataType = typeof(int);
            idColumn.AutoIncrement = true;
            idColumn.AutoIncrementSeed = 1;
            idColumn.AutoIncrementStep = 1;
            idColumn.AllowDBNull = false;
            idColumn.Unique = true;
            idColumn.Caption = "ID"; // عنوان العمود
            EmployeesDataTable.Columns.Add(idColumn);

            DataColumn nameColumn = new DataColumn();
            nameColumn.ColumnName = "Name"; // ملاحظة: اسم الموظف
            nameColumn.DataType = typeof(string);
            nameColumn.AllowDBNull = false;
            nameColumn.Caption = "Name"; // عنوان العمود
            EmployeesDataTable.Columns.Add(nameColumn);

            DataColumn countryColumn = new DataColumn();
            countryColumn.ColumnName = "Country"; // ملاحظة: بلد الموظف
            countryColumn.DataType = typeof(string);
            countryColumn.AllowDBNull = false;
            countryColumn.Caption = "Country"; // عنوان العمود
            EmployeesDataTable.Columns.Add(countryColumn);

            DataColumn salaryColumn = new DataColumn();
            salaryColumn.ColumnName = "Salary"; // ملاحظة: راتب الموظف
            salaryColumn.DataType = typeof(double);
            salaryColumn.AllowDBNull = false;
            salaryColumn.Caption = "Salary"; // عنوان العمود
            EmployeesDataTable.Columns.Add(salaryColumn);

            DataColumn dateColumn = new DataColumn();
            dateColumn.ColumnName = "Date"; // ملاحظة: تاريخ التوظيف
            dateColumn.DataType = typeof(DateTime);
            dateColumn.AllowDBNull = false;
            dateColumn.Caption = "Date"; // عنوان العمود
            EmployeesDataTable.Columns.Add(dateColumn);

            // تعيين المفتاح الأساسي للجدول
            EmployeesDataTable.PrimaryKey = new DataColumn[] { EmployeesDataTable.Columns["ID"] };

            // إضافة بيانات للجدول

            EmployeesDataTable.Rows.Add(null, "Osama Ali", "Saudi Arabia", 5000.00m, new DateTime(1990, 5, 21));
            EmployeesDataTable.Rows.Add(null, "Mohammed", "Egypt", 4500.00m, new DateTime(1988, 11, 30));
            EmployeesDataTable.Rows.Add(null, "Ali Hassan", "Jordan", 6000.00m, new DateTime(1985, 3, 14));
            EmployeesDataTable.Rows.Add(null, "Sara Ahmed", "UAE", 7000.00m, new DateTime(1992, 7, 17));
            EmployeesDataTable.Rows.Add(null, "Fatima Yaseen", "Bahrain", 6500.00m, new DateTime(1989, 2, 10));
            EmployeesDataTable.Rows.Add(null, "Khalid Omar", "Kuwait", 5500.00m, new DateTime(1986, 12, 25));
            EmployeesDataTable.Rows.Add(null, "Lina Khalid", "Qatar", 4800.00m, new DateTime(1993, 4, 9));
            EmployeesDataTable.Rows.Add(null, "Ahmad Saleh", "Oman", 5300.00m, new DateTime(1991, 6, 13));
            EmployeesDataTable.Rows.Add(null, "Mona Khalid", "Lebanon", 5900.00m, new DateTime(1987, 8, 29));
            EmployeesDataTable.Rows.Add(null, "Nora Hussein", "Morocco", 6200.00m, new DateTime(1984, 1, 19));
            EmployeesDataTable.Rows.Add(null, "Hassan Ali", "Algeria", 5600.00m, new DateTime(1983, 11, 5));
            EmployeesDataTable.Rows.Add(null, "Yaseen Omar", "Tunisia", 5700.00m, new DateTime(1990, 2, 23));
            EmployeesDataTable.Rows.Add(null, "Nada Saleh", "Libya", 5100.00m, new DateTime(1982, 9, 17));
            EmployeesDataTable.Rows.Add(null, "Rami Hassan", "Sudan", 6300.00m, new DateTime(1994, 3, 4));
            EmployeesDataTable.Rows.Add(null, "Hala Yaseen", "Iraq", 6800.00m, new DateTime(1986, 10, 28));
            EmployeesDataTable.Rows.Add(null, "Omar Ali", "Yemen", 5400.00m, new DateTime(1991, 7, 14));
            EmployeesDataTable.Rows.Add(null, "Mariam Khalid", "Syria", 6500.00m, new DateTime(1985, 8, 3));
            EmployeesDataTable.Rows.Add(null, "Layla Saleh", "Palestine", 6000.00m, new DateTime(1987, 5, 6));
            EmployeesDataTable.Rows.Add(null, "Amal Hussein", "Jordan", 5200.00m, new DateTime(1989, 12, 12));
            EmployeesDataTable.Rows.Add(null, "Zaid Ali", "Egypt", 4700.00m, new DateTime(1988, 4, 25));
            EmployeesDataTable.Rows.Add(null, "Rania Khalid", "Lebanon", 5900.00m, new DateTime(1992, 9, 7));
            EmployeesDataTable.Rows.Add(null, "Iman Yaseen", "Saudi Arabia", 6100.00m, new DateTime(1986, 11, 15));
            EmployeesDataTable.Rows.Add(null, "Sami Omar", "UAE", 6400.00m, new DateTime(1985, 6, 21));
            EmployeesDataTable.Rows.Add(null, "Laila Hussein", "Bahrain", 6700.00m, new DateTime(1984, 2, 18));
            EmployeesDataTable.Rows.Add(null, "Hassan Saleh", "Kuwait", 5500.00m, new DateTime(1993, 10, 30));
            EmployeesDataTable.Rows.Add(null, "Waleed Ali", "Oman", 5000.00m, new DateTime(1991, 7, 5));
            EmployeesDataTable.Rows.Add(null, "Maha Khalid", "Qatar", 5700.00m, new DateTime(1989, 12, 19));
            EmployeesDataTable.Rows.Add(null, "Sara Saleh", "Jordan", 5900.00m, new DateTime(1990, 8, 2));
            EmployeesDataTable.Rows.Add(null, "Yara Hussein", "Morocco", 6100.00m, new DateTime(1987, 3, 11));
            EmployeesDataTable.Rows.Add(null, "Samir Ali", "Algeria", 5800.00m, new DateTime(1992, 5, 8));

            // إنشاء DataView لعرض البيانات
            DataView dataView = EmployeesDataTable.DefaultView;
            dataView.RowFilter = "Salary > 6000";
            dataView.Sort = "Name ASC";


            // طباعة البيانات باستخدام DataView
            for (int i = 0; i < dataView.Count; i++)
                {
                    Console.WriteLine($"----------------{dataView[i]["ID"]}--------------");
                    Console.WriteLine($"Name : {dataView[i]["Name"]}");
                    Console.WriteLine($"Country : {dataView[i]["Country"]}");
                    Console.WriteLine($"Salary : {dataView[i]["Salary"]}");
                    Console.WriteLine($"Date : {dataView[i]["Date"]}");
                    Console.WriteLine("--------------------------------");
                }

            Console.ReadLine();
        }
    }
}
