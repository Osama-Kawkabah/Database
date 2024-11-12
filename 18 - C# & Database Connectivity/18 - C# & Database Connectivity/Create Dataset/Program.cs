using System;
using System.Data;

class Program
{
    static void Main(string[] args)
    {
        // إنشاء DataTable الأول
        DataTable firstDataTable = new DataTable("FirstTable");

        // إضافة 10 أعمدة إلى الجدول الأول
        firstDataTable.Columns.Add("ID", typeof(int));
        firstDataTable.Columns.Add("Name", typeof(string));
        firstDataTable.Columns.Add("Country", typeof(string));
        firstDataTable.Columns.Add("Age", typeof(int));
        firstDataTable.Columns.Add("Salary", typeof(decimal));
        firstDataTable.Columns.Add("Department", typeof(string));
        firstDataTable.Columns.Add("Position", typeof(string));
        firstDataTable.Columns.Add("HireDate", typeof(DateTime));
        firstDataTable.Columns.Add("Email", typeof(string));
        firstDataTable.Columns.Add("PhoneNumber", typeof(string));

        // إضافة بيانات إلى الجدول الأول
        firstDataTable.Rows.Add(1, "John Doe", "USA", 30, 6000.00m, "IT", "Developer", new DateTime(2015, 5, 21), "john.doe@example.com", "123456789");
        firstDataTable.Rows.Add(2, "Jane Smith", "UK", 28, 7000.00m, "HR", "Manager", new DateTime(2016, 7, 18), "jane.smith@example.com", "987654321");

        // إنشاء DataTable الثاني
        DataTable secondDataTable = new DataTable("SecondTable");

        // إضافة 10 أعمدة إلى الجدول الثاني
        secondDataTable.Columns.Add("OrderID", typeof(int));
        secondDataTable.Columns.Add("ProductName", typeof(string));
        secondDataTable.Columns.Add("Category", typeof(string));
        secondDataTable.Columns.Add("Quantity", typeof(int));
        secondDataTable.Columns.Add("Price", typeof(decimal));
        secondDataTable.Columns.Add("CustomerName", typeof(string));
        secondDataTable.Columns.Add("OrderDate", typeof(DateTime));
        secondDataTable.Columns.Add("ShippingAddress", typeof(string));
        secondDataTable.Columns.Add("Status", typeof(string));
        secondDataTable.Columns.Add("PaymentMethod", typeof(string));

        // إضافة بيانات إلى الجدول الثاني
        secondDataTable.Rows.Add(101, "Laptop", "Electronics", 2, 1500.00m, "Alice Brown",
            new DateTime(2023, 1, 12), "123 Elm St", "Shipped", "Credit Card");
        secondDataTable.Rows.Add(102, "Smartphone", "Electronics", 1, 800.00m, "Bob White",
            new DateTime(2023, 2, 15), "456 Oak St", "Delivered", "PayPal");

        //// عرض البيانات في الجدول الأول
        Console.WriteLine("First DataTable:");
        foreach (DataRow row in firstDataTable.Rows)
        {
            Console.WriteLine(string.Join(", ", row.ItemArray));
        }

        Console.WriteLine("\nSecond DataTable:");
        // عرض البيانات في الجدول الثاني
        foreach (DataRow row in secondDataTable.Rows)
        {
            Console.WriteLine(string.Join(", ", row.ItemArray));
        }



        // إنشاء DataSet وإضافة الجدولين إليه
        DataSet dataSet = new DataSet();
        dataSet.Tables.Add(firstDataTable);
        dataSet.Tables.Add(secondDataTable);

        // عرض البيانات من DataSet
        Console.WriteLine("\nPrinting data from DataSet (FirstTable):");
        foreach (DataRow row in dataSet.Tables["FirstTable"].Rows)
        {
            Console.WriteLine(string.Join(", ", row.ItemArray));
        }

        Console.WriteLine("\nPrinting data from DataSet (SecondTable):");
        foreach (DataRow row in dataSet.Tables["SecondTable"].Rows)
        {
            Console.WriteLine(string.Join(", ", row.ItemArray));
        }

        Console.ReadLine();
    }
}
