using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Data;

namespace Trans
{
    public partial class TruckMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTrucksRptr();
            }
        }

        private void BindTrucksRptr()
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from truck", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtTruck = new DataTable();
                        sda.Fill(dtTruck);
                        rptrTrucks.DataSource = dtTruck;
                        rptrTrucks.DataBind();
                    }
                }
            }
        }

        protected void btSaveTruck_Click(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("insert into truck values('" + tbTNo.Text + "', '" + tbTPlate.Text + "', '" + tbTModel.Text + "', '" + tbTYear.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                lblMsg.ForeColor = Color.Green;
                lblMsg.Text = "Truck saved.";
                BindTrucksRptr();
                tbTNo.Text = string.Empty;
                tbTPlate.Text = string.Empty;
                tbTModel.Text = string.Empty;
                tbTYear.Text = string.Empty;
            }
        }
        protected void rptrTrucks_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "delete":
                    string id = e.CommandArgument.ToString();

                    String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("Delete From truck Where Uid='" + id + "' ", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        BindTrucksRptr();
                    }
                    break;

                // Other commands here.

                default:
                    break;
            }
        }
    }
}