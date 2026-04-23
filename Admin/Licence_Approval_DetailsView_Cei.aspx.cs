using CEI_PRoject;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static iText.StyledXmlParser.Jsoup.Select.Evaluator;

namespace CEIHaryana.Admin
{
    public partial class Licence_Approval_DetailsView_Cei : System.Web.UI.Page
    {

        //page created by aslam
        CEI CEI = new CEI();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    if (!IsPostBack && Request.UrlReferrer != null)
                    {
                        string referrerUrl = Request.UrlReferrer.ToString();

                        if (!referrerUrl.Contains("New_Registration_Information.aspx") && !referrerUrl.Contains("New_Registration_Information_Contractor.aspx"))
                        {
                            Session["PreviousPageUrl2"] = referrerUrl;
                        }
                    }

                    if (Convert.ToString(Session["AdminId"]) != null && Convert.ToString(Session["AdminId"]) != string.Empty && Convert.ToString(Session["Application_Id"]) != null && Convert.ToString(Session["Application_Id"]) != string.Empty)
                    {
                        hdn_Lic_ApplicationId.Value = Session["Application_Id"].ToString();
                        Session["Application_Id"] = null;

                        string var_Lic_ApplicationId = hdn_Lic_ApplicationId.Value;

                        if (!string.IsNullOrEmpty(var_Lic_ApplicationId))
                        {
                            GetHeaderDetailsWithId(var_Lic_ApplicationId);
                            BindApplicationLogDetails(var_Lic_ApplicationId);
                        }

                    }
                    else
                    {
                        Session["AdminId"] = null;
                        Response.Redirect("/AdminLogout.aspx", false);
                    }

                }
            }
            catch (Exception ex)
            {
                string errorMessage = ex.ToString().Replace("'", "\\'");
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", $"alert('An unexpected error occurred: {errorMessage}');", true);
                return;
            }

        }
        private void GetHeaderDetailsWithId(string licApplicationId)
        {
            ucLicenceDetails.BindHeaderDetails(licApplicationId);
        }


        private void BindApplicationLogDetails(string licApplicationId)
        {
            try
            {
                DataSet ds = new DataSet();
                ds = CEI.Get_Licence_ApplicationLogDetails(licApplicationId);

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();

                    string script = "alert(\"No record found for this application.\");";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", script, true);
                }

                ds.Dispose();
            }
            catch (Exception ex)
            {
                string errorScript = "alert(\"An error occurred: " + ex.Message.Replace("'", "\\'") + "\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "errorMessage", errorScript, true);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (Session["PreviousPageUrl2"] != null)
            {
                Response.Redirect(Session["PreviousPageUrl2"].ToString(), false);
            }
        }

    }
}