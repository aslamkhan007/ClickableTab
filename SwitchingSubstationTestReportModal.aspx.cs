using CEI_PRoject;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static iText.StyledXmlParser.Jsoup.Select.Evaluator;

namespace CEIHaryana.TestReportModal
{
    public partial class SwitchingSubstationTestReportModal : System.Web.UI.Page
    {
        CEI CEI = new CEI();
        string TestReportId;
        string id = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    TestReportId = Session["SwitchingSubstationId"].ToString();
                    Session["TestReportIds"] = TestReportId;
                    GetSwitchingDetailswithId(TestReportId);
                    GetEarthingData(TestReportId);
                    //Session["SwitchingSubstationId"] = "";
                    if (Request.UrlReferrer != null)
                    {
                        Session["PreviousPage"] = Request.UrlReferrer.ToString();
                    }
                    if (Session["ContractorID"] != null && Convert.ToString(Session["ContractorID"]) != "")
                    {
                        Session["SubstationOtp"] = "0";
                        if (Convert.ToString(Session["Approval"]) == "Pending")
                        {
                            ToOTPVerify.Visible = true;
                        }
                        else
                        {
                            if (!string.IsNullOrEmpty(Request.QueryString["Return"]))
                            {
                            }
                            else
                            {    //Contractor.Visible = true;
                                FinalSubmit.Visible = true;
                                //CreatedDate.Visible = true;
                            }
                        }
                    }
                    else if (Session["SiteOwnerId"] != null && Session["SiteOwnerId"].ToString() != "")
                    {
                        SiteOwner.Visible = false;
                        SiteOwner2.Visible = true;
                        IntimationData.Visible = true;
                        ApprovalCard.Visible = true;
                    }
                    else if (Session["SupervisorID"] != null || Session["AdminID"] != null)

                    {

                        Supervisor.Visible = true;
                        IntimationData.Visible = true;

                    }
                    else if (Session["InspectionTestReportId"] != null && Session["InspectionTestReportId"].ToString() != "")
                    {
                     
                        SiteOwner.Visible = true;
                        IntimationData.Visible = true;
                        ApprovalCard.Visible = true;
                        btnNext.Text = "Back";

                    }
                    else if (Session["IntimationForHistoryId"] != null && Session["IntimationForHistoryId"].ToString() != "")
                    {
                     
                        IntimationForHistory.Visible = true;
                        IntimationData.Visible = true;
                    }

                }
            }
            catch
            {
            }

        }
        public void GetEarthingData(string id)
        {

            DataSet ds = new DataSet();
            ds = CEI.GetSwitchingEarthingData(id);
            if (ds.Tables[0].Rows.Count > 0 && ds != null)
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
        public void GetSwitchingDetailswithId(string id)
        {
            try
            {
                string value1 = Convert.ToString(Session["Approval"]);
                
                if (value1.Trim() == "Accept")
                {
                    BtnSubmit.Text = "Back";
                }
                else if (value1.Trim() == "Reject")
                {
                    BtnSubmit.Text = "Back";
                }
                if (value1.Trim() == "Submitted" || value1.Trim() == "Submit")
                {
                    ApprovalCard.Visible = true;
                    BtnSubmit.Text = "Back";
                }

                DataSet ds = new DataSet();
                ds = CEI.SwitchingTestReportData(id);
                lbltestReportId.Text = id;
                lblReportNo.Text = id;
                txtApplicantType.Text = ds.Tables[0].Rows[0]["ApplicantType"].ToString();
                txtInstallation.Text = ds.Tables[0].Rows[0]["ContractorType"].ToString();
                txtName.Text = ds.Tables[0].Rows[0]["NameOfOwner"].ToString();
                if (txtName.Text ==""|| txtName.Text == null) 
                {
                    txtName.Text = ds.Tables[0].Rows[0]["NameOfAgency"].ToString();
                }
                txtPhone.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                string dp_Id1 = ds.Tables[0].Rows[0]["Permises"].ToString();
                Session["Email"] = ds.Tables[0].Rows[0]["ContractorEmail"].ToString();
                Session["InspectionType"] = ds.Tables[0].Rows[0]["Inspectiontype"].ToString();
                TxtPremises.Text = dp_Id1;
                //string dp_Id2 = ds.Tables[0].Rows[0]["OtherPremises"].ToString();
                //string dp_Id3 = ds.Tables[0].Rows[0]["VoltageLevel"].ToString().Trim();
                string dp_Id3 = ds.Tables[0].Rows[0]["VoltageLevel"].ToString().Trim();
                txtVoltagelevel.Text ="Upto "+ dp_Id3;
                string dp_Id4 = ds.Tables[0].Rows[0]["WorkStartDate"].ToString();

                if (!string.IsNullOrWhiteSpace(dp_Id4))
                {
                    txtStartDate.Text = DateTime.Parse(dp_Id4).ToString("dd-MM-yyyy");

                }
                else
                {
                    txtStartDate.Text = string.Empty;
                }
                string dp_Id5 = ds.Tables[0].Rows[0]["CompletionDate"].ToString();
                //txtCompletitionDate.Text = DateTime.Parse(dp_Id5).ToString("dd-MM-yyyy");
                if (!string.IsNullOrWhiteSpace(dp_Id5))
                {
                    txtCompletitionDate.Text = DateTime.Parse(dp_Id5).ToString("dd-MM-yyyy");

                }
                else
                {
                    txtCompletitionDate.Text = string.Empty;
                }

                txtSerial.Text = ds.Tables[0].Rows[0]["SerialNoofSwitchingStation"].ToString();
                txtVoltage.Text = ds.Tables[0].Rows[0]["VoltageLevel"].ToString();
                txtSwitchingName.Text = ds.Tables[0].Rows[0]["NamePlaceofSwitchingStation"].ToString();
                txtBreakerType.Text = ds.Tables[0].Rows[0]["TypeofBreaker"].ToString();
                if (txtBreakerType.Text =="Other")
                {
                    Other.Visible= true;
                }
                txtOtherBreakerType.Text = ds.Tables[0].Rows[0]["OtherBreakerType"].ToString();
                txtTotalBreaker.Text = ds.Tables[0].Rows[0]["TotalNoofBreakers"].ToString();
                txtCapacity.Text = ds.Tables[0].Rows[0]["CapacityofStationTransformerInKva"].ToString();
                txtEarthing.Text = ds.Tables[0].Rows[0]["NumberofEarthing"].ToString();
                txtCreatedDate.Text = ds.Tables[0].Rows[0]["TestReportCretedDate"].ToString();
                txtSubmitteddate.Text = ds.Tables[0].Rows[0]["WorkIntimationCreatedDate"].ToString();
                lblIntimationId.Text = ds.Tables[0].Rows[0]["IntimationId"].ToString();
                lblWorkIntimationId.Text = ds.Tables[0].Rows[0]["IntimationId"].ToString();
                txtApprovedBy.Text = ds.Tables[0].Rows[0]["ContractorWhoCreated"].ToString();
                txtSubmittedBy.Text = ds.Tables[0].Rows[0]["ContractorWhoCreated"].ToString();
                txtTestReportDate.Text = ds.Tables[0].Rows[0]["WorkIntimationCreatedDate"].ToString();
                txtPreparedby.Text = ds.Tables[0].Rows[0]["SupervisorWhoCreated"].ToString();

            }
            catch
            {
            }
        }
        private void GetDocumentUploadData()
        {
            DataTable ds = new DataTable();
            ds = CEI.GetDocumentlistforSwitching();
            if (ds.Rows.Count > 0)
            {
                Grd_Document.DataSource = ds;
                Grd_Document.DataBind();
            }
            else
            {
                Grd_Document.DataSource = null;
                Grd_Document.DataBind();
                string script = "alert(\"No Record Found for document \");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "focusGridView", "focusOnGridView();", true);
            ds.Dispose();
        }

        protected void btnIntimationForHistoryBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/IntimationForHistory.aspx", false);
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (BtnSubmit.Text.Trim() == "Back")
                {
                    Response.Redirect("/Contractor/Approved_Test_Reports.aspx");
                }
                else
                {
                    string InspectionType = Session["InspectionType"].ToString();
                    string Filename = string.Empty;
                    string InstallationInvoice = string.Empty;
                    string ManufacturingReport = string.Empty;
                    string filePath = string.Empty;
                    string id = Session["IntimationId"].ToString();
                    string Counts = Session["Counts"].ToString();
                    string ContractorId = Session["ContractorID"].ToString();
                    string ContractorIdForDocument = Session["ContractorID"].ToString().Replace("/", " ");
                    string TestReportIds = Session["TestReportIds"].ToString();
                    //CEI.UpdateSubstationData(id, Counts, ddlType.SelectedItem.ToString(), txtRejection.Text);
                    if (InspectionType == "Existing")
                    {
                        CEI.InsertExistingInspectionData(lbltestReportId.Text, lblIntimationId.Text, txtTestReportCount.Text, txtApplicantType.Text, "Substation Transformer", txtVoltagelevel.Text.Trim(),
                           txtDistrict.Text, txtDivision.Text, TxtPremises.Text, ContractorId);

                    }
                    if (Session["InspectionType"] != null && Session["InspectionType"].ToString() != "Existing")
                    {
                        bool isValid = true;
                        int rowIndex = 0; // Counter to track iteration

                        // Iterate through each row in the GridView
                        foreach (GridViewRow row in Grd_Document.Rows)
                        {
                            rowIndex++; // Increment row index for each iteration

                            // Find FileUpload control within the row
                            FileUpload fileUpload = (FileUpload)row.FindControl("FileUpload1");

                            // Ensure FileUpload control is not null and contains a file
                            if (fileUpload != null && fileUpload.HasFile)
                            {
                                // File size validation: file should be <= 1MB
                                if (fileUpload.PostedFile.ContentLength > 1048576)
                                {
                                    isValid = false;
                                    string script = "alert('File size must be less than or equal to 1MB.');";
                                    ScriptManager.RegisterStartupScript(this, GetType(), "FileSizeExceeded", script, true);
                                    break;
                                }

                                // File type validation: only PDFs are allowed
                                string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                                if (fileExtension != ".pdf")
                                {
                                    isValid = false;
                                    string script = "alert('Only PDF files are allowed.');";
                                    ScriptManager.RegisterStartupScript(this, GetType(), "InvalidFileType", script, true);
                                    break;
                                }

                                // Save the file based on the row index
                                string filename = Path.GetFileName(fileUpload.FileName);
                                string folderPath = string.Empty;
                                string fullFilePath = string.Empty;

                                if (rowIndex == 1)
                                {
                                    // Save to ManufacturingReport in second iteration
                                    string ManufacturingReportFileName = "ManufacturingReport_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + ".pdf";
                                    folderPath = Server.MapPath("~/Attachment/" + "Contractor" + "/"+ ContractorIdForDocument + "/" + "SwitchingSubstation" + "/" + TestReportIds + "/ManufacturingReport/");
                                    if (!Directory.Exists(folderPath))
                                    {
                                        Directory.CreateDirectory(folderPath);
                                    }
                                    fullFilePath = Path.Combine(folderPath, ManufacturingReportFileName);
                                    fileUpload.SaveAs(fullFilePath);
                                    ManufacturingReport = "/Attachment/" + "Contractor" + "/" + ContractorIdForDocument + "/" + "SwitchingSubstation" + "/" + TestReportIds + "/ManufacturingReport/" + ManufacturingReportFileName;
                                }
                            }
                            else
                            {
                                isValid = false;
                                // Show error message if the file is missing
                                string script = "alert('Please upload the required document.');";
                                ScriptManager.RegisterStartupScript(this, GetType(), "FileUploadMissing", script, true);
                                break; // Exit the loop if validation fails
                            }
                        }
                        if (isValid && rowIndex == 1) // Ensure two files have been uploaded
                        {
                            CEI.UpdateSwitchingData(id, Counts, ManufacturingReport);
                            Session["InspectionType"] = "";
                            string script = "alert('Test Report Approved Successfully'); window.location='/Contractor/Approved_Test_Reports.aspx';";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
                        }
                    }
                    else
                    {
                        CEI.UpdateSwitchingifExisting(id, Counts);
                        string script = "alert('Test Report Approved  Successfully'); window.location='/Contractor/Approved_Test_Reports.aspx';";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
                    }
                }
            }
            catch (Exception ex)
            {
                // You can log the error or show a more specific message if necessary
                string script = $"alert('An error occurred: {ex.Message}');";
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", script, true);
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (Session["AdminID"] != null)
            {
                string previousPageUrl = Session["PreviousPage"] as string;
                if (!string.IsNullOrEmpty(previousPageUrl))
                {

                    Response.Redirect(previousPageUrl, false);
                    Session["PreviousPage"] = null;
                    //return;
                    //Response.Redirect("/Admin/TestReportHistoryFromSupervisor.aspx");
                }
            }
            else
            {
                id = Session["SubStationID"].ToString();
                Response.Redirect("/Supervisor/TestReportHistory.aspx");
            }
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (btnNext.Text.Trim() == "Back")
            {
                if (Session["PreviousPage"] != null)
                {
                    string previousPageUrl = Session["PreviousPage"].ToString();
                    Response.Redirect(previousPageUrl, false);
                    Session["PreviousInspPage"] = null;
                }
                else
                {
                    Response.Redirect("/Officers/Inspection.aspx", false);
                }
            }
            else
            {
                id = Session["SubStationID"].ToString();
                Response.Redirect("/SiteOwnerPages/CreateInspectionReport.aspx", false);
            }
        }
        protected void BtnVerify_Click(object sender, EventArgs e)
        {
            try
            {
                OTP.Visible = true;
                btnVerify.Text = "Verify";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "focusOTP", "document.getElementById('" + txtOtp.ClientID + "').focus();", true);
                Session["SubstationOtp"] = Convert.ToString(Convert.ToInt32(Session["SubstationOtp"]) + 1);
                //OTP.Visible = true;
                if (Session["SubstationOtp"].ToString() == "1")
                {
                    string Email = Session["Email"].ToString().Trim();
                    if (Email.Trim() == "")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alertWithRedirectdata();", true);
                    }
                    else
                    {
                        if (Session["Email"].ToString().Trim() != "OTPSEND")
                        {

                            Session["OTP"] = CEI.ValidateOTPthroughEmail(Email);
                            Session["Email"] = "OTPSEND";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('OTP has been Sent to your registered email Id');", true);

                        }
                    }
                }
                else
                {
                    if (txtOtp.Text != "")
                    {
                        if (Session["OTP"].ToString().Trim() == txtOtp.Text.Trim())
                        {
                            FinalSubmit.Visible = true;
                            ToOTPVerify.Visible = false;

                            //Session["InspectionType"]
                            //GetDocumentUploadData();
                            if (Session["InspectionType"] != null && Session["InspectionType"].ToString() != "Existing")
                            {
                                GetDocumentUploadData();
                                Session["SubstationOtp"] = null;
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "focusGridView", "focusOnGridView();", true);
                            }

                            //Contractor3.Visible = false;
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('Incorrect OTP. Please try again.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('An Error Occured Please try again later')", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alertWithRedirectdata();", true);
            }
        }

        protected void btnBack2_Click(object sender, EventArgs e)
        {

            // Response.Redirect("/SiteOwnerPages/GenerateInspection.aspx", false);
            try
            {
                string previousPageUrl = Session["PreviousPage"] as string;
                if (!string.IsNullOrEmpty(previousPageUrl))
                {

                    Response.Redirect(previousPageUrl, false);
                    Session["PreviousPage"] = null;

                }
            }
            catch { }
        }
    }
}