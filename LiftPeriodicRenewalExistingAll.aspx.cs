using CEI_PRoject;
using CEIHaryana.Contractor;
using CEIHaryana.Officers;
using CEIHaryana.UserPages;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CEIHaryana.SiteOwnerPages
{
    public partial class LiftPeriodicRenewalExistingAll : System.Web.UI.Page
    {
        //Page Created By Neha 
        CEI CEI = new CEI();
        string RegNo = string.Empty, LoginToken = string.Empty;

        #region Properties

        // Logged-in user hamesha Session se (client hidden field pe bharosa nahi)
        private string CurrentUserId
        {
            get { return Convert.ToString(Session["SiteOwnerId"]); }
        }

        private bool IsReturnedApplication
        {
            get { return Convert.ToString(Session["ReturnedValue"]) == "1"; }
        }

        // Selected row ka type ("Lift"/"Escalator") aur registration no. (ViewState = signed, client edit nahi kar sakta)
        private string SelectedType
        {
            get { return Convert.ToString(ViewState["SelType"]); }
            set { ViewState["SelType"] = value; }
        }

        private string SelectedRegNo
        {
            get { return Convert.ToString(ViewState["SelRegNo"]); }
            set { ViewState["SelRegNo"] = value; }
        }

        #endregion

        #region On Page Init
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.Cache.SetNoStore();

            if (!string.IsNullOrEmpty(Convert.ToString(Session["SiteOwnerId"])) && !string.IsNullOrEmpty(Convert.ToString(Session["LoginToken"])))
            {
                RegNo = Session["SiteOwnerId"].ToString();
                LoginToken = Session["LoginToken"].ToString();
                string currentSessionId = Session.SessionID;

                string dbSessionId = CEI.GetSessionIdFromDB(RegNo);

                if (dbSessionId != currentSessionId)
                {
                    Session.Abandon();
                    Response.Redirect("/LogOut.aspx", false);
                }

                string DBToken = CEI.GetUserToken(RegNo);
                if (LoginToken != DBToken)
                {
                    Session.Abandon();
                    Response.Redirect("/LogOut.aspx", false);
                }
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (!string.IsNullOrEmpty(Convert.ToString(Session["SiteOwnerId"])) && !string.IsNullOrEmpty(Convert.ToString(Session["LoginToken"])))
                    {
                        RegNo = Session["SiteOwnerId"].ToString();
                        LoginToken = Session["LoginToken"].ToString();
                        string currentSessionId = Session.SessionID;

                        string dbSessionId = CEI.GetSessionIdFromDB(RegNo);

                        if (dbSessionId != currentSessionId)
                        {
                            Session.Abandon();
                            Response.Redirect("/LogOut.aspx", false);
                        }

                        string DBToken = CEI.GetUserToken(RegNo);
                        if (LoginToken == DBToken)
                        {
                            string sKey = RegNo;
                            string sUser = Convert.ToString(Cache[sKey]);
                            if (sUser == RegNo)
                            {
                                string passReg = Convert.ToString(Session["RegistrationNosessionPass"]);
                                string passType = Convert.ToString(Session["InstallTypePass"]);

                                bool loaded = false;
                                if (passReg != "" && passType != "")
                                {
                                    // Returned-application flow: record seedha select ho jayega, list ki zarurat nahi
                                    string type = passType == "Lift" ? "Lift" : "Escalator";
                                    divSelectRecord.Visible = false;   // returned flow me list nahi hoti (isliye Reset bhi nahi)
                                    loaded = LoadRecord(type, passReg);
                                    divSelectRecord.Visible = !loaded;
                                }

                                if (!loaded)
                                {
                                    GridtoViewAllRecords(CurrentUserId);
                                }

                                Page.Session["ClickCount"] = "0";
                            }
                            else
                            {
                                Session["SiteOwnerId"] = "";
                                Response.Redirect("/LogOut.aspx");
                            }
                        }
                        else
                        {
                            //Token mismatch
                            Session["SiteOwnerId"] = "";
                            Response.Redirect("/LogOut.aspx", false);
                        }
                    }
                    else
                    {
                        Response.Redirect("/LogOut.aspx");
                    }
                }
            }
            catch
            {
                Response.Redirect("/LogOut.aspx");
            }
        }

        #region Grid / Record loading

        // Dono types (Lift + Escalator) ke records ek hi grid me
        private void GridtoViewAllRecords(string CreatedBy)
        {
            DataTable dtAll = null;

            foreach (string type in new[] { "Lift", "Escalator" })
            {
                DataSet ds = CEI.GetRenewalLiftDataGridOfAllREcords(type, CreatedBy);
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dt = ds.Tables[0].Copy();
                    if (!dt.Columns.Contains("InstallationType"))
                        dt.Columns.Add("InstallationType", typeof(string));
                    foreach (DataRow r in dt.Rows)
                        r["InstallationType"] = type;

                    if (dtAll == null) dtAll = dt;
                    else dtAll.Merge(dt);
                }
            }

            if (dtAll != null && dtAll.Rows.Count > 0)
            {
                LblGridView1.Visible = false;
                GridView1.DataSource = dtAll;
                GridView1.DataBind();
            }
            else
            {
                LblGridView1.Visible = true;
                LblGridView1.InnerText = "There is no any Lift or Escalator exist for this User.";
                LblGridView1.Style["color"] = "red";
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                Control ctrl = e.CommandSource as Control;
                GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
                string registrationNo = ((Label)row.FindControl("LblRegistrationNo")).Text;
                string installationType = ((Label)row.FindControl("LblInstallationType")).Text;
                LoadRecord(installationType, registrationNo);
            }
        }

        // Row select hone par: 3 fields fill + show, attachments grid bind
        private bool LoadRecord(string installationType, string registrationNo)
        {
            string createdBy = CurrentUserId;
            DataSet ds = CEI.GetRenewalLiftData(installationType, registrationNo, createdBy);
            if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
            {
                ClearSelection();
                return false;
            }
            DataRow dr = ds.Tables[0].Rows[0];

            SelectedType = installationType;
            SelectedRegNo = dr["RegistrationNo"].ToString();

            txtRegistrationNo.Text = SelectedRegNo;
            txtExpiryDate.Text = ToYmd(dr["ExpiryDate"]);
            txtLastdateOfPayment.Text = ToYmd(dr["LastPaymentDate"]);
            // Khali ho to user bhar sakta hai, warna read-only
            txtLastdateOfPayment.ReadOnly = !string.IsNullOrEmpty(txtLastdateOfPayment.Text);

            FillMoreInfo(dr, installationType);   // "More Info" popup ke labels

            divInspectiondetailsLabel.Visible = true;
            divInspectiondetails.Visible = true;
            divLabelLiftAttachments.Visible = true;
            divLiftAttachments.Visible = true;
            btnSubmit.Visible = true;
            btnReset.Visible = divSelectRecord.Visible;   // list dikh rahi ho tabhi Reset (returned flow me nahi)

            GridDocument(createdBy);
            return true;
        }

        private void ClearSelection()
        {
            SelectedType = "";
            SelectedRegNo = "";
            txtRegistrationNo.Text = "";
            txtExpiryDate.Text = "";
            txtLastdateOfPayment.Text = "";
            txtLastdateOfPayment.ReadOnly = false;

            ClearMoreInfo();

            divInspectiondetailsLabel.Visible = false;
            divInspectiondetails.Visible = false;
            divLabelLiftAttachments.Visible = false;
            divLiftAttachments.Visible = false;
            btnSubmit.Visible = false;
            btnReset.Visible = false;

            // Attachments grid bhi khali (chuni hui files hat jati hain)
            Grd_Document.DataSource = null;
            Grd_Document.DataBind();
        }

        private string GetApplicantType(string userId)
        {
            DataSet ds = CEI.GetApplicantTypeForLift(userId);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0].Rows[0]["ApplicantTypeCode"].ToString();
            }
            return string.Empty;
        }

        private void GridDocument(string userId)
        {
            string applicantType = GetApplicantType(userId);
            string inspectionType = "Periodic";
            string installationType = SelectedType;
            int installationTypeID = 0;

            if (installationType == "Lift")
            {
                installationTypeID = 4;
            }
            else if (installationType == "Escalator")
            {
                installationTypeID = 10;
            }

            DataTable dt = CEI.GetDocumentsForLiftRenewal(applicantType, installationTypeID, inspectionType, installationType);
            if (dt != null && dt.Rows.Count > 0)
            {
                Grd_Document.DataSource = dt;
                Grd_Document.DataBind();
            }
            else
            {
                Grd_Document.DataSource = null;
                Grd_Document.DataBind();
                ShowAlert("No Record Found for document");
            }
        }

        #endregion

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/SiteOwnerPages/LiftPeriodic.aspx", false);
        }

        // Page ko initial stage me le aao: details/attachments hide, list fresh load
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearSelection();
            GridView1.SelectedIndex = -1;
            txtSearch.Text = "";
            divSelectRecord.Visible = true;
            GridtoViewAllRecords(CurrentUserId);
        }

        #region Submit

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(SelectedRegNo) || string.IsNullOrEmpty(SelectedType))
            {
                ShowAlert("Please select a Lift/Escalator from the list.");
                return;
            }

            if (!ValidateDocuments())
            {
                return;
            }

            int ClickCount = Convert.ToInt32(Session["ClickCount"]);
            if (ClickCount >= 1)
            {
                if (!IsReturnedApplication)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorMessage", "alert('You double click on Button.'); window.location='LiftPeriodic.aspx'", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorMessage", "alert('You double click on Button.'); window.location='ReturnLiftInspections.aspx'", true);
                }
                return;
            }

            SqlTransaction transaction = null;
            SqlConnection connection = null;
            try
            {
                string SiteOwnerID = CurrentUserId;
                if (string.IsNullOrEmpty(SiteOwnerID))
                {
                    Response.Redirect("/LogOut.aspx", false);
                    return;
                }

                // ---- Backend se poora record fetch (screen pe nahi dikha rahe) ----
                string installationType = SelectedType;
                string registrationNo = SelectedRegNo;

                DataSet dsRec = CEI.GetRenewalLiftData(installationType, registrationNo, SiteOwnerID);
                if (dsRec == null || dsRec.Tables.Count == 0 || dsRec.Tables[0].Rows.Count == 0)
                {
                    ShowAlert("Record not found. Please select again.");
                    return;
                }
                DataRow dr = dsRec.Tables[0].Rows[0];

                string expiryDateStr = ToYmd(dr["ExpiryDate"]);
                string erectionDateStr = ToYmd(dr["ErectionDate"]);
                string memoDateStr = ToYmd(dr["MemoDate"]);
                string lastPaymentStr = txtLastdateOfPayment.Text;   // user-editable agar DB me khali tha

                DateTime lastExpiryDate, erectionDate, memoDate, lastdateOfPayment;
                if (!DateTime.TryParse(expiryDateStr, out lastExpiryDate) ||
                    !DateTime.TryParse(erectionDateStr, out erectionDate) ||
                    !DateTime.TryParse(memoDateStr, out memoDate) ||
                    !DateTime.TryParse(lastPaymentStr, out lastdateOfPayment))
                {
                    ShowAlert("Record data is incomplete (Expiry / Erection / Memo / Payment date). Please contact support.");
                    return;
                }

                string errorMsg = "";
                if (!ValidateErectionAndMemoDates(lastExpiryDate, lastdateOfPayment, erectionDate, memoDate, out errorMsg))
                {
                    ShowAlert(errorMsg);
                    return;
                }

                string make = dr["Make"].ToString();
                string serialNo = dr["LiftSrNo"].ToString();
                string type = dr["TypeOfLift"].ToString();
                string controlType = dr["TypeOfControl"].ToString();
                string capacity = dr["Capacity"].ToString();
                decimal weight = 0.0m;
                decimal.TryParse(dr["Weight"].ToString(), out weight);
                string districtValue = dr["District"].ToString();
                string memoNo = dr["MemoNo"].ToString();
                string siteAddress = dr["SiteAddress"].ToString();
                string filePathInfo = "";

                // ---- DB transaction ----
                string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ToString();
                connection = new SqlConnection(connectionString);
                connection.Open();
                transaction = connection.BeginTransaction();

                string TRID = "";
                if (!IsReturnedApplication)
                {
                    TRID = CEI.InsertPeriodicLiftData(
                        installationType, registrationNo, expiryDateStr,
                        filePathInfo, lastPaymentStr, erectionDateStr, make,
                        serialNo, type, controlType, capacity, weight,
                        districtValue, memoNo, memoDateStr, siteAddress,
                        SiteOwnerID, transaction);
                }
                else
                {
                    string TestReportId = Session["EscalatorTestReportID"].ToString();
                    int InspectionId = int.Parse(Session["InspectionId"].ToString());
                    DataTable dt = CEI.InsertReturnPeriodicLiftData(
                        TestReportId, installationType, registrationNo,
                        expiryDateStr, filePathInfo, lastPaymentStr, erectionDateStr,
                        make, serialNo, type, controlType, capacity,
                        weight, districtValue, memoNo, memoDateStr, siteAddress,
                        InspectionId, SiteOwnerID);
                    TRID = dt.Rows[0]["TestReportId"].ToString();
                }

                // ---- Upload supporting documents (required docs ValidateDocuments me check ho chuke hain) ----
                foreach (GridViewRow row in Grd_Document.Rows)
                {
                    Label LblDocumentID = (Label)row.FindControl("LblDocumentID");
                    Label LblDocumentName = (Label)row.FindControl("LblDocumentName");
                    Label LblShortName = (Label)row.FindControl("LblShortName");

                    string fileName = LblShortName.Text;
                    string fileNameWithoutExtension = fileName.Contains(".pdf") ? fileName.Substring(0, fileName.IndexOf(".pdf")) : fileName;

                    FileUpload fileUploadDoc1 = row.FindControl("FileUpload1") as FileUpload;

                    if (fileUploadDoc1 != null && fileUploadDoc1.HasFile)
                    {
                        string folderPath = $"/Attachment/{SiteOwnerID}/{registrationNo}/CheckListDocuments";
                        string absolutePath = Server.MapPath(folderPath);
                        if (!Directory.Exists(absolutePath)) Directory.CreateDirectory(absolutePath);

                        string fileName1 = fileNameWithoutExtension + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
                        string filePathInfo1 = Path.Combine(absolutePath, fileName1);
                        fileUploadDoc1.PostedFile.SaveAs(filePathInfo1);

                        CEI.UploadDocumentforLiftPeriodic(TRID, registrationNo, installationType,
                            LblDocumentID.Text, LblDocumentName.Text, fileName, folderPath + "/" + fileName1, SiteOwnerID, transaction);
                    }
                }

                transaction.Commit();

                // For Double Click ----------
                ClickCount = ClickCount + 1;
                Session["ClickCount"] = ClickCount;

                if (!IsReturnedApplication)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alertWithRedirectdata();", true); //SuccessfulSubmit
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alertWithReturnRedirectdata();", true);  //Returned-Application SuccessfulSubmit
                }
                ClearSelection();
            }
            catch (Exception ex)
            {
                if (transaction != null)
                    transaction.Rollback();

                ShowAlert("Error: " + ex.Message);
            }
            finally
            {
                if (connection != null && connection.State == ConnectionState.Open)
                    connection.Close();
            }
        }

        private bool ValidateErectionAndMemoDates(DateTime Lastexpirydate, DateTime LastApprovalDate, DateTime erectionDate, DateTime memoDate, out string errorMsg)
        {
            errorMsg = "";
            DateTime currentDate = DateTime.Today;
            DateTime twentyYearsAgo = currentDate.AddYears(-20);
            if (erectionDate < twentyYearsAgo)
            {
                errorMsg = "You are not eligible for renewal. As your Erection date is more than 20 years old.";
                return false;
            }

            if (erectionDate >= memoDate)
            {
                errorMsg = "Date of Erection must be smaller than Memo Date.";
                return false;
            }
            //2 date checks added by navneet on instructions of vinod sir
            if (Lastexpirydate <= LastApprovalDate)
            {
                errorMsg = "Date of Renewal must be Greater than or equal to Last date of payment";
                return false;
            }

            return true;
        }

        private bool ValidateDocuments()
        {
            if (string.IsNullOrWhiteSpace(txtLastdateOfPayment.Text))
            {
                ShowAlert("Please select Last date of payment");
                txtLastdateOfPayment.Focus();
                return false;
            }

            foreach (GridViewRow row in Grd_Document.Rows)
            {
                Label LblDocumentName = (Label)row.FindControl("LblDocumentName");
                FileUpload fileUploadDoc1 = row.FindControl("FileUpload1") as FileUpload;

                bool isOtherDocument = LblDocumentName.Text.Trim().ToLower() == "other document";

                if (fileUploadDoc1 != null && !fileUploadDoc1.HasFile)
                {
                    if (!isOtherDocument)
                    {
                        ShowAlert("Please upload the document: " + LblDocumentName.Text);
                        return false;
                    }
                }
            }

            return true;
        }

        #endregion

        #region Helpers

        private string ToYmd(object value)
        {
            DateTime dt;
            return DateTime.TryParse(Convert.ToString(value), out dt) ? dt.ToString("yyyy-MM-dd") : "";
        }

        private string ToDmy(object value)
        {
            DateTime dt;
            return DateTime.TryParse(Convert.ToString(value), out dt) ? dt.ToString("dd-MM-yyyy") : "";
        }

        // "More Info" popup: sirf display ke liye. Submit me data phir bhi DB se hi fetch hota hai.
        // Label.Text HTML-encode nahi karta, isliye Server.HtmlEncode use kiya hai.
        private void FillMoreInfo(DataRow dr, string installationType)
        {
            lblInfoInstallationType.Text = Server.HtmlEncode(installationType);
            lblInfoMake.Text = Server.HtmlEncode(dr["Make"].ToString());
            lblInfoSerialNo.Text = Server.HtmlEncode(dr["LiftSrNo"].ToString());
            lblInfoType.Text = Server.HtmlEncode(dr["TypeOfLift"].ToString());
            lblInfoControl.Text = Server.HtmlEncode(dr["TypeOfControl"].ToString());
            lblInfoErection.Text = ToDmy(dr["ErectionDate"]);
            lblInfoCapacity.Text = Server.HtmlEncode(dr["Capacity"].ToString());
            lblInfoWeight.Text = Server.HtmlEncode(dr["Weight"].ToString());
            lblInfoDistrict.Text = Server.HtmlEncode(dr["District"].ToString());
            lblInfoMemoNo.Text = Server.HtmlEncode(dr["MemoNo"].ToString());
            lblInfoMemoDate.Text = ToDmy(dr["MemoDate"]);
            lblInfoSiteAddress.Text = Server.HtmlEncode(dr["SiteAddress"].ToString());
        }

        private void ClearMoreInfo()
        {
            Label[] labels =
            {
                lblInfoInstallationType, lblInfoMake, lblInfoSerialNo, lblInfoType,
                lblInfoControl, lblInfoErection, lblInfoCapacity, lblInfoWeight,
                lblInfoDistrict, lblInfoMemoNo, lblInfoMemoDate, lblInfoSiteAddress
            };
            foreach (Label l in labels)
            {
                l.Text = "";
            }
        }

        // JS alert me quotes / new lines se script na toote
        private static string JsSafe(string s)
        {
            return (s ?? "").Replace("\\", "\\\\").Replace("'", "\\'").Replace("\r", " ").Replace("\n", " ");
        }

        private void ShowAlert(string message)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert" + Guid.NewGuid().ToString("N"), "alert('" + JsSafe(message) + "');", true);
        }

        #endregion
        protected void btnAddnew_Click(object sender, EventArgs e)
        {
            Session["ReturnedValue"] = "Treys";
            Response.Redirect("/SiteOwnerPages/LiftPeriodicRenewal.aspx", false);
        }
    }
}
