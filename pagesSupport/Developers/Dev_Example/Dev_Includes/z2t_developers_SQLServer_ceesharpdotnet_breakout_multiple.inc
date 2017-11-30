using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class CSharpExtended : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string server = "db.Zip2Tax.com";
            string dbUsername = "z2t_link";
            string dbPassword = "H^2p6~r";
            string dbName = "zip2tax";
            string connString = "Server=" + server + "; Database=" + dbName + "; User Id=" + dbUsername + "; password=" + dbPassword + ";";

            using (SqlConnection cn = new SqlConnection(connString))
            {
                string zipCode = "90210"; //sample zip code must be between 90001 and 90999
                string username = "sample";
                string password = "password";
                string cmdText = "exec z2t_lookup_extended_multiple '" + zipCode + "', '" + username + "', '" + password + "'";

                SqlCommand cmd = new SqlCommand(cmdText, cn);
                cn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (rdr.Read())
                {
                    //display using Response.Write
                    Response.Write("Zip Code: " + rdr["Zip_Code"].ToString() + "&lt;br /&gt;");
                    Response.Write("Sales Tax Rate: " + rdr["Sales_Tax_Rate"].ToString() + "&lt;br /&gt;");
                    Response.Write("City: " + rdr["City"].ToString() + "&lt;br /&gt;");
                    Response.Write("Post Office City: " + rdr["Post_Office_City"].ToString() + "&lt;br /&gt;");
                    Response.Write("County: " + rdr["County"].ToString() + "&lt;br /&gt;");
                    Response.Write("State: " + rdr["State"].ToString() + "&lt;br /&gt;");
                    Response.Write("Shipping Taxable: " + rdr["Shipping_Taxable"].ToString() + "&lt;br /&gt;");
                    Response.Write("Sales Tax Rate State: " + rdr["Sales_Tax_Rate_State"].ToString() + "&lt;br /&gt;");
                    Response.Write("Sales Tax Rate County: " + rdr["Sales_Tax_Rate_County"].ToString() + "&lt;br /&gt;");
                    Response.Write("Sales Tax Rate City: " + rdr["Sales_Tax_Rate_City"].ToString() + "&lt;br /&gt;");
                    Response.Write("Sales Tax Rate Special: " + rdr["Sales_Tax_Rate_Special"].ToString() + "&lt;br /&gt;");
                    Response.Write("Sales Tax Reporting_Code Total: " + rdr["Sales_Tax_Reporting_Code_Total"].ToString() + "&lt;br /&gt;");
                    Response.Write("Sales Tax Reporting_Code State: " + rdr["Sales_Tax_Reporting_Code_State"].ToString() + "&lt;br /&gt;");
                    Response.Write("Sales Tax Reporting_Code County: " + rdr["Sales_Tax_Reporting_Code_County"].ToString() + "&lt;br /&gt;");
                    Response.Write("Sales Tax Reporting_Code City: " + rdr["Sales_Tax_Reporting_Code_City"].ToString() + "&lt;br /&gt;");
                    Response.Write("Sales Tax Reporting_Code Special: " + rdr["Sales_Tax_Reporting_Code_Special"].ToString() + "&lt;br /&gt;");
                    Response.Write("&lt;br /&gt;");
                }

                rdr.Close();
            }
        }
    }
}
