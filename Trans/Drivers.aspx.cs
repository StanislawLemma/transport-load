using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace Trans
{
    public partial class Drivers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSaveDriver_Click(object sender, EventArgs e)
        {
            if (tbDName.Text != "" & tbDSurname.Text != "")
            {

                String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into driver values('" + tbDName.Text + "', '" + tbDSurname.Text + "', '"
                        + tbDPNumber.Text + "', '" + tbDEmail.Text + "', '" + tbDSsn.Text + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.ForeColor = Color.Green;
                    lblMsg.Text = "Driver saved.";
                    tbDName.Text = string.Empty;
                    tbDSurname.Text = string.Empty;
                    tbDPNumber.Text = string.Empty;
                    tbDEmail.Text = string.Empty;
                    tbDSsn.Text = string.Empty;
                }

            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Name and Surname Are Mandatory.";
            }
        }
    }
}