using System;
using System.Linq;
using System.Data;

namespace DataTable_Example_1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            DataTable EmployeesDataTable = new DataTable();
            //Employees.Columns.Add("ID", typeof(int));
            //Employees.Columns.Add("Name", typeof(string));
            //Employees.Columns.Add("Country", typeof(string));
            //Employees.Columns.Add("Salary", typeof(decimal));
            //Employees.Columns.Add("Date", typeof(DateTime));

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


            DataColumn[] PrimaryKey = new DataColumn[1];
            PrimaryKey[0] = EmployeesDataTable.Columns["ID"];
            EmployeesDataTable.PrimaryKey = PrimaryKey;


            EmployeesDataTable.PrimaryKey = new DataColumn[] { EmployeesDataTable.Columns["ID"] };

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

            // متغيرات لحساب الإحصائيات
            decimal EmployeesCount = 0;
            decimal TotalSalaries = 0;
            decimal AverageSalaries = 0;
            decimal MaxSalary = 0;
            decimal MinSalary = 0;

            // حساب عدد الموظفين
            EmployeesCount = EmployeesDataTable.Rows.Count;

            // حساب مجموع الرواتب
            TotalSalaries = Convert.ToDecimal(EmployeesDataTable.Compute("SUM(Salary)", string.Empty));

            // حساب متوسط الرواتب
            AverageSalaries = Convert.ToDecimal(EmployeesDataTable.Compute("AVG(Salary)", string.Empty));

            // حساب أعلى راتب
            MaxSalary = Convert.ToDecimal(EmployeesDataTable.Compute("Max(Salary)", string.Empty));

            // حساب أقل راتب
            MinSalary = Convert.ToDecimal(EmployeesDataTable.Compute("Min(Salary)", string.Empty));

            // Title: Employee Data Table
            Console.WriteLine("\tEmployee Data Table");
            Console.WriteLine("\t ______________________________________________________________________________________________________");
            Console.WriteLine("\t|{0,-5}|{1,-30}|{2,-25}|{3,-15}|{4,-20}  |", "ID", "Name", "Country", "Salary", "Date Of Birth");

            // طباعة البيانات مع الحدود الفاصلة
            foreach (DataRow row in EmployeesDataTable.Rows)
            {
                Console.WriteLine("\t|-----------------------------------------------------------------------------------------------------|");
                Console.WriteLine("\t|{0,-5}|{1,-30}|{2,-25}|{3,-15}|{4,-20} |", row["ID"], row["Name"], row["Country"], row["Salary"], row["Date"]);
            }
            Console.WriteLine("\t|_____________________________________________________________________________________________________|");

            Console.WriteLine("\n\n");

            // Title: Salary Summary
            Console.WriteLine("\tSalary Summary");
            Console.WriteLine("\t ________________________________________________________________________________");
            Console.WriteLine("\t|{0,-15}|{1,-15}|{2,-15}|{3,-15}|{4,-15} |", "EmployeesCount", "TotalSalaries", "AverageSalaries", "MinSalary", "MaxSalary");
            Console.WriteLine("\t|---------------|---------------|---------------|---------------|--------------- |");
            Console.WriteLine("\t|{0,-15}|{1,-15}|{2,-15}|{3,-15}|{4,-15} |", EmployeesCount, TotalSalaries, AverageSalaries, MinSalary, MaxSalary);
            Console.WriteLine("\t|________________________________________________________________________________|");

            int ResurltCount = 0;
            DataRow[] ResurltRows;

            // Title: Employees with Salary > 5500
            Console.WriteLine("\n\n\tEmployees with Salary > 5500");
            ResurltRows = EmployeesDataTable.Select("Salary > 5500");
            foreach (DataRow row in ResurltRows)
            {
                Console.WriteLine("\t|-----------------------------------------------------------------------------------------------------|");
                Console.WriteLine("\t|{0,-5}|{1,-30}|{2,-25}|{3,-15}|{4,-20} |", row["ID"], row["Name"],
                                    row["Country"], row["Salary"], row["Date"]);
            }
            Console.WriteLine("\t|_____________________________________________________________________________________________________|");

            ResurltCount = ResurltRows.Count();

            // حساب مجموع الرواتب
            TotalSalaries = Convert.ToDecimal(EmployeesDataTable.Compute("SUM(Salary)", "Salary > 5500"));
            AverageSalaries = Convert.ToDecimal(EmployeesDataTable.Compute("AVG(Salary)", "Salary > 5500"));
            MaxSalary = Convert.ToDecimal(EmployeesDataTable.Compute("Max(Salary)", "Salary > 5500"));
            MinSalary = Convert.ToDecimal(EmployeesDataTable.Compute("Min(Salary)", "Salary > 5500"));

            // Title: Salary Statistics for Employees with Salary > 5500
            Console.WriteLine("\tSalary Statistics for Employees with Salary > 5500");
            Console.WriteLine("\t _______________________________________________________________________________________________");
            Console.WriteLine("\t|{0,-15}|{1,-15}|{2,-30}|{3,-15}|{4,-15} |", "ResurltCount", "Total Salaries", "Average Salaries", "Min Salary", "Max Salary");
            Console.WriteLine("\t|---------------|---------------|------------------------------|---------------|--------------- |");
            Console.WriteLine("\t|{0,-15}|{1,-15}|{2,-30}|{3,-15}|{4,-15} |", ResurltCount, TotalSalaries, AverageSalaries.ToString("F5"), MinSalary, MaxSalary);
            Console.WriteLine("\t|_______________________________________________________________________________________________|");

            // Title: Employees with Salary > 5500 and < 6000
            Console.WriteLine("\n\n\tEmployees with Salary > 5500 and < 6000");
            ResurltRows = EmployeesDataTable.Select("Salary > 5500 AND Salary < 6000");

            foreach (DataRow row in ResurltRows)
            {
                Console.WriteLine("\t|-----------------------------------------------------------------------------------------------------|");
                Console.WriteLine("\t|{0,-5}|{1,-30}|{2,-25}|{3,-15}|{4,-20} |", row["ID"], row["Name"],
                                    row["Country"], row["Salary"], row["Date"]);
            }
            Console.WriteLine("\t|_____________________________________________________________________________________________________|");

            // حساب مجموع الرواتب
            TotalSalaries = Convert.ToDecimal(EmployeesDataTable.Compute("SUM(Salary)", "Salary > 5500 AND Salary < 6000"));
            AverageSalaries = Convert.ToDecimal(EmployeesDataTable.Compute("AVG(Salary)", "Salary > 5500 AND Salary < 6000"));
            MaxSalary = Convert.ToDecimal(EmployeesDataTable.Compute("Max(Salary)", "Salary > 5500 AND Salary < 6000"));
            MinSalary = Convert.ToDecimal(EmployeesDataTable.Compute("Min(Salary)", "Salary > 5500 AND Salary < 6000"));

            // Title: Salary Statistics for Employees with Salary > 5500 and < 6000
            Console.WriteLine("\tSalary Statistics for Employees with Salary > 5500 and < 6000");
            Console.WriteLine("\t _______________________________________________________________________________________________");
            Console.WriteLine("\t|{0,-15}|{1,-15}|{2,-30}|{3,-15}|{4,-15} |", "ResurltCount", "Total Salaries", "Average Salaries", "Min Salary", "Max Salary");
            Console.WriteLine("\t|---------------|---------------|------------------------------|---------------|--------------- |");
            Console.WriteLine("\t|{0,-15}|{1,-15}|{2,-30}|{3,-15}|{4,-15} |", ResurltCount, TotalSalaries, AverageSalaries.ToString("F5"), MinSalary, MaxSalary);
            Console.WriteLine("\t|_______________________________________________________________________________________________|");

            // Title: Selected Employees by ID (1, 3, 4)
            Console.WriteLine("\n\n\tSelected Employees by ID (1, 3, 4)");
            ResurltRows = EmployeesDataTable.Select("ID = 1 OR ID=3 OR ID =4");

            foreach (DataRow row in ResurltRows)
            {
                Console.WriteLine("\t|-----------------------------------------------------------------------------------------------------|");
                Console.WriteLine("\t|{0,-5}|{1,-30}|{2,-25}|{3,-15}|{4,-20} |", row["ID"], row["Name"],
                                    row["Country"], row["Salary"], row["Date"]);
            }
            Console.WriteLine("\t|_____________________________________________________________________________________________________|");

            ResurltCount = ResurltRows.Count();
            TotalSalaries = Convert.ToDecimal(EmployeesDataTable.Compute("SUM(Salary)", "ID = 1 OR ID=3"));
            AverageSalaries = Convert.ToDecimal(EmployeesDataTable.Compute("AVG(Salary)", "ID = 1 OR ID=3"));
            MaxSalary = Convert.ToDecimal(EmployeesDataTable.Compute("Max(Salary)", "ID = 1 OR ID=3"));
            MinSalary = Convert.ToDecimal(EmployeesDataTable.Compute("Min(Salary)", "ID = 1 OR ID=3"));

            // Title: Salary Statistics for Selected Employees (ID 1, 3)
            Console.WriteLine("\tSalary Statistics for Selected Employees (ID 1, 3)");
            Console.WriteLine("\t _______________________________________________________________________________________________");
            Console.WriteLine("\t|{0,-15}|{1,-15}|{2,-30}|{3,-15}|{4,-15} |", "ResurltCount", "Total Salaries", "Average Salaries", "Min Salary", "Max Salary");
            Console.WriteLine("\t|---------------|---------------|------------------------------|---------------|--------------- |");
            Console.WriteLine("\t|{0,-15}|{1,-15}|{2,-30}|{3,-15}|{4,-15} |", ResurltCount, TotalSalaries, AverageSalaries.ToString("F5"), MinSalary, MaxSalary);
            Console.WriteLine("\t|_______________________________________________________________________________________________|");

            // Title: Employees born between 1988 and 1992
            Console.WriteLine("\n\n\tEmployees born between 1988 and 1992");
            ResurltRows = EmployeesDataTable.Select("Date >= #1988/01/01# AND Date <= #1992/12/31#");

            foreach (DataRow row in ResurltRows)
            {
                Console.WriteLine("\t|-----------------------------------------------------------------------------------------------------|");
                Console.WriteLine("\t|{0,-5}|{1,-30}|{2,-25}|{3,-15}|{4,-20} |", row["ID"], row["Name"],
                                    row["Country"], row["Salary"], row["Date"]);
            }
            Console.WriteLine("\t|_____________________________________________________________________________________________________|");

            ResurltCount = ResurltRows.Count();

            TotalSalaries = Convert.ToDecimal(EmployeesDataTable.Compute("SUM(Salary)", "Date >= #1988/01/01# AND Date <= #1992/12/31#"));
            AverageSalaries = Convert.ToDecimal(EmployeesDataTable.Compute("AVG(Salary)", "Date >= #1988/01/01# AND Date <= #1992/12/31#"));
            MaxSalary = Convert.ToDecimal(EmployeesDataTable.Compute("Max(Salary)", "Date >= #1988/01/01# AND Date <= #1992/12/31#"));
            MinSalary = Convert.ToDecimal(EmployeesDataTable.Compute("Min(Salary)", "Date >= #1988/01/01# AND Date <= #1992/12/31#"));

            // Title: Salary Statistics for Employees born between 1988 and 1992
            Console.WriteLine("\tSalary Statistics for Employees born between 1988 and 1992");
            Console.WriteLine("\t _______________________________________________________________________________________________");
            Console.WriteLine("\t|{0,-15}|{1,-15}|{2,-30}|{3,-15}|{4,-15} |", "ResurltCount", "Total Salaries", "Average Salaries", "Min Salary", "Max Salary");
            Console.WriteLine("\t|---------------|---------------|------------------------------|---------------|--------------- |");
            Console.WriteLine("\t|{0,-15}|{1,-15}|{2,-30}|{3,-15}|{4,-15} |", ResurltCount, TotalSalaries, AverageSalaries.ToString("F5"), MinSalary, MaxSalary);
            Console.WriteLine("\t|_______________________________________________________________________________________________|");

            // البحث عن الصفوف التي تتطابق مع الشروط المحددة
            DataRow[] ResultUpdate = EmployeesDataTable.Select("ID = 1 OR ID = 2 OR ID = 3");

            // تحديث الأعمدة المطلوبة في الصفوف المحددة بناءً على ID
            foreach (DataRow row in ResultUpdate)
            {
                switch (row["ID"].ToString())
                {
                    case "1":
                        row["Name"] = "Osama Ali Kokabah";
                        row["Country"] = "Yemen";
                        row["Salary"] = 500000;
                        break;
                    case "2":
                        row["Name"] = "Mohammed Osama Ali Kokabah";
                        row["Country"] = "Yemen";
                        row["Salary"] = 300000;
                        break;
                    case "3":
                        row["Name"] = "Lama Osama Ali Kokabah";
                        row["Country"] = "Yemen";
                        row["Salary"] = 200000;
                        break;
                }
            }

            EmployeesDataTable.AcceptChanges();

            // عرض النتائج بعد التحديث
            Console.WriteLine("\n\n");
            foreach (DataRow row in EmployeesDataTable.Rows)
            {
                Console.WriteLine("\t|-----------------------------------------------------------------------------------------------------|");
                Console.WriteLine("\t|{0,-5}|{1,-30}|{2,-25}|{3,-15}|{4,-20} |", row["ID"], row["Name"], row["Country"], row["Salary"], row["Date"]);
            }
            Console.WriteLine("\t|_____________________________________________________________________________________________________|");

            EmployeesDataTable.Clear();

            Console.ReadLine();
        }
    }
}
