﻿using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace pbl
{
    public partial class QuanLySanPham : Form
    {
        //CÁC THUỘC TÍNH CƠ BẢN
        SanPhamBUS sanphambus = new SanPhamBUS();
        public bool isAdmin{get;set;}

        public QuanLySanPham()
        {
            InitializeComponent();
        }
        private void QuanLySanPham_Load(object sender, EventArgs e)
        {
            if(!isAdmin)
            {
                btn_sua.Enabled = false;
                btn_them.Enabled = false;
                btn_xoa.Enabled = false;
            }
            Load_Phan_Loai();
            Load_Bo_Loc();
            Load_DS_San_Pham();
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
        }
        //CÁC HÀM XỬ LÍ SỰ KIỆN
        private void btn_them_Click_1(object sender, EventArgs e)
        {

            Themsanpham f = new Themsanpham();
            f.isEdit = false;
            f.Show();
        }

        private void btn_sua_Click(object sender, EventArgs e)
        {
            if(dataGridView1.SelectedRows.Count > 0)
            {
                DataGridViewRow row = dataGridView1.SelectedRows[0];
                Themsanpham f = new Themsanpham();
                f.isEdit = true;
                f.idsanpham = row.Cells[0].Value.ToString();
                f.phanloai = row.Cells[2].Value.ToString();
                f.tensanpham = row.Cells[1].Value.ToString();
                f.giaban = row.Cells[3].Value.ToString();
                f.Show();
            }
            else
            {
                MessageBox.Show("Vui lòng chọn sản phẩm cần sửa đổi","Thông báo",MessageBoxButtons.OK,MessageBoxIcon.Information);
            }
           
        }

        private void btn_xoa_Click(object sender, EventArgs e)
        {
            if(dataGridView1.SelectedRows.Count>0)
            {
                string id = dataGridView1.SelectedRows[0].Cells[0].Value.ToString();
                string ten = dataGridView1.SelectedRows[0].Cells[1].Value.ToString();
                string phanloai = dataGridView1.SelectedRows[0].Cells[2].Value.ToString();
                DialogResult res = MessageBox.Show("Bạn có chắn chắn muốn xóa sản phẩm "+ten,"Thông báo",MessageBoxButtons.YesNo,MessageBoxIcon.Warning);
                if (res == DialogResult.Yes)
                {
                    if (sanphambus.Delete(id) == 1)
                    {
                        MessageBox.Show("Đã xóa thành công");
                    }
                }
            }
            else
            {
                MessageBox.Show("Vui lòng chọn hàng cần xóa");
            }
        }
        private void btn_timkiem_Click(object sender, EventArgs e)
        {
            string txt = txt_tentimkiem.Text;
            string BoLoc = cb_boloc.SelectedItem.ToString();
            string PhanLoai = cb_phanloai.SelectedItem.ToString();
            dataGridView1.DataSource = sanphambus.Search(txt, BoLoc, PhanLoai);

        }
        private void btn_chitiet_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                XemChiTietSanPham f = new XemChiTietSanPham();
                f.isAdmin = this.isAdmin;
                DataGridViewRow row = dataGridView1.SelectedRows[0];
                f.idsanpham = row.Cells[0].Value.ToString();
                f.ShowDialog();
            }
            else
            {
                MessageBox.Show("Vui lòng chọn sản phẩm cần xem thông tin chi tiết");
            }
        }
        //CÁC HÀM BỔ TRỢ
        public void Load_DS_San_Pham()
        {
            dataGridView1.DataSource = sanphambus.GetData();
        }
        public void Load_Phan_Loai()
        {
            List<string> ds_danhmuc = sanphambus.GetSeperatedDataByColumn();
            cb_phanloai.Items.Add("Tất Cả");
            foreach (string s in ds_danhmuc)
            {
                cb_phanloai.Items.Add(s);
            }
            cb_phanloai.SelectedItem = "Tất Cả";
        }
        public void Load_Bo_Loc()
        {
            cb_boloc.Items.Add("Tất Cả");
            cb_boloc.Items.Add("<30K");
            cb_boloc.Items.Add("30K - 100K");
            cb_boloc.Items.Add("100K - 200K");
            cb_boloc.Items.Add(">200K");
            cb_boloc.Items.Add("Giá giảm dần");
            cb_boloc.Items.Add("Giá tăng dần");
            cb_boloc.SelectedItem = "Tất Cả";
        }
    }
}
