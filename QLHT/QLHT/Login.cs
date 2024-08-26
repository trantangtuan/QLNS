using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace QLHT
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        //Hàm kiểm tra đăng nhập
        private bool Check_Login(string username, string password)
        {
            string connectionString = @"Server=.\SQLEXPRESS;Database=QL_Nhansu;Integrated Security=True;";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT role_id FROM users WHERE username=@username AND password=@password";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                UserInfo.Username = username;
                                UserInfo.RoleId = Convert.ToInt32(reader["role_id"]);
                                return true;
                            }
                            return false;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi kết nối: " + ex.Message);
                    return false;
                }
            }
        }




        private void btndangnhap_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            if (Check_Login(username, password))
            {
                MessageBox.Show("Đăng nhập thành công với tài khoản "+UserInfo.Username);
                // Mở form mới hoặc thực hiện hành động tiếp theo
                QLDM formQLDM = new QLDM();
                formQLDM.Show();
                this.Hide(); // 
            }
            else
            {
                lbMessage.Text = "Thông tin đăng nhập không chính xác";
            }
        }

        private void btnexit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
