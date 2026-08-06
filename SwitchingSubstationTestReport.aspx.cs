using CEI_PRoject;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CEIHaryana.Supervisor
{
    public partial class SwitchingSubstationTestReport : System.Web.UI.Page
    {
        CEI CEI = new CEI();
        string TestRportId =string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["SupervisorID"] != null || Request.Cookies["SupervisorID"] != null)
                    {
                        txtapplication.Text = Session["ApplicationForTestReport"].ToString().Trim();
                        txtInstallation.Text = Session["Typs"].ToString().Trim();
                        txtid.Text = Session["ID"].ToString().Trim();
                        txtNOOfInstallation.Text = Session["NoOfInstallations"].ToString().Trim() + " Out of " + Session["TotalInstallation"].ToString().Trim();
                        txtApplicantType.Text = Session["ApplicantType"].ToString().Trim();
                        ddlEarthing();
                        ddlLoadBindVoltage();
                    }
                }
            }
            catch
            {
                Response.Redirect("/Login.aspx");
            }
        }
        private void ddlLoadBindVoltage()
        {
            string Voltage = Session["VoltageLevel"].ToString();
            DataSet dsVoltage = new DataSet();
            dsVoltage = CEI.GetddlVotlageforSwitchingStation(Voltage);
            ddlVoltage.DataSource = dsVoltage;           
            ddlVoltage.DataTextField = "VoltageID";
            ddlVoltage.DataValueField = "Voltage";
            ddlVoltage.DataBind();
            ddlVoltage.Items.Insert(0, new ListItem("Select", "0"));
            dsVoltage.Clear();

        }
        private void ddlEarthing()
        {
            try
            {
                DataSet dsEarthing = new DataSet();
                dsEarthing = CEI.GetddlEarthing();

                if (dsEarthing.Tables[0].Rows.Count > 3) // Ensure at least 4 records exist
                {
                    // Skip first 3 records and take the next 40
                    DataTable dtFiltered = dsEarthing.Tables[0].AsEnumerable()
                                                .Skip(3)  // Skip first 3 records
                                                .Take(37) // Take the next 40
                                                .CopyToDataTable();
                    ddlEarthingsubstation.DataSource = dtFiltered;
                }
                else
                {
                    // If there are not enough records, bind all data
                    ddlEarthingsubstation.DataSource = dsEarthing.Tables[0];
                }

                ddlEarthingsubstation.DataTextField = "Numbers";
                ddlEarthingsubstation.DataValueField = "Id";
                ddlEarthingsubstation.DataBind();
                ddlEarthingsubstation.Items.Insert(0, new ListItem("Select", "0"));

                dsEarthing.Clear();
            }
            catch (Exception)
            {
                // msg.Text = ex.Message;
            }
        }

        protected void ddlEarthingsubstation_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubstationEarthingDiv.Visible = true;

            // Store the Earthingtype controls in an array for easier manipulation
            Control[] earthingTypes = { EarthingSubstation1, EarthingSubstation2, EarthingSubstation3, EarthingSubstation4,EarthingSubstation5,EarthingSubstation6,EarthingSubstation7,EarthingSubstation8,EarthingSubstation9,EarthingSubstation10,
                EarthingSubstation11, EarthingSubstation12, EarthingSubstation13, EarthingSubstation14, EarthingSubstation15, EarthingSubstation16, EarthingSubstation17, EarthingSubstation18,
                EarthingSubstation19,EarthingSubstation20,EarthingSubstation21,EarthingSubstation22,EarthingSubstation23,EarthingSubstation24,EarthingSubstation25,EarthingSubstation26,
                EarthingSubstation27,EarthingSubstation28,EarthingSubstation29,EarthingSubstation30, EarthingSubstation31, EarthingSubstation32, EarthingSubstation33, EarthingSubstation34, 
                EarthingSubstation35, EarthingSubstation36, EarthingSubstation37, EarthingSubstation38, EarthingSubstation39, EarthingSubstation40 };

            // First, hide all controls
            foreach (var earthingType in earthingTypes)
            {
                earthingType.Visible = false;
            }

            // Get the selected number of earthing types
            int numberOfEarthing = int.Parse(ddlEarthingsubstation.SelectedValue.Trim());

            // Show only the selected number of earthing types
            for (int i = 0; i < numberOfEarthing; i++)
            {
                earthingTypes[i].Visible = true;
            }
        }

        protected void ddlUsedFor_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Array of "Other" textboxes
            TextBox[] txtOtherEarthing = { txtOtherEarthing1,txtOtherEarthing2,txtOtherEarthing3,txtOtherEarthing4,txtOtherEarthing5,txtOtherEarthing6,txtOtherEarthing7, txtOtherEarthing8, txtOtherEarthing9, 
                txtOtherEarthing10,txtOtherEarthing11,txtOtherEarthing12,txtOtherEarthing13,txtOtherEarthing14,txtOtherEarthing15,txtOtherEarthing16,txtOtherEarthing17,txtOtherEarthing18,
                txtOtherEarthing19, txtOtherEarthing20,txtOtherEarthing21,txtOtherEarthing22,txtOtherEarthing23, txtOtherEarthing24, txtOtherEarthing25, txtOtherEarthing26, txtOtherEarthing27,
                txtOtherEarthing28, txtOtherEarthing29, txtOtherEarthing30, txtOtherEarthing31, txtOtherEarthing32, txtOtherEarthing33, txtOtherEarthing34, txtOtherEarthing35, txtOtherEarthing36, txtOtherEarthing37,
                txtOtherEarthing38,txtOtherEarthing39,txtOtherEarthing40 };

            // Array of dropdowns
            DropDownList[] ddlUsedFor = { ddlUsedFor1, ddlUsedFor2, ddlUsedFor3, ddlUsedFor4 ,ddlUsedFor5, ddlUsedFor6, ddlUsedFor7, ddlUsedFor8 ,ddlUsedFor9, ddlUsedFor10, ddlUsedFor11, ddlUsedFor12 ,
                ddlUsedFor13 , ddlUsedFor14 , ddlUsedFor15 , ddlUsedFor16 , ddlUsedFor17 , ddlUsedFor18 , ddlUsedFor19 , ddlUsedFor20 , ddlUsedFor21 , ddlUsedFor22 , ddlUsedFor23 , ddlUsedFor24 , 
                ddlUsedFor25 ,ddlUsedFor26 ,ddlUsedFor27 ,ddlUsedFor28 ,ddlUsedFor29 ,ddlUsedFor30 ,ddlUsedFor31 ,ddlUsedFor32 ,ddlUsedFor33 ,ddlUsedFor34,ddlUsedFor35 ,ddlUsedFor36 ,ddlUsedFor37 ,
                ddlUsedFor38 ,ddlUsedFor39 ,ddlUsedFor40};
            RequiredFieldValidator[] RequiredFieldValidator = { RequiredFieldValidator99, RequiredFieldValidator98,RequiredFieldValidator97,RequiredFieldValidator96,RequiredFieldValidator95,
                RequiredFieldValidator79, RequiredFieldValidator75,RequiredFieldValidator71,RequiredFieldValidator67,RequiredFieldValidator63, RequiredFieldValidator59, RequiredFieldValidator55, 
                RequiredFieldValidator51, RequiredFieldValidator47, RequiredFieldValidator23, RequiredFieldValidator25, RequiredFieldValidator28, RequiredFieldValidator35, RequiredFieldValidator39, 
                RequiredFieldValidator43, RequiredFieldValidator123, RequiredFieldValidator2113, RequiredFieldValidator2115,RequiredFieldValidator2111,RequiredFieldValidator2121,RequiredFieldValidator2126,
            RequiredFieldValidator2130,RequiredFieldValidator2135,RequiredFieldValidator2140,RequiredFieldValidator2146,RequiredFieldValidator2150,RequiredFieldValidator2154,RequiredFieldValidator2158,
                RequiredFieldValidator2162,RequiredFieldValidator2144,RequiredFieldValidator2170,RequiredFieldValidator2174,RequiredFieldValidator2179,RequiredFieldValidator2183,RequiredFieldValidator2186};

            // Hide all textboxes initially
           

            // Loop through each dropdown and check if "Other" is selected
            for (int i = 0; i < ddlUsedFor.Length; i++)
            {
                if (ddlUsedFor[i].SelectedItem.Text == "Other")
                {
                    txtOtherEarthing[i].Visible = true;
                    RequiredFieldValidator[i].Visible = true;
                }
            }
        }

        protected void BtnSubmitSubstation_Click(object sender, EventArgs e)
        {
            if (Check.Checked == true)
            {
                string count = Session["NoOfInstallations"].ToString().Trim();
                string CreatedBy = Session["SupervisorID"].ToString().Trim();
                string installationNo = Session["IHID"].ToString();
                DataSet ds = new DataSet();
                ds = CEI.InsertSwitchinData(count, txtid.Text, txtSerialNo.Text, ddlVoltage.SelectedValue.ToString(), txtName.Text, 
                    ddlBreakerType.SelectedItem.Text, txtOther.Text,
                     txtBreakerNo.Text, txtCapacity.Text, ddlEarthingsubstation.SelectedItem.Text, CreatedBy);
                if (ds != null && ds.Tables.Count > 0)
                {
                    TestRportId = ds.Tables[0].Rows[0]["TReportID"].ToString();
                }
                //int totalRows = Math.Min(tbl.Rows.Count, int.Parse(ddlEarthingsubstation.SelectedItem.Text));

                for (int rowIndex = 1; rowIndex <= 1; rowIndex++)
                {
                    HtmlTableRow row = tbl.Rows[rowIndex];
                    for (int i = 1; i <= int.Parse(ddlEarthingsubstation.SelectedItem.Text); i++)
                    {


                        DropDownList ddlEarthingType = (DropDownList)row.FindControl("ddlSubstationEarthing" + i);
                        DropDownList ddlUsedFor = (DropDownList)row.FindControl("ddlUsedFor" + i);
                        TextBox txtEarthingValue = (TextBox)row.FindControl("txtSubstationEarthing" + i);
                        TextBox txtOtherEarthing = (TextBox)row.FindControl("txtOtherEarthing" + i);

                        CEI.InsertSwitchingEarting(TestRportId, i, ddlEarthingType.SelectedItem.Text, txtEarthingValue.Text, ddlUsedFor.SelectedItem.Text, txtOtherEarthing.Text);

                    }
                }
                CEI.UpdateInstallations(installationNo, txtid.Text);
                Reset();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alertWithRedirectdata();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert()", "alert('You have to check the declaration first !!!')", true);
            }
        }
        public void Reset()
        {
            txtid.Text = ""; txtSerialNo.Text = ""; ddlVoltage.SelectedValue = "0"; txtName.Text = ""; ddlBreakerType.SelectedValue = "0";
            txtBreakerNo.Text = ""; txtCapacity.Text = ""; ddlEarthingsubstation.SelectedValue = "0";
        }

        protected void ddlBreakerType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBreakerType.SelectedValue =="3")
            {

                Other.Visible = true;
            }
            else
            {
                Other.Visible = false;
            }
        }
    }
}