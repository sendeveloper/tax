using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Xml;
using System.Xml.Linq;

public partial class CSharpBasic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
            string zipCode = "90210"; //sample zip code must be between 90001 and 90999
            string username = "sample";
            string password = "password";
            //string cmdText = "exec z2t_lookup '" + zipCode + "', '" + username + "', '" + password + "'";
            string url = "https://api.zip2tax.com/TaxRate-USA.xml?username=" + username + "&amp;password=" + password + "&amp;zip=" + zipCode;
            string strxml;
            int shipping = 0;

            try
            {
                using (WebClient client = new WebClient())
                {
                    //Download the xml document as a string
                    
                    client.Headers.Add(HttpRequestHeader.Accept, "application/xml");
                    strxml = client.DownloadString(url);
                    
                }
                XDocument doc = XDocument.Parse(strxml);
                XElement generalElement = doc.Element("z2tLookup").Element("errorInfo");

                String errorInfo = generalElement.Element("errorMessage").Value;
                
                if(errorInfo.Equals("Success"))
                {

                    XElement generalInnerElement =
                        doc.Element("z2tLookup").Element("addressInfo").Element("addresses").Element("address");

                    XElement generalInnerTaxElement =
                        generalInnerElement.Element("salesTax").Element("rateInfo");

                    XElement generalInnerNotesElement =
                        generalInnerElement.Element("notes");


                    foreach (XElement childElement in generalInnerNotesElement.Descendants("noteDetail").Elements("note"))
                    {
                        if (childElement.Value.ToString().Equals("Shipping charges are not taxable"))
                        {
                            shipping = 1;
                        }
                    }   

                    Response.Write("Zip Code: " + generalInnerElement.Element("zipCode").Value + "<br>");
                    Response.Write("Sales Tax Rate: " + generalInnerTaxElement.Element("taxRate").Value + "<br >");
                    Response.Write("Post Office City: " + generalInnerElement.Element("place").Value + "<br >");
                    Response.Write("County: " + generalInnerElement.Element("county").Value + "<br >");
                    Response.Write("State: " + generalInnerElement.Element("state").Value + "<br >");
                    Response.Write("Shipping Taxable: " + shipping + "<br >");
                
                }
               
            }

            catch (Exception em)
            {
                Response.Write(em.Message);
            }

            
        }
    
}