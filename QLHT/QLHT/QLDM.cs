using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace QLHT
{
    public partial class QLDM : Form
    {
        public QLDM()
        {
            InitializeComponent();
            this.Text = "Xin chào, " + UserInfo.Username + " - Quyền: " + UserInfo.RoleId.ToString();
        }
        DataClasses1DataContext data= new DataClasses1DataContext();
        private void QLDM_Load(object sender, EventArgs e)
        {            
            data = new DataClasses1DataContext();
            var quyry = from a in data.KhoiPhongBans
                        join b in data.PhongBans on a.MaKhoiPhongBan equals b.MaKhoiPhongBan
                        select new
                        {
                            STT = b.Stt,
                            Tên_Phòng_Ban = b.TenPhongBan,
                            Khối_Phòng_Ban = a.TenKhoiPhongBan,
                            Tuổi_Về_Hưu_Nam = b.DoTuoiVeHuuNam,
                            Tuổi_Về_Hưu_Nữ = b.DoTuoiVeHuuNu,
                            Số_Lao_Động = b.SoLaoDong,
                            Mã_Phòng_Ban = b.MaPhongBan

                        };       
            data_phongban.DataSource = quyry.ToList();
            data_phongban.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void MI_QLPhongBan_Click(object sender, EventArgs e)
        {
            if (UserInfo.RoleId == 0 || UserInfo.RoleId == 1)
            {
                data = new DataClasses1DataContext();
                var quyry = from a in data.KhoiPhongBans
                            join b in data.PhongBans on a.MaKhoiPhongBan equals b.MaKhoiPhongBan
                            select new
                            {
                                STT = b.Stt,
                                Tên_Phòng_Ban = b.TenPhongBan,
                                Khối_Phòng_Ban = a.TenKhoiPhongBan,
                                Tuổi_Về_Hưu_Nam = b.DoTuoiVeHuuNam,
                                Tuổi_Về_Hưu_Nữ = b.DoTuoiVeHuuNu,
                                Số_Lao_Động = b.SoLaoDong,
                                Mã_Phòng_Ban = b.MaPhongBan

                            };
                txtDanhMuc.Text = "Danh mục phòng ban";
                txtDanhMuc.ForeColor = Color.Red;
                data_phongban.DataSource = quyry.ToList();
                data_phongban.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            }
            else
            {
                MessageBox.Show("Bạn không có quyền truy cập vào đây", "Quyền truy cập bị từ chối", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }           
        }

        private void MI_QLChungChi_Click(object sender, EventArgs e)
        {
            /* */
            if (UserInfo.RoleId == 0 || UserInfo.RoleId == 1)
            {
                data = new DataClasses1DataContext();
                var quyry = from a in data.ChungChis

                            select new
                            {
                                Mã_Chứng_Chỉ = a.MaChungChi,
                                Tên_Chứng_Chỉ = a.TenChungChi,
                                Thời_Hạn = a.ThoiHan,
                                Ghi_Chú = a.GhiChu

                            };
                txtDanhMuc.Text = "Danh mục chứng chỉ";
                txtDanhMuc.ForeColor = Color.Red;
                data_phongban.DataSource = quyry.ToList();
                data_phongban.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                /* */
            }
            else
            {
                MessageBox.Show("Bạn không có quyền truy cập vào đây", "Quyền truy cập bị từ chối", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }           
        }

        private void MI_QLBacLuong_Click(object sender, EventArgs e)
        {

            if (UserInfo.RoleId == 0 || UserInfo.RoleId == 1)
            {
                data = new DataClasses1DataContext();
                var quyry = from a in data.BacLuongs

                            select new
                            {
                                Mã_Bậc_Lương = a.MaBacLuong,
                                Ngày = a.Ngay,
                                Tên_Bậc_Lương = a.TenBacLuong,
                                Bậc1 = a.Bac1,
                                Bậc2 = a.Bac2,
                                Bậc3 = a.Bac3,
                                Bậc4 = a.Bac4,
                                Bậc5 = a.Bac5,
                                Bậc6 = a.Bac6,
                                Bậc7 = a.Bac7,
                                Bậc8 = a.Bac8,
                                Bậc9 = a.Bac9,
                                Bậc10 = a.Bac10

                            };
                txtDanhMuc.Text = "Danh mục Hệ số lương";
                txtDanhMuc.ForeColor = Color.Red;
                data_phongban.DataSource = quyry.ToList();
                data_phongban.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            }
            else
            {
                MessageBox.Show("Bạn không có quyền truy cập vào đây", "Quyền truy cập bị từ chối", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void MI_QLPCXangxe_Click(object sender, EventArgs e)
        {

            if (UserInfo.RoleId == 0 || UserInfo.RoleId == 1)
            {
                data = new DataClasses1DataContext();
                var quyry = from a in data.MucXangs

                            select new
                            {
                                ID = a.ID,
                                Ngày_Áp_dụng = a.NgayApDung,
                                Mức_1 = a.Muc1,
                                Mức_2 = a.Muc2,
                                Mức_3 = a.Muc3,
                                Mức_4 = a.Muc4

                            };
                txtDanhMuc.Text = "Danh mục Phụ cấp xăng xe";
                txtDanhMuc.ForeColor = Color.Red;
                data_phongban.DataSource = quyry.ToList();
                data_phongban.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            }
            else
            {
                MessageBox.Show("Bạn không có quyền truy cập vào đây", "Quyền truy cập bị từ chối", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnThangLuong_Click(object sender, EventArgs e)
        {

            if (UserInfo.RoleId == 0 || UserInfo.RoleId == 1)
            {
                data = new DataClasses1DataContext();
                var quyry = from c in data.ChamCong2s

                            select new
                            {
                                ID = c.SoThuTu,
                                MaNhanVien = c.MaNhanVien,
                                TenNhanVien = c.TenNhanVien,
                                SoGioTangCa = c.SoGioTangCa,
                                LuongCoBan = c.LuongCoBan,
                                TroCapDiLai = c.TroCapDiLai,
                                TroCapNhaO = c.TroCapNhaO,
                                TienHieuSuat = c.TienHieuSuat,
                                BaoHiemXaHoi = c.BaoHiemXaHoi,
                                BaoHiemYTe = c.BaoHiemYTe,
                                BaoHiemTuNguyen = c.BaoHiemTuNguyen,
                                PhiCongDoan = c.PhiCongDoan,
                                ThucLinh = c.ThucLinh

                            };
                txtDanhMuc.Text = "Danh mục chi tiết lương";
                txtDanhMuc.ForeColor = Color.Red;
                data_phongban.DataSource = quyry.ToList();
                data_phongban.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            }
            else
            {
                MessageBox.Show("Bạn không có quyền truy cập vào đây", "Quyền truy cập bị từ chối", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }           
        }

        private void button19_Click(object sender, EventArgs e)
        {
            if (UserInfo.RoleId == 0 || UserInfo.RoleId == 1)
            {
                addPhongBan tkvc = new addPhongBan();
                tkvc.ShowDialog();
                tkvc = null;
                this.Close();
            }
            else
            {
                MessageBox.Show("Bạn không có quyền truy cập vào đây", "Quyền truy cập bị từ chối", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }           
        }

      
        private void data_phongban_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (UserInfo.RoleId == 0 || UserInfo.RoleId == 1)
            {
                DataGridViewRow row = new DataGridViewRow();
                row = data_phongban.Rows[e.RowIndex];
                txt_mapb.Text = row.Cells["Mã_Phòng_Ban"].Value.ToString();
                SelectMaPb.get().mapb = Convert.ToInt32(txt_mapb.Text);
            }
            else
            {
                MessageBox.Show("Bạn không có quyền truy cập vào đây", "Quyền truy cập bị từ chối", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }           
        }

        private void button17_Click(object sender, EventArgs e)
        {
            if (UserInfo.RoleId == 0 || UserInfo.RoleId == 1)
            {
                repairPhongBan tkvc = new repairPhongBan();
                tkvc.ShowDialog();
                tkvc = null;
                this.Close();
            }
            else
            {
                MessageBox.Show("Bạn không có quyền truy cập vào đây", "Quyền truy cập bị từ chối", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }           
        }

        private void button20_Click(object sender, EventArgs e)
        {
            if (UserInfo.RoleId == 0 || UserInfo.RoleId == 1)
            {
                try
                {
                    var np2 = SelectMaPb.get().mapb;
                    PhongBan del_np = data.PhongBans.Where(o => o.MaPhongBan.Equals(np2)).FirstOrDefault();
                    data.PhongBans.DeleteOnSubmit(del_np);
                    data.SubmitChanges();
                    MessageBox.Show("Xóa Thành Công!");
                }
                catch (Exception)
                {
                    MessageBox.Show("Xóa Thất Bại!");
                }
                finally
                {
                    QLDM_Load(sender, e);

                }
            }
            else
            {
                MessageBox.Show("Bạn không có quyền truy cập vào đây", "Quyền truy cập bị từ chối", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
           
        }

        private void btn_exit_Click(object sender, EventArgs e)
        {
            DialogResult thongbao = MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.YesNo);
            if (thongbao == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void MIT_UserInfo_Click(object sender, EventArgs e)
        {
            int role = UserInfo.RoleId;
            string message;
            switch (role)
            {
                case 0:
                    message = "Admin";
                    break;
                case 1:
                    message = "Quản lý";
                    break;
                case 2:
                    message = "Nhân viên";
                    break;
                case 3:
                    message = "Thực tập sinh";
                    break;
                default:                    
                    message = "";
                    break;
            }

            MessageBox.Show("Thông tin tài khoản:\nTài khoản: " + UserInfo.Username + 
                            "\nVai trò: " + message, "Thông Tin Người Dùng", MessageBoxButtons.OK);

        }

        private void MIT_Logout_Click(object sender, EventArgs e)
        {
            DialogResult thongbao = MessageBox.Show("Bạn có muốn đăng xuất?", "Thông báo", MessageBoxButtons.YesNo);
            if (thongbao == DialogResult.Yes)
            {
                // Làm trống thông tin người dùng
                UserInfo.Username = null;
                UserInfo.RoleId = -1;  // Giả sử -1 là giá trị không hợp lệ cho role_id

                // Đóng form hiện tại và mở form đăng nhập
                this.Hide(); // Ẩn form quản lý
                Login formLogin = new Login();
                formLogin.ShowDialog(); // Hiển thị form đăng nhập

                // Khi form đăng nhập đóng, đóng form này
                this.Close();
            }
           
        }
    }
}
