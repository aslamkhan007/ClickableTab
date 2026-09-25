using CEI_PRoject;
using CEIHaryana.Admin;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Media;
using static System.Net.WebRequestMethods;


namespace CEIHaryana.Contractor
{
    public partial class Work_Intimation : System.Web.UI.Page
    {
        CEI CEI = new CEI();
        string ContractorID = string.Empty;
        string REID = string.Empty;
        string TypeOfInspection = string.Empty;
        //List<string> SelectedSupervisor = new List<string>();
        private static string UserID, selectedVoltageLevel;
        private static int Voltage;
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
                        loginTypeLabel.Text = "Contractor / WorkIntimation";
                    }

                    //if (Session["ContractorID"] != null || Request.Cookies["ContractorID"] != null)
                    if (Convert.ToString(Session["ContractorID"]) != null && Convert.ToString(Session["ContractorID"]) != "")
                    {
                        ScriptManager scriptManager = ScriptManager.GetCurrent(this);
                        string ContractorId = Convert.ToString(Session["ContractorID"]);

                        ddlLoadBindPremises();
                        worktypevisiblity();
                        ddlLoadBindVoltage(ContractorId);
                        BindDistrict();


                        BindListBoxInstallationType();
                        hiddenfield.Visible = false;
                        hiddenfield1.Visible = false;
                        OtherPremises.Visible = false;
                        //ElectricalInstallation.Visible = true;

                        if (Convert.ToString(Session["id"]) == null || Convert.ToString(Session["id"]) == "")
                        {
                            Session["UpdationId"] = null;
                            GetGridData(ContractorId);
                            GridView1.Columns[0].Visible = true;
                            customFile.Visible = true;
                        }
                        else
                        {
                            //GetDetails();
                            GetGridData(ContractorId);
                            //GetassigneddatatoContractor();
                            //CheckedPriviousSupervisor();
                            GridView1.Columns[0].Visible = true;
                            customFile.Visible = true;
                            //Session["UpdationId"] = Session["id"];
                            Session["id"] = null;
                        }
                    }
                    else
                    {
                        Session["ContractorID"] = "";
                        Response.Redirect("/ContractorLogout.aspx");
                    }
                }
                else
                {
                    HideIndustry_PremisesOption();
                }
            }
            catch
            {
                Session["ContractorID"] = "";
                Response.Redirect("/ContractorLogout.aspx");
            }
        }
        //protected void GetDetails()
        //{
        //    try
        //    {
        //        REID = Session["id"].ToString();
        //        DataSet ds = new DataSet();
        //        ds = CEI.GetWorkIntimationDataForAdmin(REID);
        //        string dp_Id24 = ds.Tables[0].Rows[0]["ApplicantType"].ToString();
        //        ddlApplicantType.SelectedIndex = ddlApplicantType.Items.IndexOf(ddlApplicantType.Items.FindByText(dp_Id24));
        //        //if (ddlApplicantType.Text.Trim() == "1")
        //        //{}
        //        if (ddlApplicantType.SelectedIndex == 2)
        //        {
        //            //DivPoweUtility.Visible = true;
        //            //DivPoweUtilityWing.Visible = true;
        //        }
        //        string dp_Id14 = ds.Tables[0].Rows[0]["PowerUtility"].ToString();
        //        ddlPoweUtility.SelectedIndex = ddlPoweUtility.Items.IndexOf(ddlPoweUtility.Items.FindByText(dp_Id14));
        //        string dp_Id15 = ds.Tables[0].Rows[0]["PowerUtilityWing"].ToString();
        //        //ddlPowerUtilityWing.SelectedIndex = ddlPowerUtilityWing.Items.IndexOf(ddlPowerUtilityWing.Items.FindByText(dp_Id15));
        //        string dp_Id = ds.Tables[0].Rows[0]["ContractorType"].ToString();
        //        ddlworktype.SelectedIndex = ddlworktype.Items.IndexOf(ddlworktype.Items.FindByText(dp_Id));
        //        if (ddlworktype.Text.Trim() == "2")
        //        {
        //            agency.Visible = true;
        //            individual.Visible = false;
        //        }
        //        txtName.Text = ds.Tables[0].Rows[0]["NameOfOwner"].ToString();
        //        txtagency.Text = ds.Tables[0].Rows[0]["NameOfAgency"].ToString();
        //        txtPhone.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
        //        string District = ds.Tables[0].Rows[0]["District"].ToString();
        //        ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByText(District));
        //        txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
        //        txtPin.Text = ds.Tables[0].Rows[0]["Pincode"].ToString();
        //        string dp_Id1 = ds.Tables[0].Rows[0]["PremisesType"].ToString();
        //        ddlPremises.SelectedIndex = ddlPremises.Items.IndexOf(ddlPremises.Items.FindByText(dp_Id1));
        //        //txtName.Text = ds.Tables[0].Rows[0]["SubDivision"].ToString();
        //        //ddlPremises.SelectedValue = dp_Id1;
        //        txtPAN.Text = ds.Tables[0].Rows[0]["PanNumber"].ToString();
        //        if (txtPAN.Text.Trim() != null && txtPAN.Text.Trim() != "")
        //        {
        //            DivPancard_TanNo.Visible = true;
        //        }
        //        txtTanNumber.Text = ds.Tables[0].Rows[0]["TanNumber"].ToString();
        //        if (txtTanNumber.Text.Trim() != null && txtTanNumber.Text.Trim() != "")
        //        {
        //            DivOtherDepartment.Visible = true;
        //        }
        //        string dp_Id2 = ds.Tables[0].Rows[0]["OtherPremises"].ToString();
        //        txtOtherPremises.Text = ds.Tables[0].Rows[0]["OtherPremises"].ToString();
        //        string dp_Id3 = ds.Tables[0].Rows[0]["VoltageLevel"].ToString();
        //        // ddlVoltageLevel.SelectedValue = dp_Id3;
        //        ddlVoltageLevel.SelectedIndex = ddlVoltageLevel.Items.IndexOf(ddlVoltageLevel.Items.FindByText(dp_Id3));
        //        //          string dp_Id24 = ds.Tables[0].Rows[0]["ApplicantType"].ToString();
        //        // ddlVoltageLevel.SelectedValue = dp_Id3;
        //        //       ddlApplicantType.SelectedIndex = ddlApplicantType.Items.IndexOf(ddlApplicantType.Items.FindByText(dp_Id24));
        //        txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
        //        string dp_Id4 = ds.Tables[0].Rows[0]["WorkStartDate"].ToString();
        //        txtStartDate.Text = DateTime.Parse(dp_Id4).ToString("yyyy-MM-dd");
        //        string dp_Id5 = ds.Tables[0].Rows[0]["CompletionDate"].ToString();
        //        Session["File"] = ds.Tables[0].Rows[0]["CopyOfWorkOrder"].ToString();
        //        txtCompletitionDate.Text = DateTime.Parse(dp_Id4).ToString("yyyy-MM-dd");
        //        string dp_Id6 = ds.Tables[0].Rows[0]["CompletionDateasPerOrder"].ToString();
        //        string dp_Id7 = ds.Tables[0].Rows[0]["AnyWorkIssued"].ToString();
        //        string dp_Id8 = ds.Tables[0].Rows[0]["TypeOfInstallation1"].ToString();
        //        string dp_Id9 = ds.Tables[0].Rows[0]["NumberOfInstallation1"].ToString();
        //        string dp_Id10 = ds.Tables[0].Rows[0]["TypeOfInstallation2"].ToString();
        //        string dp_Id11 = ds.Tables[0].Rows[0]["NumberOfInstallation2"].ToString();
        //        string dp_Id12 = ds.Tables[0].Rows[0]["TypeOfInstallation3"].ToString();
        //        string dp_Id13 = ds.Tables[0].Rows[0]["NumberOfInstallation3"].ToString();
        //        //string dp_Id14 = ds.Tables[0].Rows[0]["TypeOfInstallation4"].ToString();
        //        //string dp_Id15 = ds.Tables[0].Rows[0]["NumberOfInstallation4"].ToString();
        //        //string dp_Id16 = ds.Tables[0].Rows[0]["TypeOfInstallation5"].ToString();
        //        //string dp_Id17 = ds.Tables[0].Rows[0]["NumberOfInstallation5"].ToString();
        //        //string dp_Id18 = ds.Tables[0].Rows[0]["TypeOfInstallation6"].ToString();
        //        //string dp_Id19 = ds.Tables[0].Rows[0]["NumberOfInstallation6"].ToString();
        //        //string dp_Id20 = ds.Tables[0].Rows[0]["TypeOfInstallation7"].ToString();
        //        //string dp_Id21 = ds.Tables[0].Rows[0]["NumberOfInstallation7"].ToString();
        //        //string dp_Id22 = ds.Tables[0].Rows[0]["TypeOfInstallation8"].ToString();
        //        //string dp_Id23 = ds.Tables[0].Rows[0]["NumberOfInstallation8"].ToString();
        //        string TestReportGenerated = ds.Tables[0].Rows[0]["TestReportGenerated"].ToString();
        //        if (dp_Id2 != "")
        //        {
        //            OtherPremises.Visible = true;
        //        }
        //        if (dp_Id8 != "")
        //        {
        //            Installation.Visible = true;
        //            installationType1.Visible = true;
        //            txtinstallationType1.Text = dp_Id8;
        //            txtinstallationNo1.Text = dp_Id9;
        //        }
        //        else
        //        {
        //            installationType1.Visible = false;
        //        }
        //        if (dp_Id10 != "" && dp_Id11 != "")
        //        {
        //            Installation.Visible = true;
        //            installationType2.Visible = true;
        //            txtinstallationType2.Text = dp_Id10;
        //            txtinstallationNo2.Text = dp_Id11;
        //        }
        //        else
        //        {
        //            installationType2.Visible = false;
        //        }
        //        if (dp_Id12 != "")
        //        {
        //            Installation.Visible = true;
        //            installationType3.Visible = true;
        //            txtinstallationType3.Text = dp_Id12;
        //            txtinstallationNo3.Text = dp_Id13;
        //        }
        //        else
        //        {
        //            installationType3.Visible = false;
        //        }
        //        //if (dp_Id14 != "")
        //        //{
        //        //    Installation.Visible = true;
        //        //    installationType4.Visible = true;
        //        //    txtinstallationType4.Text = dp_Id14;
        //        //    txtinstallationNo4.Text = dp_Id15;
        //        //}
        //        //if (dp_Id16 != "")
        //        //{
        //        //    Installation.Visible = true;
        //        //    installationType5.Visible = true;
        //        //    txtinstallationType5.Text = dp_Id16;
        //        //    txtinstallationNo5.Text = dp_Id17;
        //        //}
        //        //if (dp_Id18 != "")
        //        //{
        //        //    Installation.Visible = true;
        //        //    installationType6.Visible = true;
        //        //    txtinstallationType6.Text = dp_Id18;
        //        //    txtinstallationNo6.Text = dp_Id19;
        //        //}
        //        //if (dp_Id20 != "")
        //        //{
        //        //    Installation.Visible = true;
        //        //    installationType7.Visible = true;
        //        //    txtinstallationType7.Text = dp_Id20;
        //        //    txtinstallationNo7.Text = dp_Id21;
        //        //}
        //        //if (dp_Id22 != "")
        //        //{
        //        //    Installation.Visible = true;
        //        //    installationType8.Visible = true;
        //        //    txtinstallationType8.Text = dp_Id22;
        //        //    txtinstallationNo8.Text = dp_Id23;
        //        //}
        //        ddlAnyWork.SelectedIndex = ddlAnyWork.Items.IndexOf(ddlAnyWork.Items.FindByText(dp_Id7));
        //        if (dp_Id7 == "Yes")
        //        {
        //            hiddenfield.Visible = true;
        //            hiddenfield1.Visible = true;
        //            customFile.Visible = false;
        //            customFileLocation.Visible = false;
        //            txtCompletionDateAPWO.Text = DateTime.Parse(dp_Id6).ToString("yyyy-MM-dd");
        //        }
        //        if (ddlVoltageLevel.SelectedValue == "650V")
        //        {
        //            installationType2.Visible = false;
        //        }
        //        else
        //        {
        //            installationType2.Visible = true;
        //        }
        //        //  WorkDetail.Text = ds.Tables[0].Rows[0]["WorkDetails"].ToString();
        //        customFileLocation.Text = ds.Tables[0].Rows[0]["CopyOfWorkOrder"].ToString();
        //        if (TestReportGenerated.Trim() == "Yes")
        //        {
        //            txtPAN.Attributes.Add("readonly", "readonly");
        //            ddlworktype.Attributes.Add("disabled", "disabled");
        //            txtName.Attributes.Add("readonly", "readonly");
        //            txtagency.Attributes.Add("readonly", "readonly");
        //            txtPhone.Attributes.Add("readonly", "readonly");
        //            txtAddress.Attributes.Add("readonly", "readonly");
        //            ddlDistrict.Attributes.Add("disabled", "disabled");
        //            txtPin.Attributes.Add("readonly", "readonly");
        //            txtOtherPremises.Attributes.Add("readonly", "readonly");
        //            txtEmail.Attributes.Add("readonly", "readonly");
        //            ddlPremises.Attributes.Add("disabled", "disabled");
        //            ddlVoltageLevel.Attributes.Add("disabled", "disabled");
        //            ddlApplicantType.Attributes.Add("disabled", "disabled");
        //            txtinstallationNo1.Attributes.Add("disabled", "disabled");
        //            txtinstallationNo2.Attributes.Add("disabled", "disabled");
        //            txtinstallationNo3.Attributes.Add("disabled", "disabled");
        //            txtStartDate.Attributes.Add("readonly", "readonly");
        //            txtCompletitionDate.Attributes.Add("readonly", "readonly");
        //            ddlAnyWork.Attributes.Add("disabled", "disabled");
        //            txtCompletionDateAPWO.Attributes.Add("disabled", "disabled");
        //            btnReset.Visible = false;
        //            btnSubmit.Visible = false;
        //            btnBack.Visible = true;
        //            lnkFile.Visible = true;
        //        }
        //        else
        //        {
        //            btnReset.Visible = false;
        //            btnSubmit.Visible = true;
        //            btnSubmit.Text = "Update";
        //            btnBack.Visible = true;
        //            lnkFile.Visible = true;
        //        }
        //    }
        //    catch { }
        //}
        protected void txtPAN_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //Added by aslam on 23 may 2025 to Rebind Premises 
                ddlLoadBindPremises();
                //
                string PANNumber = txtPAN.Text.Trim();
                System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex("^[A-Za-z]{4}[0-9]{5}[A-Za-z]{1}$|^[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}$");
                if (!regex.IsMatch(PANNumber))
                {
                    txtPAN.Focus();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('Invalid PAN/TAN card format. Please enter a valid PAN/TAN number.');", true);
                    txtPAN.Text = "";
                    return;
                }
                DataSet ds = new DataSet();
                ds = CEI.GetDetailsByPanNumberId(PANNumber);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string ContractNameAgeny = ds.Tables[0].Rows[0]["username"].ToString();
                    string contractorType = ds.Tables[0].Rows[0]["ContractorType"].ToString();
                    ddlworktype.SelectedIndex = ddlworktype.Items.IndexOf(ddlworktype.Items.FindByText(contractorType));
                    ddlworktype.Enabled = false;
                    txtPhone.Text = ds.Tables[0].Rows[0]["Contact"].ToString();
                    txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    if (contractorType == "Firm/Company")
                    {
                        agency.Visible = true;
                        individual.Visible = false;
                        txtagency.Text = ContractNameAgeny; // ds.Tables[0].Rows[0]["NameOfAgency"].ToString();
                        txtagency.ReadOnly = true;
                    }
                    else if (contractorType == "Individual Person")
                    {
                        txtName.Text = ContractNameAgeny; //ds.Tables[0].Rows[0]["NameOfOwner"].ToString();
                        txtName.ReadOnly = true;
                    }
                }
                else
                {
                    ddlworktype.SelectedValue = "0";
                    ddlworktype.Enabled = true;
                    txtagency.Text = "";
                    txtName.Text = "";
                    txtagency.ReadOnly = false;
                    txtName.ReadOnly = false;
                    txtEmail.Text = "";
                    txtPhone.Text = "";
                    //Page.ClientScript.RegisterStartupScript(GetType(), "panNotFound", "alert('PAN card not found in the database.');", true);
                }
                HideIndustry_PremisesOption();
            }
            catch (Exception ex)
            {
                //Log the exception or provide a more detailed error message
                Page.ClientScript.RegisterStartupScript(GetType(), "error", $"alert('An error occurred: {ex.Message}');", true);
            }
        }
        protected void worktypevisiblity()
        {
            try
            {
                if (ddlworktype.SelectedValue == "1")
                {
                    individual.Visible = true;
                    agency.Visible = false;
                    txtagency.Text = "";
                }
                else if (ddlworktype.SelectedValue == "2")
                {
                    individual.Visible = false;
                    agency.Visible = true;
                    txtName.Text = "";
                }
                else
                {
                    individual.Visible = true;
                    agency.Visible = false;
                }
                //Added by aslam on 23 may 2025 to Rebind Premises 
                ddlLoadBindPremises();
                //Added By Aslam 22 apl 2025 to Remove industry if private and individual selection is done In Powerutility also remove
                HideIndustry_PremisesOption();
            }
            catch 
            {
                Session["ContractorID"] = "";
                Response.Redirect("/ContractorLogout.aspx");
            }

        }
        //Added By Aslam 22 apl 2025 to Remove industry if private and individual selection is done And In Powerutility also remove
        private void HideIndustry_PremisesOption()
        {
            if (ddlApplicantType.SelectedIndex == 1 && ddlworktype.SelectedIndex == 1 || ddlApplicantType.SelectedIndex == 2)
            {
                foreach (ListItem item in ddlPremises.Items)
                {
                    if (item.Value == "4")
                    {
                        item.Attributes.Add("style", "display:none");

                        //Added by aslam on 22 may 2025 If this option is selected, clear the selection 
                        if (item.Selected)
                        {
                            ddlPremises.SelectedIndex = -1; // Clear the selected value
                        }
                        //
                        break;
                    }

                }
            }
        }
        protected void ddlworktype_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ddlworktype.SelectedIndex = 0;
            worktypevisiblity();
        }
        private void ddlLoadBindPremises()
        {
            try
            {
                DataSet dsPremises = new DataSet();
                dsPremises = CEI.GetddlPremises();
                ddlPremises.DataSource = dsPremises;
                ddlPremises.DataTextField = "Premises";
                ddlPremises.DataValueField = "ID";
                ddlPremises.DataBind();
                ddlPremises.Items.Insert(0, new ListItem("Select", "0"));
                dsPremises.Clear();
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured');", true);
            }
        }
        private void BindListBoxInstallationType()
        {
            DataSet dsWorkDetail = new DataSet();
            dsWorkDetail = CEI.GetddlInstallationType();
            ddlWorkDetail.DataSource = dsWorkDetail;
            ddlWorkDetail.DataTextField = "InstallationType";
            ddlWorkDetail.DataValueField = "Id";
            ddlWorkDetail.DataBind();
            ddlWorkDetail.Items.Insert(0, new ListItem("Select", "0"));
            dsWorkDetail.Clear();
        }
        private void BindDistrict()
        {
            try
            {
                DataSet dsDistrict = new DataSet();
                dsDistrict = CEI.GetddlDistrict();
                ddlDistrict.DataSource = dsDistrict;
                ddlDistrict.DataTextField = "AreaCovered";
                ddlDistrict.DataValueField = "Id";
                ddlDistrict.DataBind();
                ddlDistrict.Items.Insert(0, new ListItem("Select", "0"));
                dsDistrict.Clear();
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured');", true);
            }
        }
        protected void lnkFile_Click(object sender, EventArgs e)
        {
            if (Session["File"].ToString() != "" && Session["File"].ToString() != null)
            {
                string fileName = Session["File"].ToString();
                //string filePath = "https://uat.ceiharyana.com" + fileName;
                string filePath = "https://uat.ceiharyana.com" + fileName;

                string script = $@"<script>window.open('{filePath}','_blank');</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "OpenFileInNewTab", script);
            }
        }
        private void ddlLoadBindVoltage(string UserID)
        {
            try
            {
                //UserID = Session["ContractorID"].ToString();
                DataSet dsVoltage = new DataSet();
                //dsVoltage = CEI.GetddlVoltageLevel();
                dsVoltage = CEI.GetddlVoltageLevelForContractorIntimation(UserID);
                ddlVoltageLevel.DataSource = dsVoltage;
                ddlVoltageLevel.DataTextField = "Voltagelevel";
                ddlVoltageLevel.DataValueField = "VoltageID";
                ddlVoltageLevel.DataBind();
                ddlVoltageLevel.Items.Insert(0, new ListItem("Select", "0"));
                dsVoltage.Clear();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured');", true);
            }
        }
        protected void Reset()
        {
            try
            {
                ddlworktype.SelectedValue = "0";
                txtName.Text = "";
                txtagency.Text = "";
                ddlDistrict.SelectedValue = "0";
                ddlApplicantType.SelectedValue = "0";
                txtPhone.Text = "";
                txtAddress.Text = "";
                txtPin.Text = "";
                txtTanNumber.Text = "";
                ddlPremises.SelectedValue = "0";
                ddlVoltageLevel.SelectedValue = "0";
                //txtOtherWorkDetail.Text = "";
                txtStartDate.Text = "";
                txtPAN.Text = "";
                Installation.Visible = false;
                txtinstallationType1.Text = "";
                txtinstallationNo1.Text = "";
                txtinstallationType2.Text = "";
                txtinstallationNo2.Text = "";
                txtinstallationType3.Text = "";
                txtinstallationNo3.Text = "";
                txtCompletitionDate.Text = "";
                ddlAnyWork.SelectedValue = "0";
                txtCompletionDateAPWO.Text = "";
                foreach (ListItem item in ddlWorkDetail.Items)
                {
                    item.Selected = false;
                }
                //OtherWorkDetail.Visible = false;
                OtherPremises.Visible = false;
                hiddenfield.Visible = false;
                hiddenfield1.Visible = false;
                txtEmail.Text = "";
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured');", true);
            }
        }
        public void GetGridData(string LoginID)
        {
            try
            {
                //string LoginID = string.Empty;
                //LoginID = Session["ContractorID"].ToString();
                hdnId.Value = LoginID;

                DataSet ds = new DataSet();

                ds = CEI.WorkIntimationGridData(LoginID);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                else
                {
                    Helpline.Visible = true;
                    btnSubmit.Enabled = false;
                    statement.Visible = true;
                }
            }
            catch 
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured');", true);
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    CheckBox chkSelectAll = (CheckBox)e.Row.FindControl("chkSelectAll");
                    chkSelectAll.Attributes.Add("onclick", "SelectAllCheckboxes(this)");
                }

                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    selectedVoltageLevel = ddlVoltageLevel.SelectedItem.ToString();
                    if (selectedVoltageLevel == "Upto 650V")
                    {
                        Voltage = 650;
                    }
                    else if (selectedVoltageLevel == "Upto 11KV")
                    {
                        Voltage = 11000;
                    }
                    else if (selectedVoltageLevel == "Upto 33KV")
                    {
                        Voltage = 33000;
                    }
                    else if (selectedVoltageLevel == "Upto 66KV")
                    {
                        Voltage = 66000;
                    }
                    else if (selectedVoltageLevel == "Upto 132KV")
                    {
                        Voltage = 132000;
                    }
                    else if (selectedVoltageLevel == "Upto 220KV")
                    {
                        Voltage = 220000;
                    }
                    else if (selectedVoltageLevel == "EHT Level")
                    {
                        Voltage = 500000;
                    }
                    Label lblVoltage = (Label)e.Row.FindControl("lblVoltage");
                    CheckBox checkBox = (CheckBox)e.Row.FindControl("CheckBox1");

                    if (lblVoltage != null && checkBox != null)
                    {
                        int rowVoltage = Convert.ToInt32(lblVoltage.Text);

                        if (rowVoltage >= Voltage)
                        {
                            checkBox.Enabled = true;
                        }
                        else
                        {
                            checkBox.Enabled = false;
                        }
                    }
                }
            }
            catch (Exception ex) { }
        }
        protected void ddlAnyWork_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlAnyWork.SelectedValue == "Yes")
                {
                    hiddenfield.Visible = true;
                    hiddenfield1.Visible = true;
                }
                else
                {
                    hiddenfield.Visible = false;
                    hiddenfield1.Visible = false;
                }
            }
            catch 
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured');", true);
            }
        }
        //protected void GetassigneddatatoContractor()
        //{
        //    try
        //    {
        //        string ID = string.Empty;
        //        ID = Session["id"].ToString();
        //        DataTable ds = new DataTable();
        //        ds = CEI.GetStaffAssignedToContractor(ID);
        //        if (ds.Rows.Count > 0)
        //        {
        //            foreach (DataRow row in ds.Rows)
        //            {
        //                string SupervisorREID = row["StaffAssined"].ToString();
        //                SelectedSupervisor.Add(SupervisorREID);
        //            }
        //        }
        //        else
        //        {
        //            //GridView1.DataSource = null;
        //            //GridView1.DataBind();
        //            //string script = "alert(\"No Record Found\");";
        //            //ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
        //        }
        //        ds.Dispose();
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //    }
        //}
        protected void ddlPremises_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlPremises.SelectedValue == "11")
                {
                    OtherPremises.Visible = true;
                }
                else
                {
                    OtherPremises.Visible = false;
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured');", true);
            }
        }
        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Reset();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            try
            {
                Session["id"] = "";
                Response.Redirect("PreviousProjects.aspx");
            }
            catch { }
        }
        protected void ddlWorkDetail_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Added By Aslam On 23 may 2025 to Rebind Premises 
            ddlLoadBindPremises();
            //
            ddlworktype.SelectedIndex = 0;
            DivOtherDepartment.Visible = false;
            DivPancard_TanNo.Visible = false;
            //ElectricalInstallation.Visible = true;
            //DivPoweUtility.Visible = false;
            //DivPoweUtilityWing.Visible = false;
            string Value = ddlWorkDetail.SelectedItem.ToString();
            if (ddlWorkDetail.SelectedValue != "0")
            {
                Installation.Visible = true;
                installationType1.Visible = true;
                if (string.IsNullOrEmpty(txtinstallationType1.Text))
                {
                    txtinstallationType1.Text = Value;
                }
                else if (txtinstallationType1.Text != string.Empty && string.IsNullOrEmpty(txtinstallationType2.Text))
                {
                    installationType2.Visible = true;
                    txtinstallationType2.Text = Value;
                }
                else if (string.IsNullOrEmpty(txtinstallationType3.Text))
                {
                    installationType3.Visible = true;
                    txtinstallationType3.Text = Value;
                }
                //else if (string.IsNullOrEmpty(txtinstallationType4.Text))
                //{
                //    installationType4.Visible = true;
                //    txtinstallationType4.Text = Value;
                //}
                //else if (string.IsNullOrEmpty(txtinstallationType5.Text))
                //{
                //    installationType5.Visible = true;
                //    txtinstallationType5.Text = Value;
                //}
                //else if (string.IsNullOrEmpty(txtinstallationType6.Text))
                //{
                //    installationType6.Visible = true;
                //    txtinstallationType6.Text = Value;
                //}
                //else if (string.IsNullOrEmpty(txtinstallationType7.Text))
                //{
                //    installationType7.Visible = true;
                //    txtinstallationType7.Text = Value;
                //}
                //else if (string.IsNullOrEmpty(txtinstallationType8.Text))
                //{
                //    installationType8.Visible = true;
                //    txtinstallationType8.Text = Value;
                //}
                if (ddlWorkDetail.SelectedValue != "0")
                {
                    try
                    {
                        string selectedValue = ddlWorkDetail.SelectedValue;
                        ListItem itemToRemove = ddlWorkDetail.Items.FindByValue(selectedValue);
                        if (itemToRemove != null)
                        {
                            ddlWorkDetail.Items.Remove(itemToRemove);
                        }
                    }
                    catch (Exception)
                    {
                    }
                    ddlWorkDetail.SelectedValue = "0";
                }
            }
            if (ddlApplicantType.SelectedValue == "AT001")
            {
                //ElectricalInstallation.Visible = true;
                DivPancard_TanNo.Visible = true;
                txtTanNumber.Text = "";
                PowerUtility.Visible = false;
                NameUtility.Visible = false;
                Wing.Visible = false;
                ListItem checklistItem1 = ddlworktype.Items.FindByValue("1");
                if (checklistItem1 != null)
                {
                    checklistItem1.Enabled = true;
                }
            }
            else if (ddlApplicantType.SelectedValue == "AT002") //Power Utility
            {
                NameUtility.Visible = true;
                Wing.Visible = true;
                PowerUtility.Visible = true;
                //ElectricalInstallation.Visible= false;
                ddlPoweUtilityBind();
                //DivPoweUtilityWing.Visible = true;
                txtTanNumber.Text = "";
                txtPAN.Text = "";
                ListItem checklistItem1 = ddlworktype.Items.FindByValue("1");
                if (checklistItem1 != null)
                {
                    checklistItem1.Enabled = false;
                }

                foreach (ListItem item in ddlPremises.Items)
                {
                    if (item.Value == "4")
                    {
                        item.Attributes.Add("style", "display:none");
                        break;
                    }
                }
            }
            else if (ddlApplicantType.SelectedValue == "AT003") //Other Department/Organization
            {
                //ElectricalInstallation.Visible = true;
                PowerUtility.Visible = false;
                NameUtility.Visible = false;
                Wing.Visible = false;
                DivOtherDepartment.Visible = true;
                txtPAN.Text = "";
                ListItem checklistItem1 = ddlworktype.Items.FindByValue("1");
                if (checklistItem1 != null)
                {
                    checklistItem1.Enabled = false;
                }
            }
            ddlPoweUtility.SelectedValue = "0";
            DdlWing.SelectedValue = "0";
            DdlZone.SelectedValue = "0";
            DdlCircle.SelectedValue = "0";
            DdlDivision.SelectedValue = "0";
            DdlSubDivision.SelectedValue = "0";
            ddlworktype.SelectedValue = "0";
            txtagency.Text = "";
            txtName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            ddlworktype.Enabled = true;
            txtagency.ReadOnly = false;
            txtName.ReadOnly = false;
            txtPhone.ReadOnly = false;
            txtEmail.ReadOnly = false;
            //Added By Aslam 22 apl 2025 to Remove industry if private and individual selection is done In Powerutility also remove
            HideIndustry_PremisesOption();
        }
        private void ddlPoweUtilityBind()
        {
            try
            {
                DataSet dsUtility = new DataSet();
                dsUtility = CEI.GetUtilityName();
                ddlPoweUtility.DataSource = dsUtility;
                ddlPoweUtility.DataTextField = "UtilityName";
                ddlPoweUtility.DataValueField = "Id";
                ddlPoweUtility.DataBind();
                ddlPoweUtility.Items.Insert(0, new ListItem("Select", "0"));
                dsUtility.Clear();
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured in Power Utility binding.');", true);
            }
        }
        private void DdlWingBind()
        {
            try
            {
                string UtilityId = ddlPoweUtility.SelectedValue.ToString();
                DataSet dsWing = new DataSet();
                dsWing = CEI.GetWingName(UtilityId);
                DdlWing.DataSource = dsWing;
                DdlWing.DataTextField = "WingName";
                DdlWing.DataValueField = "Id";
                DdlWing.DataBind();
                DdlWing.Items.Insert(0, new ListItem("Select", "0"));
                dsWing.Clear();
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured in Wing binding.');", true);
            }
        }
        private void DdlZoneBind()
        {
            try
            {
                string UtilityId = ddlPoweUtility.SelectedValue.ToString();
                string WingId = DdlWing.SelectedValue.ToString();
                DataSet dsZone = new DataSet();
                dsZone = CEI.GetZoneName(UtilityId, WingId);
                DdlZone.DataSource = dsZone;
                DdlZone.DataTextField = "ZoneName";
                DdlZone.DataValueField = "Id";
                DdlZone.DataBind();
                DdlZone.Items.Insert(0, new ListItem("Select", "0"));
                dsZone.Clear();
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured in Zone binding.');", true);
            }
        }
        private void DdlCircleBind()
        {
            try
            {
                string UtilityId = ddlPoweUtility.SelectedValue.ToString();
                string WingId = DdlWing.SelectedValue.ToString();
                string ZoneId = DdlZone.SelectedValue.ToString();
                DataSet dsCircle = new DataSet();
                dsCircle = CEI.GetCirclesName(UtilityId, WingId, ZoneId);
                DdlCircle.DataSource = dsCircle;
                DdlCircle.DataTextField = "CircleName";
                DdlCircle.DataValueField = "Id";
                DdlCircle.DataBind();
                DdlCircle.Items.Insert(0, new ListItem("Select", "0"));
                dsCircle.Clear();
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured in Circle binding.');", true);
            }
        }
        private void DdlDivisionBind()
        {
            try
            {
                string UtilityId = ddlPoweUtility.SelectedValue.ToString();
                string WingId = DdlWing.SelectedValue.ToString();
                string ZoneId = DdlZone.SelectedValue.ToString();
                string CircleId = DdlCircle.SelectedValue.ToString();

                DataSet dsDivision = new DataSet();
                dsDivision = CEI.GetDivisionName(UtilityId, WingId, ZoneId, CircleId);
                DdlDivision.DataSource = dsDivision;
                DdlDivision.DataTextField = "DivisionName";
                DdlDivision.DataValueField = "Id";
                DdlDivision.DataBind();
                DdlDivision.Items.Insert(0, new ListItem("Select", "0"));
                dsDivision.Clear();
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured in Division binding.');", true);
            }
        }
        private void DdlSubDivisionBind()
        {
            try
            {
                string UtilityId = ddlPoweUtility.SelectedValue.ToString();
                string WingId = DdlWing.SelectedValue.ToString();
                string ZoneId = DdlZone.SelectedValue.ToString();
                string CircleId = DdlCircle.SelectedValue.ToString();

                string DivisionId = DdlDivision.SelectedValue.ToString();
                DataSet dsSubDivision = new DataSet();
                dsSubDivision = CEI.GetSubDivisionName(UtilityId, WingId, ZoneId, CircleId, DivisionId);
                DdlSubDivision.DataSource = dsSubDivision;
                DdlSubDivision.DataTextField = "SubDivision";
                DdlSubDivision.DataValueField = "Id";
                DdlSubDivision.DataBind();
                DdlSubDivision.Items.Insert(0, new ListItem("Select", "0"));
                if (DdlSubDivision.Items.Count <= 1)
                {
                    // btnSubmit.Enabled = false;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please map the SubDivision.');", true);
                    return;
                }
                dsSubDivision.Clear();
            }
            catch (Exception ex)
            {
                //string errorMessage = "An error occurred: " + ex.Message;
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + errorMessage.Replace("'", "\\'") + "');", true);
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An Error Occured in Power Utility binding.');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An Error Occurred in SubDivision binding.');", true);
            }
        }
        protected void imgDelete1_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (installationType2.Visible == false && installationType3.Visible == false)
                {
                    string script = "alert(\"You can't delete all rows.\");";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
                else
                {
                    string valueToAddBack = txtinstallationType1.Text;
                    if (ddlWorkDetail.Items.FindByValue(valueToAddBack) == null)
                    {
                        ListItem newItem = new ListItem(valueToAddBack, valueToAddBack);
                        ddlWorkDetail.Items.Add(newItem);
                    }
                    installationType1.Visible = false;
                    txtinstallationType1.Text = string.Empty;
                    txtinstallationNo1.Text = string.Empty;
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An Error Occurred.');", true);
            }
        }
        protected void imgDelete2_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (installationType1.Visible == false && installationType3.Visible == false)
                {
                    string script = "alert(\"You can't delete all rows.\");";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
                else
                {
                    string valueToAddBack = txtinstallationType2.Text;
                    if (ddlWorkDetail.Items.FindByValue(valueToAddBack) == null)
                    {
                        ListItem newItem = new ListItem(valueToAddBack, valueToAddBack);
                        ddlWorkDetail.Items.Add(newItem);
                    }
                    installationType2.Visible = false;
                    txtinstallationType2.Text = string.Empty;
                    txtinstallationNo2.Text = string.Empty;
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An Error Occurred.');", true);
            }
        }
        protected void imgDelete3_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (installationType1.Visible == false && installationType2.Visible == false)
                {
                    string script = "alert(\"You can't delete all rows.\");";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
                else
                {
                    string valueToAddBack = txtinstallationType3.Text;
                    if (ddlWorkDetail.Items.FindByValue(valueToAddBack) == null)
                    {
                        ListItem newItem = new ListItem(valueToAddBack, valueToAddBack);
                        ddlWorkDetail.Items.Add(newItem);
                    }
                    installationType3.Visible = false;
                    txtinstallationType3.Text = string.Empty;
                    txtinstallationNo3.Text = string.Empty;
                }
            }
            catch { ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An Error Occurred.');", true); }
        }
        protected void ddlVoltageLevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToString(Session["ContractorID"]) != null && Convert.ToString(Session["ContractorID"]) != "")
                {
                    string ContID = Convert.ToString(Session["ContractorID"]);

                    installationType2.Visible = true;
                    if (ddlVoltageLevel.SelectedValue == "upto 650 V")
                    {
                        installationType2.Visible = false;
                    }
                    else
                    {
                        installationType2.Visible = true;
                    }
                    GetGridData(ContID);
                }
                else
                {
                    Session["ContractorID"] = "";
                    Response.Redirect("/SiteOwnerLogout.aspx", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An Error Occurred.');", true);
            }
        }
        protected void txtTanNumber_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //Added by aslam On 23 may 2025 to Rebind Premises 
                ddlLoadBindPremises();
                //
                string TANNumber = txtTanNumber.Text.Trim();
                //System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex("[A-Za-z]{4}[0-9]{5}[A-Za-z]{1}");
                System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex("^[A-Za-z]{4}[0-9]{5}[A-Za-z]{1}$|^[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}$");
                if (!regex.IsMatch(TANNumber))
                {
                    txtTanNumber.Focus();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('Invalid PAN/TAN Number format. Please enter a valid pAN/TAN number.');", true);
                    txtTanNumber.Text = "";
                    return;
                }
                DataSet ds = new DataSet();
                ds = CEI.GetDetailsByPanNumberId(TANNumber);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string ContractNameAgeny = ds.Tables[0].Rows[0]["username"].ToString();
                    string contractorType = ds.Tables[0].Rows[0]["ContractorType"].ToString();
                    ddlworktype.SelectedIndex = ddlworktype.Items.IndexOf(ddlworktype.Items.FindByText(contractorType));
                    ddlworktype.Enabled = false;
                    txtPhone.Text = ds.Tables[0].Rows[0]["Contact"].ToString();
                    txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    if (contractorType == "Firm/Company")
                    {
                        agency.Visible = true;
                        individual.Visible = false;
                        txtagency.Text = ContractNameAgeny; // ds.Tables[0].Rows[0]["NameOfAgency"].ToString();
                        txtagency.ReadOnly = true;

                    }
                    else if (contractorType == "Individual Person")
                    {
                        txtName.Text = ContractNameAgeny; //ds.Tables[0].Rows[0]["NameOfOwner"].ToString();
                        txtName.ReadOnly = true;

                    }
                }
                else
                {
                    ddlworktype.SelectedValue = "0";
                    ddlworktype.Enabled = true;
                    txtagency.ReadOnly = false;
                    txtName.ReadOnly = false;
                    txtagency.Text = "";
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtPhone.Text = "";
                    // Page.ClientScript.RegisterStartupScript(GetType(), "panNotFound", "alert('PAN card not found in the database.');", true);
                }

            }
            catch (Exception ex)
            {
                // Log the exception or provide a more detailed error message
                Page.ClientScript.RegisterStartupScript(GetType(), "error", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        protected void ddlPoweUtility_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlWingBind();
        }


        protected void DdlWing_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlZoneBind();
        }

        protected void DdlZone_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlCircleBind();

        }

        protected void DdlCircle_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlDivisionBind();
        }

        protected void DdlDivision_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlSubDivisionBind();
        }

        protected void DdlSubDivision_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = DdlSubDivision.SelectedValue.ToString();
            DataSet ds = new DataSet();
            ds = CEI.GetSubDivisionEmail(id);
            txtPhone.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            txtUserId.Text = ds.Tables[0].Rows[0]["UserId"].ToString();
            if (individual.Visible == true)
            {
                txtName.Text = ds.Tables[0].Rows[0]["SubDivision"].ToString();
                txtName.Text = ds.Tables[0].Rows[0]["SubDivision"].ToString();
                txtName.Enabled = false;
            }
            else
            {
                txtagency.Text = ds.Tables[0].Rows[0]["SubDivision"].ToString();
                txtagency.Enabled = false;
            }

        }

        protected bool CheckBlankInstallation()
        {
            string VoltLevel = ddlVoltageLevel.SelectedItem.ToString();
            if (VoltLevel == "Upto 650")
            {
                if (installationType1.Visible == true)
                {
                    if (txtinstallationNo1.Text != "" && txtinstallationNo1.Text != "0")
                    {
                        if (installationType3.Visible == true)
                        {
                            if (txtinstallationNo3.Text != "" && txtinstallationNo3.Text != "0")
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
                        }
                        else
                        {
                            return true;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    if (installationType3.Visible == true)
                    {
                        if (txtinstallationNo3.Text != "" && txtinstallationNo3.Text != "0")
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            else
            {
                if (installationType1.Visible == true)
                {
                    if (txtinstallationNo1.Text != "" && txtinstallationNo1.Text != "0")
                    {
                        if (installationType2.Visible == true)
                        {
                            if (txtinstallationNo2.Text != "" && txtinstallationNo2.Text != "0")
                            {
                                if (installationType3.Visible == true)
                                {
                                    if (txtinstallationNo3.Text != "" && txtinstallationNo3.Text != "0")
                                    {
                                        return true;
                                    }
                                    else
                                    {
                                        return false;
                                    }
                                }
                                else
                                {
                                    return true;
                                }
                            }
                            else
                            {
                                return false;
                            }
                        }
                        else
                        {
                            if (installationType3.Visible == true)
                            {
                                if (txtinstallationNo3.Text != "" && txtinstallationNo3.Text != "0")
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
                            else
                            {
                                return true;
                            }
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    if (installationType2.Visible == true)
                    {
                        if (txtinstallationNo2.Text != "" && txtinstallationNo2.Text != "0")
                        {
                            if (installationType3.Visible == true)
                            {
                                if (txtinstallationNo3.Text != "" && txtinstallationNo3.Text != "0")
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
                            else
                            {
                                return true;
                            }
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        if (installationType3.Visible == true)
                        {
                            if (txtinstallationNo3.Text != "" && txtinstallationNo3.Text != "0")
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString))
            {
                SqlTransaction transaction = null;
                try
                {
                    connection.Open();
                    string Pan_TanNumber = "";
                    bool panExists = false;
                    //string UserId = "";

                    Debug.WriteLine("Before checking visibility and setting Pan_TanNumber");
                    if (DivPancard_TanNo.Visible || DivOtherDepartment.Visible)
                    {
                        if (DivPancard_TanNo.Visible && !string.IsNullOrEmpty(txtPAN.Text.Trim()))
                        {
                            Pan_TanNumber = txtPAN.Text.Trim();

                        }
                        else if (DivOtherDepartment.Visible && !string.IsNullOrEmpty(txtTanNumber.Text.Trim()))
                        {
                            Pan_TanNumber = txtTanNumber.Text.Trim();

                        }

                        if (string.IsNullOrEmpty(Pan_TanNumber))
                        {
                            throw new Exception("Pan/Tan Number cannot be empty.");
                        }

                        DataSet ds1 = CEI.checkPanNumber(Pan_TanNumber);
                        if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                        {
                            panExists = true;
                        }

                    }
                    else if (PowerUtility.Visible)
                    {
                        string id = DdlSubDivision.SelectedValue.ToString();
                        if (id != "0")
                        {
                            DataSet ds = new DataSet();
                            ds = CEI.GetSubDivisionEmail(id);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Pan_TanNumber = ds.Tables[0].Rows[0]["UserId"].ToString();
                            }
                            else
                            {
                                Response.Write("<script>alert('SubDivision not mapped, please contact to helpdesk.');</script>");
                                return;
                            }
                            ds.Dispose();
                        }
                        else
                        {
                            Response.Write("<script>alert('SubDivision can't be blank..');</script>");
                            return;
                        }
                    }

                    transaction = connection.BeginTransaction();

                    string UpdationId = Session["UpdationId"] != null ? Session["UpdationId"].ToString() : null;

                    bool atLeastOneSupervisorChecked = false;
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                        CheckBox chk = row.FindControl("CheckBox1") as CheckBox;
                        if (chk != null && chk.Checked)
                        {
                            atLeastOneSupervisorChecked = true;
                            break;
                        }
                    }

                    if (!atLeastOneSupervisorChecked && btnSubmit.Text != "Update")
                    {
                        Response.Write("<script>alert('Please select at least one Supervisor.');</script>");
                        return;
                    }

                    if (Session["ContractorID"] == null)
                    {
                        Response.Redirect("/ContractorLogout.aspx", false);
                        return;
                    }

                    ContractorID = Session["ContractorID"].ToString();
                    string filePathInfo = "";

                    if (ddlAnyWork.SelectedValue == "Yes")
                    {
                        if (customFile.HasFile && customFile.PostedFile != null && customFile.PostedFile.ContentLength <= 1048576)
                        {
                            try
                            {
                                string FilName = Path.GetFileName(customFile.PostedFile.FileName);
                                string directoryPath = Server.MapPath("~/Attachment/" + ContractorID + "/Copy of Work Order/");
                                if (!Directory.Exists(directoryPath))
                                {
                                    Directory.CreateDirectory(directoryPath);
                                }

                                //string ext = Path.GetExtension(customFile.FileName);
                                string ext = ".pdf";
                                string fileName = "Copy of Work Order" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + ext;
                                string filePathInfo2 = Path.Combine(directoryPath, fileName);
                                customFile.SaveAs(filePathInfo2);
                                filePathInfo = "~/Attachment/" + ContractorID + "/Copy of Work Order/" + fileName;
                            }
                            catch (Exception ex)
                            {
                                throw new Exception("Please Upload Pdf Files 1 Mb Only");
                            }
                        }
                        else
                        {
                            throw new Exception("Please Upload Pdf Files 1 Mb Only");
                        }
                    }

                    if (ddlApplicantType.SelectedValue == "0" || string.IsNullOrEmpty(ddlApplicantType.SelectedValue))
                    {
                        Response.Write("<script>alert('Please select Applicant Type');</script>");
                        return;
                    }

                    hdnId.Value = ContractorID;

                    // Check for null and empty values before calling IntimationDataInsertion
                    //Debug.WriteLine("Before IntimationDataInsertion");
                    //Debug.WriteLine($"ContractorID: {ContractorID}, ApplicantTypeCode: {ddlApplicantType.SelectedValue}, PowerUtility: {ddlPoweUtility.SelectedItem?.ToString()}");

                    CEI.IntimationDataInsertion(
                       UpdationId,
                       ContractorID,
                       ddlApplicantType.SelectedValue,
                       ddlPoweUtility.SelectedItem?.ToString(),
                       DdlWing.SelectedItem?.ToString(),
                       DdlZone.SelectedItem?.ToString(),
                       DdlCircle.SelectedItem?.ToString(),
                       DdlDivision.SelectedItem?.ToString(),
                       DdlSubDivision.SelectedItem?.ToString(),
                       ddlworktype.SelectedItem?.ToString(),
                       txtName.Text,
                       txtagency.Text,
                       txtPhone.Text,
                       txtAddress.Text,
                       ddlDistrict.SelectedItem?.ToString(),
                       txtPin.Text,
                       ddlPremises.SelectedItem?.ToString(),
                       txtOtherPremises.Text,
                       ddlVoltageLevel.SelectedValue?.ToString(),
                       Pan_TanNumber,
                       txtinstallationType1.Text,
                       txtinstallationNo1.Text,
                       txtinstallationType2.Text,
                       txtinstallationNo2.Text,
                       txtinstallationType3.Text,
                       txtinstallationNo3.Text,
                       txtEmail.Text,
                       txtStartDate.Text,
                       txtCompletitionDate.Text,
                       ddlAnyWork.SelectedItem?.ToString(),
                       filePathInfo,
                       txtCompletionDateAPWO.Text,
                       ddlApplicantType.SelectedItem?.ToString(),
                       ContractorID,
                       RadioButtonList2.SelectedValue.ToString(),
                       ddlInspectionType.SelectedValue.ToString(),
                       txtCapacity.Text.Trim(),
                       //UserId,
                       transaction);


                    TypeOfInspection = ddlInspectionType.SelectedValue.ToString();
                    //Debug.WriteLine("After IntimationDataInsertion");

                    string projectId = CEI.projectId();
                    if (!string.IsNullOrEmpty(projectId))
                    {
                        foreach (GridViewRow row in GridView1.Rows)
                        {
                            if ((row.FindControl("CheckBox1") as CheckBox)?.Checked == true)
                            {
                                string Reid = (row.FindControl("lblREID") as Label)?.Text;
                                CEI.SetDataInStaffAssined(Reid, projectId, ContractorID, transaction);
                            }
                        }

                        TextBox[] typeTextBoxes = { txtinstallationType1, txtinstallationType2, txtinstallationType3 };
                        TextBox[] noTextBoxes = { txtinstallationNo1, txtinstallationNo2, txtinstallationNo3 };

                        for (int i = 0; i < typeTextBoxes.Length; i++)
                        {
                            string installationType = typeTextBoxes[i].Text;
                            string installationNoText = noTextBoxes[i].Text;

                            if (int.TryParse(installationNoText, out int installationNo) && installationNo > 0)
                            {
                                for (int j = 0; j < installationNo; j++)
                                {
                                    CEI.AddInstallations(projectId, installationType, installationNo, ContractorID, TypeOfInspection, transaction);
                                }
                            }
                        }

                        if (ddlPremises.SelectedItem.Text != "Industry" && PowerUtility.Visible != true)
                        {
                            if (!panExists)
                            {
                                CEI.SiteOwnerCredentials(txtEmail.Text, Pan_TanNumber);
                            }
                        }
                    }

                    transaction.Commit();
                    Reset();

                    if (btnSubmit.Text.Trim() == "Submit")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertWithRedirectdata();", true);
                        btnSubmit.Enabled = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertWithRedirectUpdation();", true);
                    }
                }
                catch (Exception ex)
                {
                    transaction?.Rollback();
                    string errorMessage = ex.Message.Replace("'", "\\'");
                    ScriptManager.RegisterStartupScript(this, GetType(), "erroralert", $"alert('{errorMessage}')", true);
                }
                finally
                {
                    transaction?.Dispose();
                    connection.Close();
                }
            }
        }
        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selected = ddlDistrict.SelectedItem.Text.ToLower();
            if (selected.Contains("gurugram-i") || selected.Contains("gurugram-ii"))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopup",
                    "setTimeout(function() { document.getElementById('gurugramModal').style.display = 'block'; }, 100);", true);
            }
        }
    }
}