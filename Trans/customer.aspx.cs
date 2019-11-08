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
    public partial class customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCustomersRptr();
            }
        }

        private void BindCustomersRptr()
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from customer", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtCustomer = new DataTable();
                        sda.Fill(dtCustomer);
                        rptrCustomers.DataSource = dtCustomer;
                        rptrCustomers.DataBind();
                    }
                }
            }
        }

        protected void btSaveDriver_Click(object sender, EventArgs e)
        {
            if (txtCTitle.Text != "")
            {

                String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into customer values('" + txtCTitle.Text + "', '" + txtCPhone.Text + "', '"
                        + txtCEmail.Text + "', '" + txtCAddress.Text + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.ForeColor = Color.Green;
                    lblMsg.Text = "Customer saved.";
                    BindCustomersRptr();
                    txtCTitle.Text = string.Empty;
                    txtCPhone.Text = string.Empty;
                    txtCEmail.Text = string.Empty;
                    txtCAddress.Text = string.Empty;
                }

            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Title is Mandatory.";
            }
        }

        protected void rptrCustomers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "delete":
                    string id = e.CommandArgument.ToString();

                    String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("Delete From customer Where Uid='" + id + "' ", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        BindCustomersRptr();
                    }
                    break;

                // Other commands here.

                default:
                    break;
            }
        }
    }
}