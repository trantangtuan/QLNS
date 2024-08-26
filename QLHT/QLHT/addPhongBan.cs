using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLHT
{
    public partial class addPhongBan : Form
    {
        public addPhongBan()
        {
            InitializeComponent();
            this.Text = "Xin chào, " + UserInfo.Username + " - Quyền: " + UserInfo.RoleId.ToString();
        }
        DataClasses1DataContext data = new DataClasses1DataContext();
        private void addPhongBan_Load(object sender, EventArgs e)
        {
            cbo_tenkpn.DataSource = data.KhoiPhongBans;
            cbo_tenkpn.DisplayMember = "TenKhoiPhongBan";
            cbo_tenkpn.ValueMember = "MaKhoiPhongBan";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                PhongBan np = new PhongBan();
                np.MaPhongBan = Convert.ToInt32(txt_makb.Text.ToString());
                np.TenPhongBan = txt_tenpb.Text.ToString();
                np.DoTuoiVeHuuNam = Convert.ToInt32(txt_tuoinam.Text.ToString());
                np.DoTuoiVeHuuNu = Convert.ToInt32(txt_tuoinu.Text.ToString());
                np.SoLaoDong = Convert.ToInt32(txt_sold.Text.ToString());


                var a = (from ass in data.KhoiPhongBans
                         where ass.TenKhoiPhongBan == cbo_tenkpn.Text
                         select ass.MaKhoiPhongBan).FirstOrDefault();
                np.MaKhoiPhongBan = a;

                data.PhongBans.InsertOnSubmit(np);
                data.SubmitChanges();
                MessageBox.Show("Thêm Phòng Ban Thành Công!");
            }
            catch (Exception)
            {
                MessageBox.Show("Thêm Phòng Ban Thất Bại!");
            }
            finally
            {
                this.Close();
                QLDM tkvc = new QLDM();
                tkvc.ShowDialog();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
            QLDM tkvc = new QLDM();
            tkvc.ShowDialog();
        }
    }
}
