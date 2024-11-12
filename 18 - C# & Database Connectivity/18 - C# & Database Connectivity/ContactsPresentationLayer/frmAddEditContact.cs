using ContactsBusinessLayer;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

// تحديد المساحة الاسمية الخاصة بطبقة العرض الخاصة بجهات الاتصال
namespace ContactsPresentationLayer
{
    // تعريف نموذج Windows Forms الخاص بإضافة وتحرير جهات الاتصال
    public partial class frmAddEditContact : Form
    {
        // تعريف تعداد يمثل أوضاع النموذج، إما إضافة جديدة أو تحديث
        enum enMode { AddNew = 0, Update = 1 };

        // متغير خاص لتحديد وضع النموذج الحالي (إضافة جديدة أو تعديل)
        enMode _Mode;

        // معرف جهة الاتصال الحالية
        int _ContactID;

        // كائن يمثل جهة الاتصال الحالية
        clsContact _Contact;

        // دالة البناء التي تستقبل معرف جهة الاتصال كمعامل
        public frmAddEditContact(int ContactID)
        {
            // تهيئة مكونات النموذج
            InitializeComponent();

            // تعيين معرف جهة الاتصال الممرر إلى المتغير الخاص
            _ContactID = ContactID;

            // إذا كان المعرف -1، فهذا يعني أن المستخدم يريد إضافة جهة اتصال جديدة
            if (_ContactID == -1)
            {
                // تعيين الوضع على إضافة جديدة
                _Mode = enMode.AddNew;
            }
            else
            {
                // تعيين الوضع على تحديث
                _Mode = enMode.Update;
            }
        }

        // دالة لملء قائمة الدول في ComboBox
        private void _FillCountriesInComoboBox()
        {
            // استدعاء دالة من طبقة الأعمال للحصول على كل الدول
            DataTable dataTable = clsCountry.GetAllCountries();

            // التكرار عبر كل صف في الجدول
            foreach (DataRow row in dataTable.Rows)
            {
                // إضافة اسم الدولة إلى ComboBox
                cbCountry.Items.Add(row["CountryName"]);
            }
        }

        // دالة لتحميل بيانات جهة الاتصال إلى النموذج
        private void LoadData()
        {
            // استدعاء دالة لملء قائمة الدول
            _FillCountriesInComoboBox();

            // تعيين العنصر الأول كافتراضي في ComboBox
            cbCountry.SelectedIndex = 0;

            // إذا كان الوضع هو إضافة جديدة
            if (_Mode == enMode.AddNew)
            {
                // تحديث النص ليعكس أن المستخدم في وضع إضافة جهة اتصال جديدة
                lblMode.Text = "Add New Contact";

                // إنشاء كائن جديد لجهة الاتصال
                _Contact = new clsContact();
                return;
            }

            // إذا كان الوضع تعديل، استدعاء دالة لإيجاد جهة الاتصال حسب المعرف
            _Contact = clsContact.Find(_ContactID);

            // إذا لم يتم العثور على جهة الاتصال
            if (_Contact == null)
            {
                // عرض رسالة توضح أن جهة الاتصال غير موجودة
                MessageBox.Show("This form will be closed because No Contact with ID = " + _ContactID);

                // إغلاق النموذج
                this.Close();
                return;
            }

            // تحديث النص ليعكس أن المستخدم في وضع تحرير جهة الاتصال
            lblMode.Text = "Edit Contact ID = " + _ContactID;

            // عرض معرف جهة الاتصال
            lblContactID.Text = _ContactID.ToString();

            // تعبئة حقل الاسم الأول
            txtFirstName.Text = _Contact.FirstName;

            // تعبئة حقل الاسم الأخير
            txtLastName.Text = _Contact.LastName;

            // تعبئة حقل البريد الإلكتروني
            txtEmail.Text = _Contact.Email;

            // تعبئة حقل الهاتف
            txtPhone.Text = _Contact.Phone;

            // تعبئة حقل العنوان
            txtAddress.Text = _Contact.Address;

            // تعبئة حقل تاريخ الميلاد
            dtpDateOfBirth.Value = _Contact.DateOfBirth;

            // إذا كان هناك مسار لصورة
            if (_Contact.ImagePath != "")
            {
                // تحميل الصورة في PictureBox
                pictureBox1.Load(_Contact.ImagePath);
            }

            // جعل الرابط لإزالة الصورة مرئي إذا كان هناك صورة
            llRemoveImage.Visible = (_Contact.ImagePath != "");

            // تحديد الدولة المناسبة في ComboBox بناءً على ID الدولة
            cbCountry.SelectedIndex = cbCountry.FindString(clsCountry.Find(_Contact.CountryID).CountryName);
        }

        // دالة تنفذ عند تحميل النموذج
        private void frmAddEditContact_Load(object sender, EventArgs e)
        {
            // استدعاء دالة تحميل البيانات
            LoadData();
        }

        // دالة تنفذ عند النقر على رابط فتح مستكشف الملفات
        private void llOpenFileDialog_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            // تحديد أنواع الملفات المسموح بها
            openFileDialog1.Filter = "Image Files|*.jpg;*.jpeg;*.png;*.gif;*.bmp";

            // تعيين الفلتر الأول كافتراضي
            openFileDialog1.FilterIndex = 1;

            // إعادة تعيين دليل المستكشف إلى الدليل السابق
            openFileDialog1.RestoreDirectory = true;

            // إذا تم اختيار ملف بنجاح
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                // الحصول على مسار الملف المختار
                string selectedFilePath = openFileDialog1.FileName;

                // تحميل الصورة في PictureBox
                pictureBox1.Load(selectedFilePath);
            }
        }

        // دالة تنفذ عند النقر على زر الحفظ
        private void btnSave_Click(object sender, EventArgs e)
        {
            // الحصول على معرف الدولة بناءً على النص المختار في ComboBox
            int CountryID = clsCountry.Find(cbCountry.Text).ID;

            // تعيين الاسم الأول للكائن من النص المدخل
            _Contact.FirstName = txtFirstName.Text;

            // تعيين الاسم الأخير للكائن من النص المدخل
            _Contact.LastName = txtLastName.Text;

            // تعيين البريد الإلكتروني للكائن من النص المدخل
            _Contact.Email = txtEmail.Text;

            // تعيين الهاتف للكائن من النص المدخل
            _Contact.Phone = txtPhone.Text;

            // تعيين العنوان للكائن من النص المدخل
            _Contact.Address = txtAddress.Text;

            // تعيين تاريخ الميلاد للكائن من القيمه المدخلة
            _Contact.DateOfBirth = dtpDateOfBirth.Value;

            // تعيين معرف الدولة للكائن
            _Contact.CountryID = CountryID;

            // إذا كان هناك مسار صورة محدد
            if (pictureBox1.ImageLocation != null)
            {
                // تعيين مسار الصورة للكائن
                _Contact.ImagePath = pictureBox1.ImageLocation;
            }
            else
            {
                // تعيين مسار الصورة كقيمة فارغة إذا لم يتم تحديد صورة
                _Contact.ImagePath = "";
            }

            // إذا تم حفظ البيانات بنجاح
            if (_Contact.Save())
            {
                // عرض رسالة تفيد بنجاح حفظ البيانات
                MessageBox.Show("Data Saved Successfully.");
            }
            else
            {
                // عرض رسالة تفيد بفشل حفظ البيانات
                MessageBox.Show("Error: Data Is not Saved Successfully.");
            }

            // تغيير الوضع إلى تحديث بعد الحفظ
            _Mode = enMode.Update;

            // تحديث النص ليعكس أن المستخدم الآن في وضع تحرير
            lblMode.Text = "Edit Contact ID = " + _Contact.ID;

            // عرض معرف جهة الاتصال بعد الحفظ
            lblContactID.Text = _Contact.ID.ToString();

        }

        // دالة تنفذ عند النقر على زر الإغلاق
        private void btnClose_Click(object sender, EventArgs e)
        {
            // إغلاق النموذج
            this.Close();
        }

        // دالة تنفذ عند النقر على رابط إزالة الصورة
        private void llRemoveImage_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            // إزالة مسار الصورة من PictureBox
            pictureBox1.ImageLocation = null;

            // إخفاء رابط إزالة الصورة بعد إزالتها
            llRemoveImage.Visible = false;
        }
    }
}
