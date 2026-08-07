using CEI_PRoject;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEIHaryana.Contractor
{
    public partial class TestReportForContractor : System.Web.UI.Page
    {

        CEI cei = new CEI();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var master = (MasterPage)Master;
                var loginTypeLabel = (Label)master.FindControl("LoginType");
                if (loginTypeLabel != null)
                {
                    loginTypeLabel.Text = "Contractor / Approval Pending Test Reports";
                }


                if (!IsPostBack)
                {
                    GridViewBind();
                }
            }
            catch
            {
                Response.Redirect("/Login.aspx");
            }
        }

        private void GridViewBind()
        {
            string LoginId = string.Empty;
            LoginId = Session["ContractorID"].ToString();
            DataSet ds = new DataSet();
            ds = cei.TestReportContractorHistory(LoginId, "Pending");
            if (ds.Tables.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                string script = "alert(\"No Record Found\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Select")
                {
                    Control ctrl = e.CommandSource as Control;
                    GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
                    Label lblTypeOf = (Label)row.FindControl("lblTypeOf");
                    Label lblIntimationId = (Label)row.FindControl("lblIntimationId");
                    Label lblCounts = (Label)row.FindControl("lblCounts");
                    Session["Counts"] = lblCounts.Text.Trim();
                    Session["IntimationId"] = lblIntimationId.Text.Trim();
                    Label lblApproval = (Label)row.FindControl("lblApproval");
                    Session["Approval1"] = lblApproval.Text;
                    Session["Approval"] = lblApproval.Text;
                    Session["TestReportHistory"] = "True";
                    DataSet ds = new DataSet();
                    ds = cei.GetData(lblTypeOf.Text.Trim(), lblIntimationId.Text.Trim(), lblCounts.Text.Trim());

                    if (lblTypeOf.Text.Trim() == "Line")
                    {

                       // Session["LineID"] = ds.Tables[0].Rows[0]["ID"].ToString();    gurmeeet
                        Session["LineID"] = ds.Tables[0].Rows[0]["TestReportId"].ToString();

                        //ds.Tables[0].Rows[0]["ID"].ToString();
                        Response.Redirect("/TestReportModal/LineTestReportModal.aspx", false);
                    }
                    else if (lblTypeOf.Text.Trim() == "Substation Transformer")
                    {

                        //Session["SubStationID"] = ds.Tables[0].Rows[0]["ID"].ToString();
                        Session["SubStationID"] = ds.Tables[0].Rows[0]["TestReportId"].ToString();
                        Response.Redirect("/TestReportModal/SubstationTransformerTestReportModal.aspx", false);
                    }
                    else if (lblTypeOf.Text.Trim() == "Generating Set")
                    {

                        //Session["GeneratingSetId"] = ds.Tables[0].Rows[0]["ID"].ToString();
                        Session["GeneratingSetId"] = ds.Tables[0].Rows[0]["TestReportId"].ToString();

                        Response.Redirect("/TestReportModal/GeneratingSetTestReportModal.aspx", false);
                    }
                    else if (lblTypeOf.Text.Trim() == "Switching Station")
                    {

                        Session["SwitchingSubstationId"] = ds.Tables[0].Rows[0]["TestReportId"].ToString();
                        //Session["GeneratingSetId"] = ds.Tables[0].Rows[0]["TestReportId"].ToString();

                        Response.Redirect("/TestReportModal/SwitchingSubstationTestReportModal.aspx", false);
                    }

                    Session["ReasionForRejection"] = ds.Tables[0].Rows[0]["RejectionReasion"].ToString();

                }
            }
            catch { }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView1.PageIndex = e.NewPageIndex;
                GridViewBind();
            }
            catch
            {

            }
        }
    }
}