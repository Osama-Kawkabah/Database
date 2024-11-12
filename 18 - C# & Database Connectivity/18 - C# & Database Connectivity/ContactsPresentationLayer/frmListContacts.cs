// استيراد طبقة الأعمال للتعامل مع العمليات المتعلقة بجهات الاتصال
using ContactsBusinessLayer;
// استيراد مكتبة النظام الأساسية
using System;
// استيراد المكتبة التي تحتوي على القوائم والمعاجم
using System.Collections.Generic;
// استيراد المكتبة التي تحتوي على واجهات تطبيقات للمكونات
using System.ComponentModel;
// استيراد المكتبة الخاصة بالتعامل مع البيانات مثل DataTable و DataSet
using System.Data;
// استيراد المكتبة الخاصة بالرسم والتصميم
using System.Drawing;
// استيراد مكتبة Linq للتعامل مع البيانات المتسلسلة
using System.Linq;
// استيراد المكتبة الخاصة بالتعامل مع النصوص
using System.Text;
// استيراد المكتبة الخاصة بعمليات البرمجة المتوازية والمهام
using System.Threading.Tasks;
// استيراد المكتبة الخاصة ببناء واجهات التطبيقات باستخدام Windows Forms
using System.Windows.Forms;

// تحديد المساحة الاسمية الخاصة بطبقة العرض الخاصة بجهات الاتصال
namespace ContactsPresentationLayer
{
    // تعريف نموذج Windows Forms الخاص بعرض قائمة جهات الاتصال
    public partial class frmListContacts : Form
    {
        // دالة البناء التي تنشئ النموذج
        public frmListContacts()
        {
            // تهيئة مكونات النموذج
            InitializeComponent();
        }

        private void DeleteContact()
        {
            // عرض رسالة تأكيد الحذف
            if (MessageBox.Show("Are you sure you want to delete contact [" +
                dgvAllContacts.CurrentRow.Cells[0].Value + "]", "Confirm Delete",
                MessageBoxButtons.OKCancel) == DialogResult.OK) // إذا اختار المستخدم تأكيد الحذف
            {
                // استدعاء دالة لحذف جهة الاتصال من قاعدة البيانات
                if (clsContact.DeleteContact((int)dgvAllContacts.CurrentRow.Cells[0].Value))
                {
                    // عرض رسالة تفيد بنجاح حذف جهة الاتصال
                    MessageBox.Show("Contact Deleted Successfully.");
                    // تحديث قائمة جهات الاتصال بعد الحذف
                    _RefreshContactsList();
                }
                else
                    // عرض رسالة تفيد بفشل عملية الحذف
                    MessageBox.Show("Contact is not deleted.");
            }
        }

        // دالة لتحديث قائمة جهات الاتصال المعروضة في DataGridView
        private void _RefreshContactsList()
        {
            // استدعاء دالة للحصول على كل جهات الاتصال وتحديث مصدر البيانات
            dgvAllContacts.DataSource = clsContact.GetAllContacts();
        }

        // دالة تنفذ عند النقر على زر لإضافة جهة اتصال جديدة
        private void button1_Click(object sender, EventArgs e)
        {
            // إنشاء نموذج جديد لإضافة جهة اتصال جديدة
            frmAddEditContact frm = new frmAddEditContact(-1);
            // عرض النموذج كنافذة حوارية
            frm.ShowDialog();
            // تحديث قائمة جهات الاتصال بعد الإضافة
            _RefreshContactsList();
        }

        // دالة تنفذ عند تحميل النموذج
        private void frmListContacts_Load(object sender, EventArgs e)
        {
            // تحديث قائمة جهات الاتصال عند تحميل النموذج
            _RefreshContactsList();
        }

        // دالة تنفذ عند اختيار تحرير جهة اتصال من قائمة السياق
        private void editToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // إنشاء نموذج جديد لتحرير جهة الاتصال المحددة
            frmAddEditContact frm = new frmAddEditContact((int)dgvAllContacts.CurrentRow.Cells[0].Value);
            // عرض النموذج كنافذة حوارية
            frm.ShowDialog();
            // تحديث قائمة جهات الاتصال بعد التحرير
            _RefreshContactsList();
        }

        // دالة تنفذ عند اختيار حذف جهة اتصال من قائمة السياق
        private void deleteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DeleteContact();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DeleteContact();
        }

        private void dgvAllContacts_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
