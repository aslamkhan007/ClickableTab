using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CEI_PRoject;
using CEIHaryana.Admin;

namespace CEIHaryana.SiteOwnerPages
{
    public partial class SwitchingSubstationTestReportPeriodic : System.Web.UI.Page
    {
        CEI CEI = new CEI();
        private static string ApplicantType, VoltageLevel, District, Division, Inspectiontype;

        string IdUpdate = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Convert.ToString(Session["SiteOwnerId"]) != null && Convert.ToString(Session["SiteOwnerId"]) != "")
                {
                    ddlVoltageBind();


                    txtapplication.Text = Session["Application"].ToString().Trim();
                    txtInstallation.Text = Session["Typs"].ToString().Trim();
                    txtid.Text = Session["Intimations"].ToString().Trim();
                    txtNOOfInstallation.Text = Session["NoOfInstallations"].ToString().Trim() + " Out of " + Session["TotalInstallation"].ToString().Trim();
                    Reset();
                }
                else
                {
                    Response.Redirect("/login.aspx", false);
                }
            }
        }

        private void ddlVoltageBind()
        {
            string Volts = string.Empty;
            if (Session["VoltageLevel"] != null)
            {
                Volts = Session["VoltageLevel"].ToString();
                DataSet dsVoltage = CEI.GetddlVotlageforSwitchingStation(Volts);
                if (dsVoltage != null && dsVoltage.Tables.Count > 0)
                {
                    ddlVoltage.DataSource = dsVoltage;
                    ddlVoltage.DataTextField = "VoltageID";
                    ddlVoltage.DataValueField = "Voltage";
                    ddlVoltage.DataBind();
                }
                ddlVoltage.Items.Insert(0, new ListItem("Select", "0"));
                dsVoltage.Clear();
            }
            else
            {
                ddlVoltage.Items.Insert(0, new ListItem("Select Voltage Level", "0"));
            }
        }

        protected void ddlBreakerType_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlBreakerType.SelectedValue == "3")
            {
                otherbreakertype.Visible = true;
            }
            else
            {
                otherbreakertype.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string IntimationId = Session["intimationid"].ToString();
                string CreatedBy = Session["SiteOwnerId"].ToString();
                string installationNo = Session["IHID"].ToString();
                string count = Session["NoOfInstallations"].ToString();

                DataSet ds = new DataSet();
                ds = CEI.GetIntimationDetails(IntimationId);

                ApplicantType = ds.Tables[0].Rows[0]["ApplicantType"].ToString();
                VoltageLevel = ds.Tables[0].Rows[0]["VoltageLevel"].ToString();
                District = ds.Tables[0].Rows[0]["District"].ToString();
                Division = ds.Tables[0].Rows[0]["Division"].ToString();
                Inspectiontype = ds.Tables[0].Rows[0]["PremisesType"].ToString();

                int countValue;
                if (!int.TryParse(count, out countValue))
                {
                    throw new Exception("Invalid installation count.");
                }

                int stationTransformerCapacity;
                if (!int.TryParse(txtStationTransformerCapacity.Text, out stationTransformerCapacity))
                {
                    throw new Exception("Invalid transformer capacity.");
                }

                int returnresult = CEI.InsertSwitchingStationData_Existing_HavingPreviousReport(
                    countValue,
                    IntimationId,
                    ddlVoltage.SelectedValue.ToString(),
                    txtSwitchingStationName.Text,
                    ddlBreakerType.SelectedItem.ToString(),
                    txtOtherbreakerType.Text,
                    txtTotalBreakers.Text,
                    stationTransformerCapacity,
                    txtSerialNo.Text,
                    txtLastInspectionIssueDate.Text,
                    ApplicantType,
                    VoltageLevel,
                    District,
                    Division,
                    Inspectiontype.Trim(),
                    CreatedBy
                );

                CEI.UpdateInstallations(installationNo, IntimationId);

                Reset();
                if (returnresult == 0)
                {
                    
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alertWithRedirectNextProcessExistingPage();", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alertWithRedirectdataRatingofinstallationPage();", true);
                }

            }
            catch (Exception ex)
            {

                DataSaved.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('" + ex.Message.ToString() + "')", true);
                return;
            }
        }

        private void Reset()
        {
            ddlVoltage.SelectedValue = "0";
            txtSwitchingStationName.Text = "";
            ddlBreakerType.SelectedValue = "0";
            txtOtherbreakerType.Text = "";
            txtTotalBreakers.Text = "";
            txtStationTransformerCapacity.Text = "";
            txtSerialNo.Text = "";
            txtLastInspectionIssueDate.Text = "";
        }
    }
}