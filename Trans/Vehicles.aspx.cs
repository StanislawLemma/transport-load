using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Trans
{
    public partial class Vehicles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSaveTruck_Click(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("insert into truck values('" + tbTNo.Text + "', '" + tbTPlate.Text + "', '" + tbTModel.Text + "', '" + tbTYear.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }

        }

    }
}