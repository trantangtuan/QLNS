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
    public partial class repairPhongBan : Form
    {
        public repairPhongBan()
        {
            InitializeComponent();
            this.Text = "Xin chào, " + UserInfo.Username + " - Quyền: " + UserInfo.RoleId.ToString();
        }
        DataClasses1DataContext data = new DataClasses1DataContext();
        private void repairPhongBan_Load(object sender, EventArgs e)
        {
            cbo_tenkpn.DataSource = data.KhoiPhongBans;
            cbo_tenkpn.DisplayMember = "TenKhoiPhongBan";
            cbo_tenkpn.ValueMember = "MaKhoiPhongBan";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            try
            {
                var np1 = SelectMaPb.get().mapb;
                PhongBan edit_np = data.PhongBans.Where(o => o.MaPhongBan.Equals(np1)).FirstOrDefault();
                edit_np.MaPhongBan = Convert.ToInt32(txt_makb.Text.ToString());
                edit_np.TenPhongBan = txt_tenpb.Text.ToString();
                edit_np.DoTuoiVeHuuNam = Convert.ToInt32(txt_tuoinam.Text.ToString());
                edit_np.DoTuoiVeHuuNu = Convert.ToInt32(txt_tuoinu.Text.ToString());
                edit_np.SoLaoDong = Convert.ToInt32(txt_sold.Text.ToString());


                var a = (from ass in data.KhoiPhongBans
                         where ass.TenKhoiPhongBan == cbo_tenkpn.Text
                         select ass.MaKhoiPhongBan).FirstOrDefault();
                edit_np.MaKhoiPhongBan = a;

               
                
                MessageBox.Show("Sửa Phòng Ban Thành Công!");
            }
            catch (Exception)
            {
                MessageBox.Show("Sửa Phòng Ban Thất Bại!");
            }
            finally
            {
                var npp = data.PhongBans;
               
                data.SubmitChanges();
                
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
