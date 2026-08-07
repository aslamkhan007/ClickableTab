using CEI_PRoject;
using CEIHaryana;
using CEIHaryana.Model.Common.Classes;
using CEIHaryana.Model.Common.Method;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEIHaryana.Supervisor
{
    public partial class InstallationDetails : System.Web.UI.Page
    {
        CEI CEI = new CEI();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    var master = (MasterPage)Master;
                    var loginTypeLabel = (Label)master.FindControl("LoginType");
                    if (loginTypeLabel != null)
                    {
                        loginTypeLabel.Text = "Supervisor / Create New Test Report / Installation Details";
                    }

                    if (Session["SupervisorID"] != null || Request.Cookies["SupervisorID"] != null)
                    {
                        getWorkIntimationData();
                    }
                    else
                    {
                        Response.Redirect("/SupervisorLogout.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/SupervisorLogout.aspx");
            }
        }

        private void getWorkIntimationData()
        {
            string Id = Session["id"].ToString();

            DataTable ds = new DataTable();
            ds = CEI.GetInstllationsforSupervisor(Id, Session["SupervisorID"].ToString());
            if (ds.Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                string script = "alert(\"All test reports of given installation is Generated.Please initiate with diffrent intimation.\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }
            ds.Dispose();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            getWorkIntimationData();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (Session["SupervisorID"] != null || Request.Cookies["SupervisorID"] != null)
                {
                    if (e.CommandName == "Select")
                    {
                        Control ctrl = e.CommandSource as Control;
                        GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
                        Label lblhistory = (Label)row.FindControl("lblhistory");
                        Label lblStatus = (Label)row.FindControl("lblStatus");
                        Label lblReportType = (Label)row.FindControl("lblReportType");
                        Label lblAssignedSupervisor = (Label)row.FindControl("lblAssignedSupervisor");
                        Label lblInitialSupervisor = (Label)row.FindControl("lblInitialSupervisor");



                        Session["Approval"] = lblStatus.Text.Trim();

                        if (Session["Approval"].ToString() != null)
                        {
                            Session["Typs"] = "";
                            Session["TypeOf"] = "";
                            Session["Application"] = "";
                            Session["ApplicationForTestReport"] = "";
                            Session["Intimations"] = "";
                            Session["NoOfInstallations"] = "";
                            Session["NoOfInstallation"] = "";
                            Session["TotalInstallation"] = "";
                            Session["IHID"] = "";
                            Session["IHIDs"] = "";
                            Session["LineId"] = "";
                            Session["ValueId"] = "";
                            Session["SubStationID"] = "";
                            Session["GeneratingSetId"] = "";
                            Session["ApplicantType"] = "";
                        }

                        if (lblhistory.Text.Trim() == "Generated" && lblStatus.Text.Trim() != "Reject")
                        {
                            string script = "alert(\"You already created a test report for this. It is now only visible under Test Report History.\");";
                            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                        }
                        else if (lblReportType.Text == "Returned")
                        {

                            if (Session["SupervisorID"].ToString().ToLower() == lblAssignedSupervisor.Text.ToString().ToLower())
                            {
                                Label lblTyps = (Label)row.FindControl("lblTyps");
                                Session["Typs"] = lblTyps.Text.Trim();
                                Session["TypeOf"] = lblTyps.Text.Trim();                          ///////////////
                                Label lblApllication = (Label)row.FindControl("lblApllication");
                                Session["Application"] = lblApllication.Text.Trim();
                                Session["ApplicationForTestReport"] = lblApllication.Text.Trim(); /////////
                                Label lblIntimations = (Label)row.FindControl("lblIntimations");
                                Session["Intimations"] = lblIntimations.Text.Trim();
                                Label lblNoOfInstallations = (Label)row.FindControl("lblNoOfInstallations");
                                Session["NoOfInstallations"] = lblNoOfInstallations.Text.Trim();
                                Session["NoOfInstallation"] = lblNoOfInstallations.Text.Trim();
                                Label lblTotalInstallation = (Label)row.FindControl("lblTotalInstallation");
                                Session["TotalInstallation"] = lblTotalInstallation.Text.Trim();
                                Label lblID = (Label)row.FindControl("lblID");
                                Session["IHID"] = lblID.Text.Trim();
                                Session["IHIDs"] = lblID.Text.Trim();                           //////////////
                                Label lblVoltageLevel = (Label)row.FindControl("lblVoltageLevel");
                                Session["VoltageLevel"] = lblVoltageLevel.Text.Trim();
                                //Label lblApplicantType = (Label)row.FindControl("ApplicantType");
                                //Session["ApplicantType"] = lblApplicantType.Text.Trim();
                                DataSet ds = new DataSet();
                                ds = CEI.GetData(lblTyps.Text.Trim(), lblIntimations.Text.Trim(), lblNoOfInstallations.Text.Trim());
                                if (lblTyps.Text.Trim() == "Line")
                                {
                                    //if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                                    //{
                                    //    Session["LineId"] = ds.Tables[0].Rows[0]["ID"].ToString();
                                    //    Session["ValueId"] = "True";
                                    //}
                                    Response.Redirect("/Supervisor/LineTestReport.aspx", false);
                                }
                                else if (lblTyps.Text.Trim() == "Substation Transformer")
                                {
                                    //if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                                    //{
                                    //    Session["SubStationID"] = ds.Tables[0].Rows[0]["ID"].ToString();
                                    //    Session["ValueId"] = "True";
                                    //}
                                    Response.Redirect("/Supervisor/SubstationTestReport.aspx", false);
                                }
                                else if (lblTyps.Text.Trim() == "Generating Set")
                                {
                                    //if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                                    //{
                                    //    Session["GeneratingSetId"] = ds.Tables[0].Rows[0]["ID"].ToString();
                                    //    Session["ValueId"] = "True";
                                    //}
                                    Response.Redirect("/Supervisor/GeneratingSetTestReport.aspx", false);
                                }

                                else if (lblTyps.Text.Trim() == "Switching Station" || lblTyps.Text.Trim() == "Switching Substation")
                                {
                                    Response.Redirect("/Supervisor/SwitchingSubstationTestReport.aspx", false);
                                }
                            }
                            else
                            {
                                string script = "alert(\"You are not Authorised to Edit.\");";
                                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                            }
                        }
                        //If The TestReport Is Assigned To New Supervisor Then That One Should Not Be Able to Work On Other TestReports In That Intimation
                        else if (lblInitialSupervisor.Text.Trim().ToLower() == "no")
                        {
                            string script = "alert(\"You are not Authorised to Edit This.\");";
                            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                        }
                        else
                        {
                            Label lblTyps = (Label)row.FindControl("lblTyps");
                            if (!lblTyps.Text.Trim().Equals("Switching Station", StringComparison.OrdinalIgnoreCase) && !lblTyps.Text.Trim().Equals("Switching Substation", StringComparison.OrdinalIgnoreCase))
                            {
                                Session["Typs"] = lblTyps.Text.Trim();
                                Session["TypeOf"] = lblTyps.Text.Trim();                          ///////////////
                                Label lblApllication = (Label)row.FindControl("lblApllication");
                                Session["Application"] = lblApllication.Text.Trim();
                                Session["ApplicationForTestReport"] = lblApllication.Text.Trim(); /////////
                                Label lblIntimations = (Label)row.FindControl("lblIntimations");
                                Session["Intimations"] = lblIntimations.Text.Trim();
                                Label lblNoOfInstallations = (Label)row.FindControl("lblNoOfInstallations");
                                Session["NoOfInstallations"] = lblNoOfInstallations.Text.Trim();
                                Session["NoOfInstallation"] = lblNoOfInstallations.Text.Trim();
                                Label lblTotalInstallation = (Label)row.FindControl("lblTotalInstallation");
                                Session["TotalInstallation"] = lblTotalInstallation.Text.Trim();
                                Label lblID = (Label)row.FindControl("lblID");
                                Session["IHID"] = lblID.Text.Trim();
                                Session["IHIDs"] = lblID.Text.Trim();                           //////////////
                                Label lblVoltageLevel = (Label)row.FindControl("lblVoltageLevel");
                                Session["VoltageLevel"] = lblVoltageLevel.Text.Trim();
                                Label lblApplicant = (Label)row.FindControl("lblApplicant");
                                Session["ApplicantType"] = lblApplicant.Text.Trim();
                                DataSet ds = new DataSet();
                                ds = CEI.GetData(lblTyps.Text.Trim(), lblIntimations.Text.Trim(), lblNoOfInstallations.Text.Trim());
                            }
                            if (lblTyps.Text.Trim() == "Line")
                            {
                                //if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                                //{
                                //    Session["LineId"] = ds.Tables[0].Rows[0]["ID"].ToString();
                                //    Session["ValueId"] = "True";
                                //}
                                Response.Redirect("/Supervisor/LineTestReport.aspx", false);
                            }
                            else if (lblTyps.Text.Trim() == "Substation Transformer")
                            {
                                //if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                                //{
                                //    Session["SubStationID"] = ds.Tables[0].Rows[0]["ID"].ToString();
                                //    Session["ValueId"] = "True";
                                //}
                                Response.Redirect("/Supervisor/SubstationTestReport.aspx", false);
                            }
                            else if (lblTyps.Text.Trim() == "Generating Set")
                            {
                                //if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                                //{
                                //    Session["GeneratingSetId"] = ds.Tables[0].Rows[0]["ID"].ToString();
                                //    Session["ValueId"] = "True";
                                //}
                                Response.Redirect("/Supervisor/GeneratingSetTestReport.aspx", false);
                            }

                            else if (lblTyps.Text.Trim() == "Switching Station" || lblTyps.Text.Trim() == "Switching Substation")
                            {
                                Label lblApllication = (Label)row.FindControl("lblApllication");
                                Label lblNoOfInstallations = (Label)row.FindControl("lblNoOfInstallations");
                                Label lblTotalInstallation = (Label)row.FindControl("lblTotalInstallation");
                                Label lblIntimations = (Label)row.FindControl("lblIntimations");
                                Label lblVoltageLevel = (Label)row.FindControl("lblVoltageLevel");
                                Label lblApplicant = (Label)row.FindControl("lblApplicant");
                                Label lblID = (Label)row.FindControl("lblID");
                                InstallationComponent obj = new InstallationComponent()
                                {
                                    Typs = lblTyps.Text.Trim(),
                                    Application = lblApllication.Text.Trim(),
                                    NoOfInstallation = lblNoOfInstallations.Text.Trim(),
                                    TotalInstallation = lblTotalInstallation.Text.Trim(),
                                    IHID = lblIntimations.Text.Trim(),
                                    InstallationId = lblID.Text.Trim(),
                                    VoltageLevel = lblVoltageLevel.Text.Trim(),
                                    ApplicantType = lblApplicant.Text.Trim()
                                };
                                string json = JsonConvert.SerializeObject(obj);
                                string token = CryptoHelper.Encrypt(json);
                                Response.Redirect("/Supervisor/SwitchingSubstationTestReport.aspx?d=" + token, false);
                            }
                        }


                    }
                    else
                    {

                    }
                }
                else
                {
                    //logout
                }
            }
            catch (Exception)
            { }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblReportType = (Label)e.Row.FindControl("lblReportType");

                if (lblReportType != null && lblReportType.Text == "Returned")
                {
                    e.Row.CssClass = "ReturnedRowColor";
                }

            }
        }
    }
}