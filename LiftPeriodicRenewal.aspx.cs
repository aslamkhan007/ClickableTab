using CEI_PRoject;
using CEIHaryana.Contractor;
using CEIHaryana.Officers;
using CEIHaryana.UserPages;
using Org.BouncyCastle.Asn1.Cmp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Windows.Media;
using System.Windows.Media.TextFormatting;
using System.Xml.Linq;

namespace CEIHaryana.SiteOwnerPages
{
    public partial class LiftPeriodicRenewal : System.Web.UI.Page
    {
        //Page Created By Neha 
        CEI CEI = new CEI();
        string TRID = string.Empty;
        private string errorMessage;
        string RegNo = string.Empty, LoginToken = string.Empty;
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

                                HdnUserID.Value = Convert.ToString(Session["SiteOwnerId"]);
                                //GetApplicantType();
                                if (Convert.ToString(Session["RegistrationNosessionPass"]) != null && Convert.ToString(Session["RegistrationNosessionPass"]) != "")
                                {
                                    txtRegistrationNo.Text = Session["RegistrationNosessionPass"].ToString();
                                    if (Session["InstallTypePass"] != null)
                                    {
                                        if (Session["InstallTypePass"].ToString() == "Lift")
                                        {
                                            ddlInstallationType.SelectedValue = "1";
                                        }
                                        else
                                        {
                                            ddlInstallationType.SelectedValue = "2";
                                        }
                                        ddlInstallationType_SelectedIndexChanged(ddlInstallationType, EventArgs.Empty);
                                        txtRegistrationNo.Enabled = false;
                                        ddlInstallationType.Enabled = false;
                                    }
                                    txtRegistrationNo.Text = Session["RegistrationNosessionPass"].ToString();
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
                Response.Redirect("/LogOut.aspx");
            }
        }

        private void GetApplicantType(string UserID)
        {
            string ApplicantTypeID = string.Empty;
            DataSet ds = new DataSet();
            ds = CEI.GetApplicantTypeForLift(UserID);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                ApplicantTypeID = ds.Tables[0].Rows[0]["ApplicantTypeCode"].ToString();
                HdnApplicantTypeID.Value = ApplicantTypeID.ToString();
            }
            else
            { }
        }

        private void GridtoViewAllRecords(string InstallationType, string CreatedBy)
        {
            DataSet ds = new DataSet();
            ds = CEI.GetRenewalLiftDataGridOfAllREcords(InstallationType, CreatedBy);
            if (ds.Tables[0].Rows.Count > 0)
            {
                LblGridView1.Visible = false;
                GridView1.DataSource = ds.Tables[0];
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

        private void GridDocument(string UserID)
        {
            GetApplicantType(UserID);
            string ApplicantType = HdnApplicantTypeID.Value;
            int InstallationTypeID = 0;
            string InspectionType = "Periodic";
            string InstallationType = HdnInstallationType.Value;

            if (InstallationType == "Lift")
            {
                InstallationTypeID = 4;
            }
            else if (InstallationType == "Escalator")
            {
                InstallationTypeID = 10;
            }

            DataTable ds = CEI.GetDocumentsForLiftRenewal(ApplicantType, InstallationTypeID, InspectionType, InstallationType);
            if (ds != null && ds.Rows.Count > 0)
            {
                Grd_Document.DataSource = ds;
                Grd_Document.DataBind();
            }
            else
            {
                Grd_Document.DataSource = null;
                Grd_Document.DataBind();
                string script = "alert('No Record Found for document');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }
        }




        protected void ddlInstallationType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToString(HdnUserID.Value) != null && Convert.ToString(HdnUserID.Value) != "")
            {
                string CreatedBy = HdnUserID.Value;
                Reset();
                txtRegistrationNo.Text = "";
                ddlInstallationType.SelectedItem.ToString();
                HdnInstallationType.Value = ddlInstallationType.SelectedItem.ToString();
                divLabelLiftAttachments.Visible = true;
                divLiftAttachments.Visible = true;

                GridtoViewAllRecords(ddlInstallationType.SelectedItem.ToString(), CreatedBy);
                BindDistrict();
                GridDocument(CreatedBy);
                string selectedValue = ddlInstallationType.SelectedValue;
                if (selectedValue == "1")
                {
                    divLiftDetails.Visible = true;
                    divdetails.Visible = true;
                    divEscalatorDetails.Visible = false;
                    lblTypeOfLift.InnerText = "Type of Lift";
                    RadioBtnType.Visible = true;
                    rvfRadioButtonList.Visible = true;
                    RadioBtnEscType.Visible = false;
                    lblMake.InnerText = "Make of Lift";
                }
                else if (selectedValue == "2")
                {
                    divLiftDetails.Visible = false;
                    divdetails.Visible = true;
                    divEscalatorDetails.Visible = true;
                    lblTypeOfLift.InnerText = "Type of Escalator";
                    RadioBtnEscType.Visible = true;
                    RequiredFieldValidator9.Visible = true;
                    RadioBtnType.Visible = false;
                    lblMake.InnerText = "Make of Escalator";
                }
                else
                {
                    lblTypeOfLift.InnerText = "Type of Lift";
                }
            }
            else
            {

            }
        }
        private void Reset()
        {
            txtMake.ReadOnly = false;
            txtSerialNo.ReadOnly = false;
            RadioBtnType.Enabled = true;
            RadioBtnEscType.Enabled = true;
            txtControlType.ReadOnly = false;
            txtCapacity.ReadOnly = false;
            txtWeight.ReadOnly = false;
            txtSiteAddress.ReadOnly = false;
            ddlDistrict.Visible = true;
            RequiredFieldValidator25.Visible = true;
            txtDistrict.Visible = false;
            RequiredFieldValidator25.Visible = true;
            txtDateofErection.ReadOnly = false;
            txtMemoNo.ReadOnly = false;
            txtMemoDate.ReadOnly = false;
            txtLastdateOfPayment.ReadOnly = false;
            txtExpiryDate.ReadOnly = false;

            txtMake.Text = "";
            txtSerialNo.Text = "";
            RadioBtnType.SelectedIndex = -1;
            RadioBtnEscType.SelectedIndex = -1;
            txtControlType.Text = "";
            txtCapacity.Text = "";
            txtWeight.Text = "";
            txtSiteAddress.Text = "";
            ddlDistrict.ClearSelection();
            txtDistrict.Text = "";
            txtDateofErection.Text = "";
            txtMemoNo.Text = "";
            txtMemoDate.Text = "";
            txtLastdateOfPayment.Text = "";
            txtExpiryDate.Text = "";
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/SiteOwnerPages/LiftPeriodic.aspx", false);
        }

        protected void txtRegistrationNo_TextChanged(object sender, EventArgs e)
        {
            string CreatedBy = HdnUserID.Value;
            //int result = Convert.ToInt32(CEI.ToCheckeitherLiftOrEsclatorRegistered(txtRegistrationNo.Text.Trim(), CreatedBy));
            //if (result == 1)
            //{
            DataSet ds = CEI.GetRenewalLiftData(ddlInstallationType.SelectedItem.ToString(), txtRegistrationNo.Text.Trim(), CreatedBy);
            if (ds.Tables[0].Rows.Count > 0 && ds != null)
            {
                txtMake.ReadOnly = true;
                txtSerialNo.ReadOnly = true;
                RadioBtnType.Enabled = false;
                RadioBtnEscType.Enabled = false;
                txtControlType.ReadOnly = true;
                txtCapacity.ReadOnly = true;
                txtWeight.ReadOnly = true;
                txtSiteAddress.ReadOnly = true;
                ddlDistrict.Visible = false;
                RequiredFieldValidator25.Visible = false;
                txtDistrict.Visible = true;
                txtDateofErection.ReadOnly = true;
                txtMemoNo.ReadOnly = true;
                txtMemoDate.ReadOnly = true;
                txtLastdateOfPayment.ReadOnly = true;
                txtExpiryDate.ReadOnly = true;
                txtMake.Text = ds.Tables[0].Rows[0]["Make"].ToString();
                txtSerialNo.Text = ds.Tables[0].Rows[0]["LiftSrNo"].ToString();

                string typeOfLift = ds.Tables[0].Rows[0]["TypeOfLift"].ToString();

                if (ddlInstallationType.SelectedItem.Text == "Lift")
                {
                    if (typeOfLift == "Passenger lift")
                    {
                        RadioBtnType.SelectedValue = "0";
                    }
                    else if (typeOfLift == "Goods Lift")
                    {
                        RadioBtnType.SelectedValue = "1";
                    }
                }
                else if (ddlInstallationType.SelectedItem.Text == "Escalator")
                {
                    if (typeOfLift == "Travelator")
                    {
                        RadioBtnEscType.SelectedValue = "0";
                    }
                    else if (typeOfLift == "Escalator")
                    {
                        RadioBtnEscType.SelectedValue = "1";
                    }
                }
                txtControlType.Text = ds.Tables[0].Rows[0]["TypeOfControl"].ToString();
                txtCapacity.Text = ds.Tables[0].Rows[0]["Capacity"].ToString();
                txtWeight.Text = ds.Tables[0].Rows[0]["Weight"].ToString();
                DateTime erectionDate;
                if (DateTime.TryParse(ds.Tables[0].Rows[0]["ErectionDate"].ToString(), out erectionDate))
                {
                    txtDateofErection.Text = erectionDate.ToString("yyyy-MM-dd");
                }
                else
                {
                    txtDateofErection.Text = "";
                }
                DateTime LastApprovalDate;
                if (DateTime.TryParse(ds.Tables[0].Rows[0]["LastPaymentDate"].ToString(), out LastApprovalDate))
                {
                    txtLastdateOfPayment.Text = LastApprovalDate.ToString("yyyy-MM-dd");
                }
                else
                {
                    txtLastdateOfPayment.Text = "";
                    txtLastdateOfPayment.ReadOnly = false;
                }
                DateTime PrevChallanDate;
                if (DateTime.TryParse(ds.Tables[0].Rows[0]["ExpiryDate"].ToString(), out PrevChallanDate))
                {
                    txtExpiryDate.Text = PrevChallanDate.ToString("yyyy-MM-dd");
                }
                else
                {
                    txtExpiryDate.Text = "";
                }
                txtDistrict.Text = ds.Tables[0].Rows[0]["District"].ToString();
                txtSiteAddress.Text = ds.Tables[0].Rows[0]["SiteAddress"].ToString();
                string memo = ds.Tables[0].Rows[0]["MemoNo"].ToString();
                txtMemoNo.Text = memo.ToString();
                DateTime MemoDate;
                if (DateTime.TryParse(ds.Tables[0].Rows[0]["MemoDate"].ToString(), out MemoDate))
                {
                    txtMemoDate.Text = MemoDate.ToString("yyyy-MM-dd");
                }
                else
                {
                    txtMemoDate.Text = "";
                }
            }
            else
            {
                Reset();
                //txtRegistrationNo.Text = "";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('An application with the same Registration No. already exists for another user.')", true);
            }
            //}
            //else if (result == 0)
            //{
            //    Reset();
            //    txtRegistrationNo.Text = "";
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('An application with the same Registration No. already exists for another user.')", true);
            //}
            //else
            //{
            //    Reset();
            //}
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                Control ctrl = e.CommandSource as Control;
                GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
                Label LblRegistrationNo = (Label)row.FindControl("LblRegistrationNo");
                string RegistrationNo = LblRegistrationNo.Text;
                string CreatedBy = HdnUserID.Value;

                DataSet ds = new DataSet();
                ds = CEI.GetRenewalLiftData(ddlInstallationType.SelectedItem.ToString(), RegistrationNo, CreatedBy);
                if (ds.Tables[0].Rows.Count > 0 && ds != null)
                {
                    txtMake.ReadOnly = true;
                    txtSerialNo.ReadOnly = true;
                    RadioBtnType.Enabled = false;
                    RadioBtnEscType.Enabled = false;
                    txtControlType.ReadOnly = true;
                    txtCapacity.ReadOnly = true;
                    txtWeight.ReadOnly = true;
                    txtSiteAddress.ReadOnly = true;
                    ddlDistrict.Visible = false;
                    txtDistrict.Visible = true;
                    txtDateofErection.ReadOnly = true;
                    txtMemoNo.ReadOnly = true;
                    txtMemoDate.ReadOnly = true;
                    txtLastdateOfPayment.ReadOnly = true;
                    txtExpiryDate.ReadOnly = true;
                    txtMake.Text = ds.Tables[0].Rows[0]["Make"].ToString();
                    txtSerialNo.Text = ds.Tables[0].Rows[0]["LiftSrNo"].ToString();
                    string typeOfLift = ds.Tables[0].Rows[0]["TypeOfLift"].ToString();
                    if (ddlInstallationType.SelectedItem.Text == "Lift")
                    {
                        if (typeOfLift == "Passenger lift")
                        {
                            RadioBtnType.SelectedValue = "0";
                        }
                        else if (typeOfLift == "Goods Lift")
                        {
                            RadioBtnType.SelectedValue = "1";
                        }
                    }
                    else if (ddlInstallationType.SelectedItem.Text == "Escalator")
                    {
                        if (typeOfLift == "Travelator")
                        {
                            RadioBtnEscType.SelectedValue = "0";
                        }
                        else if (typeOfLift == "Escalator")
                        {
                            RadioBtnEscType.SelectedValue = "1";
                        }
                    }
                    txtControlType.Text = ds.Tables[0].Rows[0]["TypeOfControl"].ToString();
                    txtCapacity.Text = ds.Tables[0].Rows[0]["Capacity"].ToString();
                    txtWeight.Text = ds.Tables[0].Rows[0]["Weight"].ToString();
                    DateTime erectionDate;
                    if (DateTime.TryParse(ds.Tables[0].Rows[0]["ErectionDate"].ToString(), out erectionDate))
                    {
                        txtDateofErection.Text = erectionDate.ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        txtDateofErection.Text = "";
                    }
                    DateTime LastApprovalDate;
                    if (DateTime.TryParse(ds.Tables[0].Rows[0]["LastPaymentDate"].ToString(), out LastApprovalDate))
                    {
                        txtLastdateOfPayment.Text = LastApprovalDate.ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        txtLastdateOfPayment.Text = "";
                        txtLastdateOfPayment.ReadOnly = false;
                    }
                    DateTime PrevChallanDate;
                    if (DateTime.TryParse(ds.Tables[0].Rows[0]["ExpiryDate"].ToString(), out PrevChallanDate))
                    {
                        txtExpiryDate.Text = PrevChallanDate.ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        txtExpiryDate.Text = "";
                    }
                    txtDistrict.Text = ds.Tables[0].Rows[0]["District"].ToString();
                    txtSiteAddress.Text = ds.Tables[0].Rows[0]["SiteAddress"].ToString();
                    txtRegistrationNo.Text = ds.Tables[0].Rows[0]["RegistrationNo"].ToString();
                    txtMemoNo.Text = ds.Tables[0].Rows[0]["MemoNo"].ToString();
                    DateTime MemoDate;
                    if (DateTime.TryParse(ds.Tables[0].Rows[0]["MemoDate"].ToString(), out MemoDate))
                    {
                        txtMemoDate.Text = MemoDate.ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        txtMemoDate.Text = "";
                    }
                }
                else
                {
                    Reset();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlTransaction transaction = null;
            SqlConnection connection = null;

            if (!ValidateDocuments())
            {
                return;
            }

            int ClickCount = 0;
            ClickCount = Convert.ToInt32(Session["ClickCount"]);
            if (ClickCount < 1)
            {
                try
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ToString();
                    connection = new SqlConnection(connectionString);
                    connection.Open();
                    transaction = connection.BeginTransaction();

                    if (Convert.ToString(HdnUserID.Value) != null && Convert.ToString(HdnUserID.Value) != "")
                    {
                        string SiteOwnerID = HdnUserID.Value;

                        //int result = Convert.ToInt32(CEI.ToCheckeitherLiftOrEsclatorRegistered(txtRegistrationNo.Text.Trim(), SiteOwnerID));
                        //if (result == -1)
                        //{

                        DateTime lastExpiryDate = Convert.ToDateTime(txtExpiryDate.Text);
                        DateTime memoDate = Convert.ToDateTime(txtMemoDate.Text);
                        DateTime erectionDate = Convert.ToDateTime(txtDateofErection.Text);
                        //LastdateOfPayment changed by navneet as per instructions of vinod sir
                        DateTime LastdateOfPayment;
                        DateTime Lastexpirydate = Convert.ToDateTime(txtExpiryDate.Text);
                        if (Convert.ToString(txtLastdateOfPayment.Text) != "")
                        {

                            LastdateOfPayment = Convert.ToDateTime(txtLastdateOfPayment.Text);
                            //validation for erection & memo dates
                            string errorMsg = "";
                            if (!ValidateErectionAndMemoDates(Lastexpirydate, LastdateOfPayment, erectionDate, memoDate, out errorMsg))
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", $"alert('{errorMsg}');", true);
                                return;
                            }
                        }
                        //

                        //Check for memo vs expiry logic
                        ////if (!ToCheckDatesForLiftRenewal(lastExpiryDate, memoDate))
                        ////{
                        ////    Response.Write("<script>alert('The date (month and day) of the FirstExpiryDate from Memo Date must match the Last Expiry Date.');</script>");
                        ////    return;
                        ////}

                        string filePathInfo = "";
                        // Other fields
                        string districtValue = ddlDistrict.Visible ? ddlDistrict.SelectedItem.ToString() : txtDistrict.Text;
                        string Type = RadioBtnType.Visible ? RadioBtnType.SelectedItem.Text : (RadioBtnEscType.Visible ? RadioBtnEscType.SelectedItem.Text : "");

                        decimal weight = 0.0m;
                        decimal.TryParse(txtWeight.Text, out weight);
                        string TRID = "";
                        if (Session["ReturnedValue"].ToString() != "1")
                        {
                            TRID = CEI.InsertPeriodicLiftData(
                                ddlInstallationType.SelectedItem.ToString(), txtRegistrationNo.Text, txtExpiryDate.Text,
                                filePathInfo, txtLastdateOfPayment.Text, txtDateofErection.Text, txtMake.Text,
                                txtSerialNo.Text, Type, txtControlType.Text, txtCapacity.Text, weight,
                                districtValue, txtMemoNo.Text, txtMemoDate.Text, txtSiteAddress.Text,
                                SiteOwnerID, transaction);
                        }
                        else
                        {
                            string TestReportId = Session["EscalatorTestReportID"].ToString();
                            int InspectionId = int.Parse(Session["InspectionId"].ToString());
                            DataTable dt = CEI.InsertReturnPeriodicLiftData(
                                TestReportId, ddlInstallationType.SelectedItem.ToString(), txtRegistrationNo.Text,
                                txtExpiryDate.Text, filePathInfo, txtLastdateOfPayment.Text, txtDateofErection.Text,
                                txtMake.Text, txtSerialNo.Text, Type, txtControlType.Text, txtCapacity.Text,
                                weight, districtValue, txtMemoNo.Text, txtMemoDate.Text, txtSiteAddress.Text,
                                InspectionId, SiteOwnerID);
                            TRID = dt.Rows[0]["TestReportId"].ToString();
                        }

                        // Upload supporting documents
                        bool allRequiredDocumentsAreUploaded = true;
                        foreach (GridViewRow row in Grd_Document.Rows)
                        {
                            Label LblDocumentID = (Label)row.FindControl("LblDocumentID");
                            Label LblDocumentName = (Label)row.FindControl("LblDocumentName");
                            Label LblShortName = (Label)row.FindControl("LblShortName");

                            string fileName = LblShortName.Text;
                            string fileNameWithoutExtension = fileName.Contains(".pdf") ? fileName.Substring(0, fileName.IndexOf(".pdf")) : fileName;

                            FileUpload fileUploadDoc1 = row.FindControl("FileUpload1") as FileUpload;
                            // Check if it's a required document or "Other Document"
                            bool isOtherDocument = LblDocumentName.Text.Trim().ToLower() == "other document";

                            if (fileUploadDoc1 != null && fileUploadDoc1.HasFile)
                            {
                                string folderPath = $"/Attachment/{SiteOwnerID}/{txtRegistrationNo.Text}/CheckListDocuments";
                                string absolutePath = Server.MapPath(folderPath);

                                if (!Directory.Exists(absolutePath)) Directory.CreateDirectory(absolutePath);

                                string fileName1 = fileNameWithoutExtension + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
                                string filePathInfo1 = Path.Combine(absolutePath, fileName1);
                                fileUploadDoc1.PostedFile.SaveAs(filePathInfo1);

                                CEI.UploadDocumentforLiftPeriodic(TRID, txtRegistrationNo.Text, ddlInstallationType.SelectedItem.ToString(),
                                    LblDocumentID.Text, LblDocumentName.Text, fileName, folderPath + "/" + fileName1, SiteOwnerID, transaction);
                            }
                            else
                            {
                                if (!isOtherDocument)
                                {
                                    allRequiredDocumentsAreUploaded = false;
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", $"alert('Please upload the document: {LblDocumentName.Text}');", true);
                                    return;
                                }
                            }
                        }
                        transaction.Commit();
                        // For Double Click ----------
                        ClickCount = ClickCount + 1;
                        Session["ClickCount"] = ClickCount;                    

                        // Redirect or show confirmation
                        if (Session["ReturnedValue"].ToString() != "1")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alertWithRedirectdata();", true); //SuccessfulSubmit         
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alertWithReturnRedirectdata();", true);  //Returned-Application SuccessfulSubmit                        
                        }
                        Reset();
                        //}
                        //else
                        //{
                        //    Reset();
                        //    txtRegistrationNo.Text = "";
                        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert", "alert('An application with the same Registration No. already exists for another user.')", true);
                        //}
                    }
                    else
                    {
                        Reset();
                        txtRegistrationNo.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    if (transaction != null)
                        transaction.Rollback();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", $"alert('Error: {ex.Message}');", true);
                }
                finally
                {
                    if (connection != null && connection.State == ConnectionState.Open)
                        connection.Close();
                }
            }
            else
            {
                if (Session["ReturnedValue"].ToString() != "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorMessage", "alert('You double click on Button.'); window.location='LiftPeriodic.aspx'", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorMessage", "alert('You double click on Button.'); window.location='ReturnLiftInspections.aspx'", true);
                }
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Error",
                "alert('Please select Last date of payment');", true);

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
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Error",
                        $"alert('Please upload the document: {LblDocumentName.Text}');", true);

                        return false;
                    }
                }
            }

            return true;
        }
    }
}