using CEI_PRoject;
using CEIHaryana.Model.Common.Classes;
using CEIHaryana.Model.Common.Method;
using CEIHaryana.Officers;
using CEIHaryana.UserCPages;
using Newtonsoft.Json;
using Pipelines.Sockets.Unofficial.Arenas;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static iText.StyledXmlParser.Jsoup.Select.Evaluator;

namespace CEIHaryana.SiteOwnerPages
{
    public partial class ReapplyReturnINspection : System.Web.UI.Page
    {
        CEI CEI = new CEI();
        string SiteOwnerID;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    hnOwnerId.Value = "";
                    hnReturnStatus.Value = "";
                    if (Convert.ToString(Session["SiteOwnerId"]) != null && !string.IsNullOrEmpty(Convert.ToString(Session["SiteOwnerId"]).ToString()) && Convert.ToString(Session["InspectionId"]) != null && !string.IsNullOrEmpty(Convert.ToString(Session["InspectionId"]).ToString()))
                    {
                        hnOwnerId.Value = Session["SiteOwnerId"].ToString();
                        txtInspectionId.Text = Session["InspectionId"].ToString();
                        GetInspectionDetails(txtInspectionId.Text);
                        GridToViewTRinMultipleCaseNew(txtInspectionId.Text);
                        GridBindDocument(txtInspectionId.Text);
                        GetInspectionData(txtInspectionId.Text);
                        //Session["InspectionId"] = "";
                        Page.Session["ClickCount"] = "0";
                        Session["LineID"] = "";
                        Session["SubStationID"] = "";
                        Session["GeneratingSetId"] = "";
                    }
                    else
                    {
                        Session["SiteOwnerId"] = "";
                        Response.Redirect("/SiteOwnerLogout.aspx", false);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert()", "alert('" + ex.Message.ToString() + "')", true);
            }
        }
        private void GetInspectionDetails(string InspectionID)
        {
            try
            {
                DataSet ds = new DataSet();
                ds = CEI.GetInspectionReport(InspectionID);
                txtApplicantType.Text = ds.Tables[0].Rows[0]["ApplicantType"].ToString();
                txtWorkType.Text = ds.Tables[0].Rows[0]["Inspectiontype"].ToString();
                txtVoltage.Text = ds.Tables[0].Rows[0]["VoltageLevel"].ToString();
                txtMaxVoltage.Text = ds.Tables[0].Rows[0]["MaxVoltage"].ToString();
                txtCapacity.Text = ds.Tables[0].Rows[0]["TotalCapacity"].ToString();
                txtAmount.Text = ds.Tables[0].Rows[0]["TotalAmount"].ToString();
                if (txtAmount.Text == "0")
                {
                    PaymentDetails.Visible = false;
                }
                else
                {
                    PaymentDetails.Visible = true;
                }


                txttransactionId.Text = ds.Tables[0].Rows[0]["TransactionId"].ToString();
                txttransactionDate.Text = ds.Tables[0].Rows[0]["TransctionDate"].ToString();
                hnReturnStatus.Value = ds.Tables[0].Rows[0]["ReturnedBasedOnDocumentValue"].ToString();
                if (hnReturnStatus.Value != null && hnReturnStatus.Value == "1")
                {
                    Grid_MultipleInspectionTR.Columns[5].Visible = false;
                    Grid_MultipleInspectionTR.Columns[6].Visible = false;
                    Grid_MultipleInspectionTR.Columns[7].Visible = false;
                }
                else if (hnReturnStatus.Value != null && hnReturnStatus.Value == "2")
                {
                    grd_Documemnts.Columns[3].Visible = false;
                    grd_Documemnts.Columns[4].Visible = false;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert()", "alert('" + ex.Message.ToString() + "')", true);
            }
        }
        private void GridToViewTRinMultipleCaseNew(string InspectionID)
        {
            try
            {

                DataSet dsVC = CEI.GetDetailsToViewTRinMultipleCaseNew(InspectionID);

                if (dsVC != null && dsVC.Tables.Count > 0 && dsVC.Tables[0].Rows.Count > 0)
                {
                    Grid_MultipleInspectionTR.DataSource = dsVC;
                    Grid_MultipleInspectionTR.DataBind();
                }
                else
                {
                    Grid_MultipleInspectionTR.DataSource = null;
                    Grid_MultipleInspectionTR.DataBind();
                    string script = "alert('No Record Found');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert()", "alert('" + ex.Message.ToString() + "')", true);
            }
        }
        protected void GridBindDocument(string InspectionID)
        {
            try
            {
                DataSet ds = new DataSet();
                ds = CEI.ViewDocuments(InspectionID);
                if (ds.Tables.Count > 0)
                {
                    grd_Documemnts.DataSource = ds;
                    grd_Documemnts.DataBind();
                }
                else
                {
                    grd_Documemnts.DataSource = null;
                    grd_Documemnts.DataBind();
                    string script = "alert(\"No Record Found\");";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                }
                ds.Dispose();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert()", "alert('" + ex.Message.ToString() + "')", true);
            }
        }
        private void GetInspectionData(string InspectionID)
        {
            try
            {
                DataSet ds = new DataSet();
                //commented by Gurmeet 02-may-2025
                //ds = CEI.GetInspectionReport(InspectionID);
                ds = CEI.GetInspectionHistoryLogs(InspectionID);
                string TestRportId = string.Empty;
                if (ds != null && ds.Tables.Count > 0)
                {
                    GridView2.DataSource = ds;
                    GridView2.DataBind();
                }
                else
                {
                    GridView2.DataSource = null;
                    GridView2.DataBind();
                    string script = "alert(\"No Record Found\");";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                }
                ds.Dispose();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert()", "alert('" + ex.Message.ToString() + "')", true);
            }
        }
        protected void Grid_MultipleInspectionTR_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                   // Label LblInstallationName = (Label)e.Row.FindControl("LblInstallationName");
                    LinkButton linkButtonInvoice = (LinkButton)e.Row.FindControl("lnkInstallaionInvoice");
                    LinkButton LinkButtonReport = (LinkButton)e.Row.FindControl("lnkManufacturingReport");
                    FileUpload UploadInstallaionInvoice = (FileUpload)e.Row.FindControl("FileUploadInstallaionInvoice");
                    FileUpload UploadManufacturingReport = (FileUpload)e.Row.FindControl("FileUploadManufacturingReport");
                    //Only Condition Changed By Navneet 30-april-2025 
                    //if (LblInstallationName.Text.Trim() == "Line")
                    //{
                    if (!string.IsNullOrEmpty(LinkButtonReport.CommandArgument.ToString()) && string.IsNullOrEmpty(linkButtonInvoice.CommandArgument.ToString()))
                    {
                        linkButtonInvoice.Visible = false;
                        LinkButtonReport.Visible = true;
                        UploadInstallaionInvoice.Visible = false;
                        UploadManufacturingReport.Visible = true;
                    }
                    else if (LinkButtonReport.CommandArgument.ToString() == null || LinkButtonReport.CommandArgument.ToString() == "" || linkButtonInvoice.CommandArgument.ToString() == null)
                    {
                        linkButtonInvoice.Visible = false;
                        LinkButtonReport.Visible = false;
                        UploadInstallaionInvoice.Visible = false;
                        UploadManufacturingReport.Visible = false;
                        Grid_MultipleInspectionTR.Columns[8].Visible = false;
                        Grid_MultipleInspectionTR.Columns[9].Visible = false;
                    }
                    else
                    {
                        linkButtonInvoice.Visible = true;
                        LinkButtonReport.Visible = true;
                        UploadInstallaionInvoice.Visible = true;
                        UploadManufacturingReport.Visible = true;
                        Grid_MultipleInspectionTR.Columns[8].Visible = true;
                        Grid_MultipleInspectionTR.Columns[9].Visible = true;

                    }
                    var returnedReason = DataBinder.Eval(e.Row.DataItem, "ReturnedReason") as string;

                    var fileUploadInstallaionInvoice = e.Row.FindControl("FileUploadInstallaionInvoice") as FileUpload;
                    var fileUploadManufacturingReport = e.Row.FindControl("FileUploadManufacturingReport") as FileUpload;

                    if (fileUploadInstallaionInvoice != null && fileUploadManufacturingReport != null)
                    {
                        fileUploadInstallaionInvoice.Visible = !string.IsNullOrEmpty(returnedReason);
                        fileUploadManufacturingReport.Visible = !string.IsNullOrEmpty(returnedReason);


                        if (!string.IsNullOrEmpty(LinkButtonReport.CommandArgument) &&
                            string.IsNullOrEmpty(linkButtonInvoice.CommandArgument))
                        {
                            fileUploadInstallaionInvoice.Visible = false;
                            fileUploadManufacturingReport.Visible = !string.IsNullOrEmpty(returnedReason);
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert()", "alert('" + ex.Message.ToString() + "')", true);
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {

            if (Convert.ToString(Session["SiteOwnerId"]) != null && !string.IsNullOrEmpty(Convert.ToString(Session["SiteOwnerId"]).ToString()))
            {
                Response.Redirect("~/SiteOwnerPages/ReturnInspections.aspx", false);
            }
            else
            {
                Session["SiteOwnerId"] = "";
                Response.Redirect("/SiteOwnerLogout.aspx", false);
            }
        }
        protected void grd_Documemnts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            {
                string fileName = "";
                try
                {
                    if (e.CommandName == "Select")
                    {
                        //fileName = "https://uat.ceiharyana.com" + e.CommandArgument.ToString();
                        fileName = "https://uat.ceiharyana.com" + e.CommandArgument.ToString();
                        string script = $@"<script>window.open('{fileName}','_blank');</script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "OpenFileInNewTab", script);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert()", "alert('" + ex.Message.ToString() + "')", true);
                }
            }
        }
        protected void Grid_MultipleInspectionTR_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (Convert.ToString(Session["SiteOwnerId"]) == hnOwnerId.Value)
                {
                    string Count = string.Empty;
                    string IntimationId = string.Empty;
                    if (e.CommandName == "Select")
                    {
                        Control ctrl = e.CommandSource as Control;
                        GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
                        Label LblInstallationName = (Label)row.FindControl("LblInstallationName");
                        Label LblTestReportCount = (Label)row.FindControl("LblTestReportCount");
                        Count = LblTestReportCount.Text.Trim();

                        Label LblIntimationId = (Label)row.FindControl("LblIntimationId");
                        IntimationId = LblIntimationId.Text.Trim();

                        DataSet ds = new DataSet();
                        ds = CEI.GetData(LblInstallationName.Text.Trim(), IntimationId, Count);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (LblInstallationName.Text.Trim() == "Line")
                            {
                                Session["LineID"] = ds.Tables[0].Rows[0]["TestReportId"].ToString();

                                Response.Redirect("/TestReportModal/LineTestReportModal.aspx", false);
                            }
                            else if (LblInstallationName.Text.Trim() == "Substation Transformer")
                            {
                                Session["SubStationID"] = ds.Tables[0].Rows[0]["TestReportId"].ToString();
                                Response.Redirect("/TestReportModal/SubstationTransformerTestReportModal.aspx", false);
                            }
                            else if (LblInstallationName.Text.Trim() == "Generating Set")
                            {
                                Session["GeneratingSetId"] = ds.Tables[0].Rows[0]["TestReportId"].ToString();
                                Response.Redirect("/TestReportModal/GeneratingSetTestReportModal.aspx", false);

                            }
                            else if (LblInstallationName.Text.Trim().Equals("Switching Station", StringComparison.InvariantCultureIgnoreCase))
                            {
                                SwitchingSubstationComponent obj = new SwitchingSubstationComponent()
                                {
                                    TestReportId = ds.Tables[0].Rows[0]["TestReportId"].ToString(),
                                    Approval = Session["Approval"].ToString(),
                                };
                                string json = JsonConvert.SerializeObject(obj);
                                string token = CryptoHelper.Encrypt(json);
                                Response.Redirect("/TestReportModal/SwitchingSubstationTestReportModal.aspx?d=" + token, false);
                            }
                        }
                    }

                    else if (e.CommandName == "View")
                    {
                        string fileName = "";
                        fileName = "https://uat.ceiharyana.com" + e.CommandArgument.ToString();
                        //fileName = "https://uat.ceiharyana.com" + e.CommandArgument.ToString();
                        string script = $@"<script>window.open('{fileName}','_blank');</script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "OpenFileInNewTab", script);
                    }
                    else if (e.CommandName == "ViewInvoice")
                    {
                        string fileName = "";
                        //fileName = "https://uat.ceiharyana.com" + e.CommandArgument.ToString();
                        fileName = "https://uat.ceiharyana.com" + e.CommandArgument.ToString();
                        string script = $@"<script>window.open('{fileName}','_blank');</script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "OpenFileInNewTab", script);
                    }
                }
                else
                {
                    Session["SiteOwnerId"] = "";
                    Response.Redirect("/SiteOwnerLogout.aspx", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert()", "alert('" + ex.Message.ToString() + "')", true);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int Count = Convert.ToInt32(CEI.ToChecktheCountOfReturnedInspection(Convert.ToInt32(txtInspectionId.Text)));
                if (Count == 0)
                {
                    if (Convert.ToString(Session["SiteOwnerId"]) == hnOwnerId.Value && txtInspectionId.Text != null && !string.IsNullOrEmpty(txtInspectionId.Text))
                {
                    int ClickCount = 0;
                    ClickCount = Convert.ToInt32(Session["ClickCount"]);
                    if (ClickCount < 1)
                    { 
                        SiteOwnerID = hnOwnerId.Value;
                     
                        if (INgridfileuploadValidation(hnReturnStatus.Value)) //check validation for document
                        {
                            string ReturnType = hnReturnStatus.Value;
                            if (ReturnType == "1")
                            {
                                foreach (GridViewRow row in grd_Documemnts.Rows)
                                {
                                    FileUpload fileUpload = (FileUpload)row.FindControl("FileUpload1");
                                    Label lblDocumentName = (Label)row.FindControl("lblDocumentName");

                                    if (lblDocumentName != null && lblDocumentName.Text.Trim() == "Other Document")
                                    {
                                        if (fileUpload != null && fileUpload.HasFile)
                                        {
                                            ValidatePdfFile(fileUpload);
                                        }
                                    }
                                    else
                                    {
                                        if (fileUpload.HasFile)   
                                        {
                                            ValidatePdfFile(fileUpload);
                                        }
                                    }
                                }
                            }
                            else if (ReturnType == "2")
                            {
                                foreach (GridViewRow row in Grid_MultipleInspectionTR.Rows)
                                {
                                    FileUpload fileUploadInvoice = (FileUpload)row.FindControl("FileUploadInstallaionInvoice");
                                    FileUpload fileUploadManufacturing = (FileUpload)row.FindControl("FileUploadManufacturingReport");
                                    if (fileUploadInvoice.HasFile && fileUploadManufacturing.HasFile)
                                    {
                                        ValidatePdfFile(fileUploadInvoice);
                                        ValidatePdfFile(fileUploadManufacturing);
                                    }
                                    
                                }
                            }
                            else
                            {
                                foreach (GridViewRow row in grd_Documemnts.Rows)
                                {
                                    FileUpload fileUpload = (FileUpload)row.FindControl("FileUpload1");
                                    Label lblDocumentName = (Label)row.FindControl("lblDocumentName");

                                    if (lblDocumentName != null && lblDocumentName.Text.Trim() == "Other Document")
                                    {
                                        if (fileUpload != null && fileUpload.HasFile)
                                        {
                                            ValidatePdfFile(fileUpload);

                                        }
                                    }
                                    else
                                    {
                                        if (fileUpload.HasFile)  
                                        {
                                            ValidatePdfFile(fileUpload);
                                        }
                                    }
                                }
                                foreach (GridViewRow row in Grid_MultipleInspectionTR.Rows)
                                {
                                    FileUpload fileUploadInvoice = (FileUpload)row.FindControl("FileUploadInstallaionInvoice");
                                    FileUpload fileUploadManufacturing = (FileUpload)row.FindControl("FileUploadManufacturingReport");
                                    if (fileUploadInvoice.HasFile && fileUploadManufacturing.HasFile)
                                    {
                                        ValidatePdfFile(fileUploadInvoice);
                                        ValidatePdfFile(fileUploadManufacturing);
                                    }
                                  
                                }
                            }
                            SqlTransaction transaction = null;
                            try
                            {
                                ClickCount = ClickCount + 1;
                                Session["ClickCount"] = ClickCount;
                                string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ToString();
                                using (SqlConnection connection = new SqlConnection(connectionString))
                                {
                                    connection.Open();
                                    transaction = connection.BeginTransaction();

                                    CEI.UpdateReturnedInspectionReport(txtInspectionId.Text, SiteOwnerID, transaction);
                                    if (Convert.ToString(ReturnType) == "1") //Update Checklist Documents
                                    {

                                        foreach (GridViewRow row in grd_Documemnts.Rows)
                                        {
                                            Label LblInstallationType = (Label)row.FindControl("LblInstallationType");
                                            Label LblDocumentID = (Label)row.FindControl("LblDocumentID");
                                            Label LblDocumentName = (Label)row.FindControl("LblDocumentName");
                                            Label LblFileName = (Label)row.FindControl("LblFileName");
                                            Label LblReturnedReason = (Label)row.FindControl("LblReturnedReason");


                                            string fileName = LblFileName.Text;
                                            string fileNameWithoutExtension = fileName;
                                            int index = fileName.IndexOf(".pdf");
                                            if (index > 0)
                                            {
                                                fileNameWithoutExtension = fileName.Substring(0, index);
                                            }

                                            if (!string.IsNullOrEmpty(LblReturnedReason.Text))
                                            {
                                                string returnedReason = (row.FindControl("LblReturnedReason") as Label)?.Text;
                                                FileUpload fileUploadDoc = row.FindControl("FileUpload1") as FileUpload;

                                                if ((fileUploadDoc != null && fileUploadDoc.HasFile))
                                                {
                                                    //string FileName1 = Path.GetFileName(fileUploadDoc.PostedFile.FileName);

                                                    if (!Directory.Exists(Server.MapPath("/Attachment/" + SiteOwnerID + "/" + txtInspectionId.Text + "/" + "CheckListDocuments" + "/")))
                                                    {
                                                        Directory.CreateDirectory(Server.MapPath("~/Attachment/" + SiteOwnerID + "/" + txtInspectionId.Text + "/" + "CheckListDocuments" + "/")); //removed fileNameWithoutExtension + "/"
                                                    }
                                                    string path = "";
                                                    path = "/Attachment/" + SiteOwnerID + "/" + txtInspectionId.Text + "/" + "CheckListDocuments";  //+ "/" + fileNameWithoutExtension
                                                    string fileName1 = fileNameWithoutExtension + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
                                                    string filePathInfo = "";
                                                    filePathInfo = Server.MapPath(path + "/" + fileName1);
                                                    fileUploadDoc.PostedFile.SaveAs(filePathInfo);
                                                    CEI.UploadDocumentforReturnedInspection(txtInspectionId.Text, LblInstallationType.Text, LblDocumentID.Text, LblDocumentName.Text, LblFileName.Text, path + "/" + fileName1, SiteOwnerID, transaction);

                                                }
                                                else
                                                {
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Please upload all required documents.');", true);
                                                    return; // Stops further processing if validation fails
                                                }
                                            }
                                        }

                                    }
                                    else if (Convert.ToString(ReturnType) == "2" && Convert.ToString(ReturnType) != null) //Update TestReport Documents
                                    {
                                        foreach (GridViewRow row in Grid_MultipleInspectionTR.Rows)
                                        {

                                            Label LblRowid = (Label)row.FindControl("LblRowid");
                                            Label LblIntimationId = (Label)row.FindControl("LblIntimationId");
                                            Label LblInstallationName = (Label)row.FindControl("LblInstallationName");
                                            Label LblTestReportCount = (Label)row.FindControl("LblTestReportCount");
                                            Label LblInspectionId = (Label)row.FindControl("LblInspectionId");
                                            Label LblTestReportId = (Label)row.FindControl("LblTestReportId");
                                            Label LblinstallaionInvoicePath = (Label)row.FindControl("LblinstallaionInvoicePath");
                                            Label LblManufacturingReportPath = (Label)row.FindControl("LblManufacturingReportPath");

                                            Label LblReturnedReason = (Label)row.FindControl("LblReturnedReason");
                                            if (!string.IsNullOrEmpty(LblReturnedReason.Text))
                                            {
                                                string returnedReason = (row.FindControl("ReturnedReason") as Label)?.Text;
                                                FileUpload fileUploadInvoice = row.FindControl("FileUploadInstallaionInvoice") as FileUpload;
                                                FileUpload fileUploadReport = row.FindControl("FileUploadManufacturingReport") as FileUpload;

                                                if ((fileUploadInvoice != null && fileUploadInvoice.HasFile) && (fileUploadReport != null && fileUploadReport.HasFile))
                                                {
                                                    if (!Directory.Exists(Server.MapPath("~/Attachment/" + SiteOwnerID + "/" + LblInspectionId.Text + "/" + "TestReportDocuments" + "/")))
                                                    {
                                                        Directory.CreateDirectory(Server.MapPath("~/Attachment/" + SiteOwnerID + "/" + LblInspectionId.Text + "/" + "TestReportDocuments" + "/"));
                                                    }
                                                    string path = "";
                                                    path = "/Attachment/" + SiteOwnerID + "/" + LblInspectionId.Text + "/" + "TestReportDocuments";//one "/" removed from here
                                                    string fileName1 = "InstallaionInvoice" + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
                                                    string fileName2 = "ManufacturingReport" + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
                                                    string filePathInfo = "";
                                                    string filePatnInfo1 = "";
                                                    filePathInfo = Server.MapPath(path + "/" + fileName1);
                                                    fileUploadInvoice.PostedFile.SaveAs(filePathInfo);
                                                    filePatnInfo1 = Server.MapPath(path + "/" + fileName2);
                                                    fileUploadReport.PostedFile.SaveAs(filePatnInfo1);
                                                    CEI.InsertReturnedInspectionTestReportAttachments(LblRowid.Text, txtInspectionId.Text, path + "/" + fileName1, path + "/" + fileName2, LblInstallationName.Text, SiteOwnerID, transaction);
                                                }
                                                else
                                                {

                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Please upload all required documents.');", true);
                                                }
                                            }


                                        }

                                    }
                                    else if (Convert.ToString(ReturnType) == "3" && Convert.ToString(ReturnType) != null) //Update both Documents
                                    {
                                        foreach (GridViewRow row in grd_Documemnts.Rows)
                                        {
                                            Label LblInstallationType = (Label)row.FindControl("LblInstallationType");
                                            Label LblDocumentID = (Label)row.FindControl("LblDocumentID");
                                            Label LblDocumentName = (Label)row.FindControl("LblDocumentName");
                                            Label LblFileName = (Label)row.FindControl("LblFileName");
                                            Label LblReturnedReason = (Label)row.FindControl("LblReturnedReason");


                                            string fileName = LblFileName.Text;
                                            string fileNameWithoutExtension = fileName;
                                            int index = fileName.IndexOf(".pdf");
                                            if (index > 0)
                                            {
                                                fileNameWithoutExtension = fileName.Substring(0, index);
                                            }



                                            if (!string.IsNullOrEmpty(LblReturnedReason.Text))
                                            {
                                                string returnedReason = (row.FindControl("LblReturnedReason") as Label)?.Text;
                                                FileUpload fileUploadDoc = row.FindControl("FileUpload1") as FileUpload;

                                                if ((fileUploadDoc != null && fileUploadDoc.HasFile))
                                                {
                                                    //string FileName1 = Path.GetFileName(fileUploadDoc.PostedFile.FileName);

                                                    if (!Directory.Exists(Server.MapPath("/Attachment/" + SiteOwnerID + "/" + txtInspectionId.Text + "/" + "CheckListDocuments" + "/")))
                                                    {
                                                        Directory.CreateDirectory(Server.MapPath("~/Attachment/" + SiteOwnerID + "/" + txtInspectionId.Text + "/" + "CheckListDocuments" + "/")); //removed fileNameWithoutExtension + "/"
                                                    }
                                                    string path = "";
                                                    path = "/Attachment/" + SiteOwnerID + "/" + txtInspectionId.Text + "/" + "CheckListDocuments";  //+ "/" + fileNameWithoutExtension
                                                    string fileName1 = fileNameWithoutExtension + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
                                                    string filePathInfo = "";
                                                    filePathInfo = Server.MapPath(path + "/" + fileName1);
                                                    fileUploadDoc.PostedFile.SaveAs(filePathInfo);
                                                    CEI.UploadDocumentforReturnedInspection(txtInspectionId.Text, LblInstallationType.Text, LblDocumentID.Text, LblDocumentName.Text, LblFileName.Text, path + "/" + fileName1, SiteOwnerID, transaction);

                                                }
                                                else
                                                {
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Please upload all required documents.');", true);
                                                    return; // Stops further processing if validation fails
                                                }
                                            }
                                        }

                                        // Process the second GridView
                                        foreach (GridViewRow row in Grid_MultipleInspectionTR.Rows)
                                        {

                                            Label LblRowid = (Label)row.FindControl("LblRowid");
                                            Label LblIntimationId = (Label)row.FindControl("LblIntimationId");
                                            Label LblInstallationName = (Label)row.FindControl("LblInstallationName");
                                            Label LblTestReportCount = (Label)row.FindControl("LblTestReportCount");
                                            Label LblInspectionId = (Label)row.FindControl("LblInspectionId");
                                            Label LblTestReportId = (Label)row.FindControl("LblTestReportId");
                                            Label LblinstallaionInvoicePath = (Label)row.FindControl("LblinstallaionInvoicePath");
                                            Label LblManufacturingReportPath = (Label)row.FindControl("LblManufacturingReportPath");

                                            Label LblReturnedReason = (Label)row.FindControl("LblReturnedReason");
                                            if (!string.IsNullOrEmpty(LblReturnedReason.Text))
                                            {
                                                string returnedReason = (row.FindControl("ReturnedReason") as Label)?.Text;
                                                FileUpload fileUploadInvoice = row.FindControl("FileUploadInstallaionInvoice") as FileUpload;
                                                FileUpload fileUploadReport = row.FindControl("FileUploadManufacturingReport") as FileUpload;

                                                if ((fileUploadInvoice != null && fileUploadInvoice.HasFile) && (fileUploadReport != null && fileUploadReport.HasFile))
                                                {

                                                    if (!Directory.Exists(Server.MapPath("~/Attachment/" + SiteOwnerID + "/" + LblInspectionId.Text + "/" + "TestReportDocuments" + "/")))
                                                    {
                                                        Directory.CreateDirectory(Server.MapPath("~/Attachment/" + SiteOwnerID + "/" + LblInspectionId.Text + "/" + "TestReportDocuments" + "/"));
                                                    }
                                                    string path = "";
                                                    path = "/Attachment/" + SiteOwnerID + "/" + LblInspectionId.Text + "/" + "TestReportDocuments";//one "/" removed from here
                                                    string fileName1 = "InstallaionInvoice" + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
                                                    string fileName2 = "ManufacturingReport" + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".pdf";
                                                    string filePathInfo = "";
                                                    string filePathInfo1 = "";
                                                    filePathInfo = Server.MapPath(path + "/" + fileName1);
                                                    fileUploadInvoice.PostedFile.SaveAs(filePathInfo);
                                                    filePathInfo1 = Server.MapPath(path + "/" + fileName2);
                                                    fileUploadReport.PostedFile.SaveAs(filePathInfo);
                                                    CEI.InsertReturnedInspectionTestReportAttachments(LblRowid.Text, txtInspectionId.Text, path + "/" + fileName1, path + "/" + fileName2, LblInstallationName.Text, SiteOwnerID, transaction);
                                                }
                                                else
                                                {
                                                    //throw new Exception("Please Upload  Files in upload section and in .pdf format.");
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Please upload all required documents for rows.');", true);
                                                    return;
                                                }
                                            }

                                        }
                                    }

                                    transaction.Commit();                             
                                    string script = $"alert('Inspection Request Re-Submitted Successfully, forwarding to concerned officer..'); window.location='/SiteOwnerPages/ReturnInspections.aspx';";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertRedirect", script, true);
                                }
                            }
                            catch (Exception ex)
                            {

                                transaction.Rollback();
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Please upload all required documents.');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorMessage", "alert('You double click on Button.'); window.location='InspectionHistory.aspx'", true);
                    }

                }
                else
                {
                    Session["SiteOwnerId"] = "";
                    Response.Redirect("/SiteOwnerLogout.aspx", false);
                }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your inspection is not in Return status, so you can't allow to Re-submit the inspection.');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert()", "alert('" + ex.Message.ToString() + "')", true);
                return;
            }
        }


        private bool INgridfileuploadValidation(string ReturnType)
        {
            int flag = 0;
            if (Convert.ToString(ReturnType) != null && Convert.ToString(ReturnType) == "1")
            {
                foreach (GridViewRow row in grd_Documemnts.Rows)
                {
                    string returnedReason = (row.FindControl("LblReturnedReason") as Label)?.Text;
                    FileUpload fileUploadControl = row.FindControl("FileUpload1") as FileUpload;

                    if (!string.IsNullOrEmpty(returnedReason) && (fileUploadControl == null || !fileUploadControl.HasFile))
                    {
                        flag = 1;
                        break;
                    }
                }
            }
            else
            if (Convert.ToString(ReturnType) != null && Convert.ToString(ReturnType) == "2")
            {
                foreach (GridViewRow row in Grid_MultipleInspectionTR.Rows)
                {
                    string returnedReason = (row.FindControl("LblReturnedReason") as Label)?.Text;
                    FileUpload fileUploadInvoice = row.FindControl("FileUploadInstallaionInvoice") as FileUpload;
                    FileUpload fileUploadReport = row.FindControl("FileUploadManufacturingReport") as FileUpload;

                        //if (!string.IsNullOrEmpty(returnedReason) &&
                        //    ((fileUploadInvoice == null || !fileUploadInvoice.HasFile) ||
                        //     (fileUploadReport == null || !fileUploadReport.HasFile)))
                        //{
                        //    flag = 1;
                        //    break;
                        //}
                        //Logic Added For Switching.
                        string invoicePath = (row.FindControl("LblinstallaionInvoicePath") as Label)?.Text;
                        string reportPath = (row.FindControl("LblManufacturingReportPath") as Label)?.Text;

                        bool isSwitching = !string.IsNullOrEmpty(reportPath) &&
                                           string.IsNullOrEmpty(invoicePath);

                        if (!string.IsNullOrEmpty(returnedReason) &&
                            (isSwitching
                                ? (fileUploadReport == null || !fileUploadReport.HasFile)
                                : ((fileUploadInvoice == null || !fileUploadInvoice.HasFile) ||
                                   (fileUploadReport == null || !fileUploadReport.HasFile))))
                        {
                            flag = 1;
                            break;
                        }

                    }
            }
            else
            if (Convert.ToString(ReturnType) != null && Convert.ToString(ReturnType) == "3")
            {
                foreach (GridViewRow row in grd_Documemnts.Rows)
                {
                    string returnedReason = (row.FindControl("LblReturnedReason") as Label)?.Text;
                    FileUpload fileUploadControl = row.FindControl("FileUpload1") as FileUpload;

                    if (!string.IsNullOrEmpty(returnedReason) && (fileUploadControl == null || !fileUploadControl.HasFile))
                    {
                        flag = 1;
                        break;
                    }
                }
                foreach (GridViewRow row in Grid_MultipleInspectionTR.Rows)
                {
                    string returnedReason = (row.FindControl("LblReturnedReason") as Label)?.Text;
                    FileUpload fileUploadInvoice = row.FindControl("FileUploadInstallaionInvoice") as FileUpload;
                    FileUpload fileUploadReport = row.FindControl("FileUploadManufacturingReport") as FileUpload;

                    string invoicePath = (row.FindControl("LblinstallaionInvoicePath") as Label)?.Text;
                    string reportPath = (row.FindControl("LblManufacturingReportPath") as Label)?.Text;
                    bool isSwitching = !string.IsNullOrEmpty(reportPath) &&
                                        string.IsNullOrEmpty(invoicePath);


                    //        if (!string.IsNullOrEmpty(returnedReason) &&
                    //    ((fileUploadInvoice == null || !fileUploadInvoice.HasFile) ||
                    //     (fileUploadReport == null || !fileUploadReport.HasFile)))
                    //{

                    //    flag = 1;
                    //    break;
                    //}
                    //Logic Added For Switching.
                    if (!string.IsNullOrEmpty(returnedReason) &&
                        (isSwitching
                            ? (fileUploadReport == null || !fileUploadReport.HasFile)
                            : ((fileUploadInvoice == null || !fileUploadInvoice.HasFile) ||
                                (fileUploadReport == null || !fileUploadReport.HasFile))))
                    {
                        flag = 1;
                        break;
                    }

                        }
            }
            else
            {
                flag = 1;
            }

            if (flag == 1)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        private void ValidatePdfFile(FileUpload fileUpload)
        {

            string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
            if (fileExtension != ".pdf")
            {
                throw new Exception("Please upload PDF files only.");

            }

            if (fileUpload.PostedFile.ContentLength > 1048576)
            {
                throw new Exception("Please upload PDF files less than 1 MB only.");

            }
        }


        protected void grd_Documemnts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var returnedReason = DataBinder.Eval(e.Row.DataItem, "ReturnedReason") as string;

                var fileUpload = e.Row.FindControl("FileUpload1") as FileUpload;

                if (fileUpload != null)
                {
                    fileUpload.Visible = !string.IsNullOrEmpty(returnedReason);
                }
            }
        }
        protected void lnkReturn_Command(object sender, CommandEventArgs e)
        {
            string[] args = e.CommandArgument.ToString().Split(',');
            string inspectionId = args[0];
            string inspectionCount = args.Length > 1 ? args[1] : "0";
            InspectionReturnDetails.GetReturnDetails(inspectionId, inspectionCount);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowReturnModal", "$('#ownerModal').modal('show');", true);
        }
    }
}