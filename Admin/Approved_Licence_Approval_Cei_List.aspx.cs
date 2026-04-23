using CEI_PRoject;
using CEIHaryana.Print_Forms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEIHaryana.Admin
{
    public partial class Approved_Licence_Approval_Cei_List : System.Web.UI.Page
    {
        //PAGE CREATED BY ASLAM
        CEI CEI = new CEI();
        string LoginID = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Convert.ToString(Session["AdminId"]) != null || Convert.ToString(Session["AdminId"]) != string.Empty)
                    {
                        GridBind();
                    }
                    else
                    {
                        Session["AdminId"] = null;
                        Response.Redirect("/AdminLogout.aspx", false);
                        return;

                    }
                }
            }
            catch (Exception ex)
            {
                Session["AdminId"] = null;
                Response.Redirect("/AdminLogout.aspx", false);
            }
        }
        public void GridBind()
        {
            try
            {
                DataSet ds = new DataSet();
                ds = CEI.Licence_CEI_Approved_FinalRecommendationList();

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();

                }

                ds.Dispose();
            }
            catch (Exception ex)
            {
                string errorScript = "alert(\"An error occurred: " + ex.Message.Replace("'", "\\'") + "\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "errorMessage", errorScript, true);
            }


        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select" || e.CommandName == "Print")
            {
                Control ctrl = e.CommandSource as Control;
                GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
                Label lblApplicationId = (Label)row.FindControl("lblApplicationId");
                Label lblgetCategory = (Label)row.FindControl("lblgetCategory");
                Label lblLicenceType = (Label)row.FindControl("lblLicenceType");
                
                string applicationId = lblApplicationId?.Text;
                string category = lblgetCategory?.Text;

                Session["Application_Id"] = applicationId;

                if (e.CommandName == "Select")
                {
                    Response.Redirect("Licence_Approval_DetailsView_Cei.aspx", false);
                    return;
                }

                if (e.CommandName == "Print")
                {

                    if (!string.IsNullOrEmpty(lblLicenceType.Text) && lblLicenceType.Text == "New")
                    {
                        switch (category)
                        {
                            case "Contractor":
                                Response.Redirect("/Print_Forms/Contractor_Licence_New_Certificate.aspx", false);
                                break;
                            case "Supervisor":
                                Response.Redirect("/Print_Forms/Certificate_of_Competency.aspx", false);
                                break;
                            case "Wireman":
                                Response.Redirect("/Print_Forms/Certificate_of_wireman_Permit.aspx", false);
                                break;
                        }
                    }
                   else if (!string.IsNullOrEmpty(lblLicenceType.Text) && lblLicenceType.Text == "Renewal")
                    {
                        switch (category)
                        {
                            case "Contractor":
                                Response.Redirect("/Print_Forms/ContractorLicenceRenewal.aspx", false);
                                break;
                            case "Supervisor":

                                Response.Redirect("/Print_Forms/CertificateOfCompetencyRenewal.aspx", false);
                                break;
                            case "Wireman":
                                Response.Redirect("/Print_Forms/CertificateOfWiremanPermitRenewal.aspx", false);
                                break;
                        }
                    }

                }
            }
        }

    }
}