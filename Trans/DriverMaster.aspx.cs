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
    public partial class DriverMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDriversRptr();
            }
        }

        private void BindDriversRptr()
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from driver", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtDriver = new DataTable();
                        sda.Fill(dtDriver);
                        rptrDrivers.DataSource = dtDriver;
                        rptrDrivers.DataBind();
                    }
                }
            }
        }

        protected void btSaveDriver_Click(object sender, EventArgs e)
        {
            if (txtDName.Text != "" & txtDSurname.Text != "")
            {

                String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into driver values('" + txtDName.Text + "', '" + txtDSurname.Text + "', '"
                        + txtDPhone.Text + "', '" + txtDEmail.Text + "', '" + txtDSsn.Text + "', '" + txtDAddress.Text + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.ForeColor = Color.Green;
                    lblMsg.Text = "Driver saved.";
                    BindDriversRptr();
                    txtDName.Text = string.Empty;
                    txtDSurname.Text = string.Empty;
                    txtDPhone.Text = string.Empty;
                    txtDEmail.Text = string.Empty;
                    txtDSsn.Text = string.Empty;
                    txtDAddress.Text = string.Empty;
                }

            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Name and Surname Are Mandatory.";
            }
        }
        protected void rptrDrivers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "delete":
                    string id = e.CommandArgument.ToString();

                    String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("Delete From driver Where Uid='" + id + "' ", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        BindDriversRptr();
                    }
                    break;

                // Other commands here.

                default:
                    break;
            }
        }
    }
}