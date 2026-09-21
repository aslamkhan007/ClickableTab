using CEI_PRoject;

using CEIHaryana.Model.Common.Method;
using Newtonsoft.Json;
using System;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    SwitchingSubstationComponent obj = GetSwitchingData();
                    if (obj == null || string.IsNullOrWhiteSpace(obj.TestReportId))
                    {
                        Response.Redirect("/Supervisor/InstallationDetails.aspx");
                        return;
                    }

                    ViewState["SwitchingData"] = obj;
                    TestReportId = obj.TestReportId;

                    GetSwitchingDetailswithId(TestReportId);
                    GetEarthingData(TestReportId);

                    if (Request.UrlReferrer != null)
                    {
                        Session["PreviousPage"] = Request.UrlReferrer.ToString();
                    }
                    if (Session["ContractorID"] != null && Convert.ToString(Session["ContractorID"]) != "")
                    {
                        ViewState["SubstationOtp"] = "0";
                        if (obj.Approval == "Pending")
                        {
                            ToOTPVerify.Visible = true;
                        }
                        else
                        {
                            if (!string.IsNullOrEmpty(Request.QueryString["Return"]))
                            {
                            }
                            else
                            {
                                FinalSubmit.Visible = true;
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
                string value1 = SwitchingData != null ? Convert.ToString(SwitchingData.Approval) : string.Empty;

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
                if (txtName.Text == "" || txtName.Text == null)
                {
                    txtName.Text = ds.Tables[0].Rows[0]["NameOfAgency"].ToString();
                }
                txtPhone.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                string dp_Id1 = ds.Tables[0].Rows[0]["Permises"].ToString();
                ViewState["Email"] = ds.Tables[0].Rows[0]["ContractorEmail"].ToString();
                ViewState["InspectionType"] = ds.Tables[0].Rows[0]["Inspectiontype"].ToString();
                TxtPremises.Text = dp_Id1;
                string dp_Id3 = ds.Tables[0].Rows[0]["VoltageLevel"].ToString().Trim();
                txtVoltagelevel.Text = "Upto " + dp_Id3;
                string dp_Id4 = ds.Tables[0].Rows[0]["WorkStartDate"].ToString();

                if (!string.IsNullOrWhiteSpace(dp_Id4))
                    txtStartDate.Text = DateTime.Parse(dp_Id4).ToString("dd-MM-yyyy");
                else
                    txtStartDate.Text = string.Empty;

                string dp_Id5 = ds.Tables[0].Rows[0]["CompletionDate"].ToString();
                if (!string.IsNullOrWhiteSpace(dp_Id5))
                    txtCompletitionDate.Text = DateTime.Parse(dp_Id5).ToString("dd-MM-yyyy");
                else
                    txtCompletitionDate.Text = string.Empty;

                txtSerial.Text = ds.Tables[0].Rows[0]["SerialNoofSwitchingStation"].ToString();
                txtVoltage.Text = ds.Tables[0].Rows[0]["VoltageLevel"].ToString();
                txtSwitchingName.Text = ds.Tables[0].Rows[0]["NamePlaceofSwitchingStation"].ToString();
                txtBreakerType.Text = ds.Tables[0].Rows[0]["TypeofBreaker"].ToString();
                if (txtBreakerType.Text == "Other")
                {
                    Other.Visible = true;
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
                txtTestReportCount.Text = ds.Tables[0].Rows[0]["Count"].ToString();
                txtDistrict.Text = ds.Tables[0].Rows[0]["District"].ToString();
                txtDivision.Text = ds.Tables[0].Rows[0]["Area"].ToString();
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
                    string InspectionType = ViewState["InspectionType"] != null ? ViewState["InspectionType"].ToString() : string.Empty;
                    string ManufacturingReport = string.Empty;
                    string id = lblIntimationId.Text.Trim();
                    string Counts = SwitchingData != null ? SwitchingData.Counts : string.Empty;
                    string ContractorId = Session["ContractorID"].ToString();
                    string ContractorIdForDocument = Session["ContractorID"].ToString().Replace("/", " ");
                    string TestReportIds = SwitchingData != null ? SwitchingData.TestReportId : TestReportId;

                    if (InspectionType == "Existing")
                    {
                        CEI.InsertExistingInspectionData(lbltestReportId.Text, lblIntimationId.Text, txtTestReportCount.Text, txtApplicantType.Text, "Switching Station", txtVoltagelevel.Text.Trim(),
                           txtDistrict.Text, txtDivision.Text, TxtPremises.Text, ContractorId);
                    }
                    if (InspectionType != "Existing")
                    {
                        bool isValid = true;
                        int rowIndex = 0;

                        foreach (GridViewRow row in Grd_Document.Rows)
                        {
                            rowIndex++;
                            FileUpload fileUpload = (FileUpload)row.FindControl("FileUpload1");

                            if (fileUpload != null && fileUpload.HasFile)
                            {
                                if (fileUpload.PostedFile.ContentLength > 1048576)
                                {
                                    isValid = false;
                                    ScriptManager.RegisterStartupScript(this, GetType(), "FileSizeExceeded", "alert('File size must be less than or equal to 1MB.');", true);
                                    break;
                                }

                                string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                                if (fileExtension != ".pdf")
                                {
                                    isValid = false;
                                    ScriptManager.RegisterStartupScript(this, GetType(), "InvalidFileType", "alert('Only PDF files are allowed.');", true);
                                    break;
                                }

                                if (rowIndex == 1)
                                {
                                    string ManufacturingReportFileName = "ManufacturingReport_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + ".pdf";
                                    string folderPath = Server.MapPath("~/Attachment/Contractor/" + ContractorIdForDocument + "/SwitchingSubstation/" + TestReportIds + "/ManufacturingReport/");
                                    if (!Directory.Exists(folderPath))
                                        Directory.CreateDirectory(folderPath);

                                    string fullFilePath = Path.Combine(folderPath, ManufacturingReportFileName);
                                    fileUpload.SaveAs(fullFilePath);
                                    ManufacturingReport = "/Attachment/Contractor/" + ContractorIdForDocument + "/SwitchingSubstation/" + TestReportIds + "/ManufacturingReport/" + ManufacturingReportFileName;
                                }
                            }
                            else
                            {
                                isValid = false;
                                ScriptManager.RegisterStartupScript(this, GetType(), "FileUploadMissing", "alert('Please upload the required document.');", true);
                                break;
                            }
                        }
                        if (isValid && rowIndex == 1)
                        {
                            CEI.UpdateSwitchingData(id, Counts, ManufacturingReport);
                            ViewState["InspectionType"] = "";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                                "alert('Test Report Approved Successfully'); window.location='/Contractor/Approved_Test_Reports.aspx';", true);
                        }
                    }
                    else
                    {
                        CEI.UpdateSwitchingifExisting(id, Counts);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                            "alert('Test Report Approved  Successfully'); window.location='/Contractor/Approved_Test_Reports.aspx';", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Error", $"alert('An error occurred: {ex.Message}');", true);
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
                }
            }
            else
            {
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

                int otpAttempt = ViewState["SubstationOtp"] != null ? Convert.ToInt32(ViewState["SubstationOtp"]) : 0;
                otpAttempt++;
                ViewState["SubstationOtp"] = Convert.ToString(otpAttempt);

                if (ViewState["SubstationOtp"].ToString() == "1")
                {
                    string Email = ViewState["Email"] != null ? ViewState["Email"].ToString().Trim() : string.Empty;
                    if (Email.Trim() == "")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alertWithRedirectdata();", true);
                    }
                    else if (Email.Trim() != "OTPSEND")
                    {
                        ViewState["OTP"] = CEI.ValidateOTPthroughEmail(Email);
                        ViewState["Email"] = "OTPSEND";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('OTP has been Sent to your registered email Id');", true);
                    }
                }
                else
                {
                    if (txtOtp.Text != "")
                    {
                        if (ViewState["OTP"] != null && ViewState["OTP"].ToString().Trim() == txtOtp.Text.Trim())
                        {
                            FinalSubmit.Visible = true;
                            ToOTPVerify.Visible = false;

                            string InspectionType = ViewState["InspectionType"] != null ? ViewState["InspectionType"].ToString() : string.Empty;
                            if (InspectionType != "Existing")
                            {
                                GetDocumentUploadData();
                                ViewState["SubstationOtp"] = null;
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "focusGridView", "focusOnGridView();", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('Incorrect OTP. Please try again.');", true);
                        }
                    }
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alertWithRedirectdata();", true);
            }
        }

        protected void btnBack2_Click(object sender, EventArgs e)
        {
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
        private SwitchingSubstationComponent SwitchingData
        {
            get { return ViewState["SwitchingData"] as SwitchingSubstationComponent; }
        }

        private SwitchingSubstationComponent GetSwitchingData()
        {
            string token = Request.QueryString["d"];
            if (string.IsNullOrWhiteSpace(token)) return null;
            string json = EncryptedUrlPass.Decrypt(token);
            return JsonConvert.DeserializeObject<SwitchingSubstationComponent>(json);
        }
        public string PrintToken
        {
            get
            {
                SwitchingSubstationComponent obj = SwitchingData;

                if (obj == null || string.IsNullOrWhiteSpace(obj.TestReportId))
                    return string.Empty;

                string json = JsonConvert.SerializeObject(obj);
                return EncryptedUrlPass.Encrypt(json);
            }
        }

    }
}