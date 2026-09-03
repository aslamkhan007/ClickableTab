using CEI_PRoject;
using CEIHaryana.Contractor;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace CEIHaryana.TestReportModal
{
    public partial class SubstationTransformerTestReportModal : System.Web.UI.Page
    {
        CEI CEI = new CEI();
        string id = String.Empty;
        private bool isSiteOwnerCase = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Request.UrlReferrer != null)
                    {
                        Session["PreviousPage"] = Request.UrlReferrer.ToString();
                    }

                    if (Session["ContractorID"] != null && Convert.ToString(Session["ContractorID"]) != "")
                    {
                        Session["SubstationOtp"] = "0";
                        ID = Session["SubStationID"].ToString();
                        GetDetailswithId();
                        if (Convert.ToString(Session["Approval"]) == "Pending")
                        {
                            //Contractor.Visible = true;
                            //Contractor3.Visible = true;
                            //CreatedDate.Visible = true;
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
                    //else if (Session["SiteOwnerId_Sld_Indus"] != null && Session["SiteOwnerId_Sld_Indus"].ToString() != "")
                    //{
                    //    if (Request.UrlReferrer != null)
                    //    {
                    //        Session["PreviousPage_Industry"] = Request.UrlReferrer.ToString();
                    //    }
                    //    ID = Session["SubStationID"].ToString();
                    //    GetDetailswithId();
                    //    SiteOwner.Visible = false;
                    //    SiteOwner2.Visible = true;
                    //    IntimationData.Visible = true;
                    //    ApprovalCard.Visible = true;
                    //    //CreatedDate.Visible = true; //Added
                    //    //SubmitDate.Visible = true;
                    //    //SubmitBy.Visible = true;
                    //}
                    //else if (Session["SiteOwnerId_Industry"] != null && Session["SiteOwnerId_Industry"].ToString() != "")
                    //{
                    //    if (Request.UrlReferrer != null)
                    //    {
                    //        Session["PreviousPage_Industry"] = Request.UrlReferrer.ToString();
                    //    }

                    //    ID = Session["SubStationID_Industry"].ToString();
                    //    GetDetailswithId();

                    //    SiteOwner.Visible = false;
                    //    SiteOwner2.Visible = true;
                    //    IntimationData.Visible = true;
                    //    ApprovalCard.Visible = true;
                    //    //CreatedDate.Visible = true; //Added
                    //    //SubmitDate.Visible = true;
                    //    //SubmitBy.Visible = true;
                    //}
                    else if (Session["SiteOwnerId"] != null && Session["SiteOwnerId"].ToString() != "")
                    {
                        ID = Session["SubStationID"].ToString();
                        GetDetailswithId();

                        SiteOwner.Visible = false;
                        SiteOwner2.Visible = true;
                        IntimationData.Visible = true;
                        ApprovalCard.Visible = true;
                        //CreatedDate.Visible = true; //Added
                        //SubmitDate.Visible = true;
                        //SubmitBy.Visible = true;
                    }
                    
                    else if (Session["InspectionTestReportId"] != null && Session["InspectionTestReportId"].ToString() != "")
                    {
                        ID = Session["InspectionTestReportId"].ToString();
                        GetDetailswithId();
                        SiteOwner.Visible = true;
                        IntimationData.Visible = true;
                        ApprovalCard.Visible = true;
                        btnNext.Text = "Back";

                    }
                    else if (Session["IntimationForHistoryId"] != null && Session["IntimationForHistoryId"].ToString() != "")
                    {
                        ID = Session["IntimationForHistoryId"].ToString();
                        GetDetailswithId();
                        IntimationForHistory.Visible = true;
                        IntimationData.Visible = true;
                    }
                    else if (Session["SupervisorID"] != null || Session["AdminID"] != null)
                    { 
                        if (Session["SupervisorID"] != null && Session["SupervisorID"].ToString() != "")
                        {


                        }
                        if (Session["AdminID"] != null)
                        {

                        }
                        ID = Session["SubStationID"].ToString();
                        GetDetailswithId();
                        Supervisor.Visible = true;
                        IntimationData.Visible = true;

                    }

                    if (isSiteOwnerCase)
                    {
                        FullDetailView.Visible = false;
                        SiteOwnerSummaryCard.Visible = true;
                    }
                }
            }
            catch
            {
                Response.Redirect("/SiteOwnerLogout.aspx", false);

            }
        }
        private void GetDocumentUploadData()
        {
            DataTable ds = new DataTable();
            ds = CEI.GetDocumentlistforContractor(2);
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
            ds.Dispose();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "focusGridView", "focusOnGridView();", true);
        }
        public void GetDetailswithId()
        {
            try
            {
                DataSet ds = new DataSet();
                ds = CEI.SubstationTestReportData(ID);

                // ---- Naya check sabse pehle ----
                string createdBy = ds.Tables[0].Rows[0]["ContractorWhoCreated"].ToString().Trim();
                isSiteOwnerCase = (createdBy == "SiteOwner");

                if (isSiteOwnerCase)
                {
                    FullDetailView.Visible = false;
                    SiteOwnerSummaryCard.Visible = true;
                }

                // Approval-status wala part dono cases me common/zaroori hai (BtnSubmit ka text set karta hai)
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

                if (createdBy == "SiteOwner")
                {
                    txtInstallation_SO.Text = ds.Tables[0].Rows[0]["ContractorType"].ToString();
                    txtName_SO.Text = ds.Tables[0].Rows[0]["NameOfOwner"].ToString();
                    txtAddress_SO.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                    txtPhone_SO.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                    TxtPremises_SO.Text = ds.Tables[0].Rows[0]["Permises"].ToString();
                    txtVoltagelevel_SO.Text = ds.Tables[0].Rows[0]["LevelVoltage"].ToString().Trim();

                    txtTransformerSerialNumber_SO.Text = ds.Tables[0].Rows[0]["TransformerSerialNumber"].ToString();
                    txtTransformerCapacityType_SO.Text = ds.Tables[0].Rows[0]["TransformerCapacityType"].ToString();
                    txtTransformerCapacity_SO.Text = ds.Tables[0].Rows[0]["TransformerCapacity"].ToString();
                    txtTransformerType_SO.Text = ds.Tables[0].Rows[0]["TranformerType"].ToString();

                    string namePlatePath = ds.Tables[0].Rows[0]["NamePlateDocument"].ToString();
                    if (!string.IsNullOrEmpty(namePlatePath))
                    {
                        Div_NamePlateDocument_SO.Visible = true;
                        HyperLink_NamePlate_SO.NavigateUrl = ResolveUrl(namePlatePath);
                    }
                    string sitePhotoPath = ds.Tables[0].Rows[0]["SitephotographDocument"].ToString();
                    if (!string.IsNullOrEmpty(sitePhotoPath))
                    {
                        Div_SitePhotograph_SO.Visible = true;
                        HyperLink_SitePhotograph_SO.NavigateUrl = ResolveUrl(sitePhotoPath);
                    }

                    lblIntimationId_SO.Text = ds.Tables[0].Rows[0]["WorkIntimationId"].ToString();
                    txtSubmitteddate_SO.Text = ds.Tables[0].Rows[0]["SubmittedDate"].ToString();
                    lblReportNo_SO.Text = ds.Tables[0].Rows[0]["TestReportId"].ToString();

                    DateTime createdDateSO = Convert.ToDateTime(ds.Tables[0].Rows[0]["SubmittedDate"]);
                    txtCreatedDate_SO.Text = createdDateSO.ToString("dd-MM-yyyy");

                    txtPreparedby_SO.Text = ds.Tables[0].Rows[0]["SupervisorWhoCreated"].ToString();
                    txtApprovalDate_SO.Text = ds.Tables[0].Rows[0]["ApprovalDate"].ToString();

                    SiteOwnerSummaryCard.Visible = true;

                    // ⚠️ Ye session values BtnVerify_Click / BtnSubmit_Click me use hoti hain,
                    // isliye inko yahan bhi set karna zaroori hai warna OTP / Submit flow tootega
                    Session["TestReportIds"] = lblReportNo_SO.Text.Trim();
                    Session["Contact"] = ds.Tables[0].Rows[0]["ContractorContactNo"].ToString();
                    Session["Email"] = ds.Tables[0].Rows[0]["ContractorEmail"].ToString();
                    Session["InspectionType"] = ds.Tables[0].Rows[0]["Inspectiontype"].ToString();
                }
                else
                {
                    //EXISTING CODE
                    string dp_Id = ds.Tables[0].Rows[0]["ContractorType"].ToString();
                    txtInstallation.Text = dp_Id;
                    if (dp_Id == "Firm/Company")
                    {
                        agency.Visible = true;
                        individual.Visible = false;
                    }
                    else
                    {
                        individual.Visible = true;
                        agency.Visible = false;
                    }
                    Session["InspectionType"] = ds.Tables[0].Rows[0]["InspectionType"].ToString();               
                    txtSubmitteddate.Text = ds.Tables[0].Rows[0]["SubmittedDate"].ToString();
                    txtSubmittedBy.Text = ds.Tables[0].Rows[0]["ContractorWhoCreated"].ToString();
                    txtName.Text = ds.Tables[0].Rows[0]["NameOfOwner"].ToString();
                    txtagency.Text = ds.Tables[0].Rows[0]["NameOfAgency"].ToString();
                    txtPhone.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                    txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                    string dp_Id1 = ds.Tables[0].Rows[0]["Permises"].ToString();
                    TxtPremises.Text = dp_Id1;
                    //string dp_Id2 = ds.Tables[0].Rows[0]["OtherPremises"].ToString();
                    //string dp_Id3 = ds.Tables[0].Rows[0]["VoltageLevel"].ToString().Trim();
                    string dp_Id3 = ds.Tables[0].Rows[0]["LevelVoltage"].ToString().Trim();
                    txtVoltagelevel.Text = dp_Id3;
                    string dp_Id4 = ds.Tables[0].Rows[0]["WorkStartDate"].ToString();


                    if (!string.IsNullOrWhiteSpace(dp_Id4))
                    {
                        txtStartDate.Text = DateTime.Parse(dp_Id4).ToString("dd-MM-yyyy");

                    }
                    else
                    {
                        txtStartDate.Text = string.Empty;
                    }
                    //added by gurmeet 18feb 2025
                    TestReportDocument.Visible = false;
                    string NamePlateDocumentPath = ds.Tables[0].Rows[0]["NamePlateDocument"].ToString();
                    if (!string.IsNullOrEmpty(NamePlateDocumentPath))
                    {
                        TestReportDocument.Visible = true;
                        Div_NamePlateDocument.Visible = true;
                        HyperLink_NamePlate.NavigateUrl = ResolveUrl(NamePlateDocumentPath); //open certificate
                    }
                    string SitePhotographDocumentPath = ds.Tables[0].Rows[0]["SitephotographDocument"].ToString();
                    if (!string.IsNullOrEmpty(SitePhotographDocumentPath))
                    {
                        TestReportDocument.Visible = true;
                        Div_SitePhotograph.Visible = true;
                        HyperLink_SitePhotograph.NavigateUrl = ResolveUrl(SitePhotographDocumentPath); //open certificate
                    }
                    //End here 


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

                    txtTransformerSerialNumber.Text = ds.Tables[0].Rows[0]["TransformerSerialNumber"].ToString();
                    txtTransformerCapacityType.Text = ds.Tables[0].Rows[0]["TransformerCapacityType"].ToString();
                    txtTransformerType.Text = ds.Tables[0].Rows[0]["TranformerType"].ToString();
                    //TextStatus.Text = ds.Tables[0].Rows[0]["ApprovedOrRejectFromContractor"].ToString();
                    //TextReject.Text = ds.Tables[0].Rows[0]["ReasonForRejection"].ToString();
                    DateTime createdDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["SubmittedDate"]);
                    txtCreatedDate.Text = createdDate.ToString("dd-MM-yyyy");
                    if (txtTransformerType.Text.Trim() == "Oil")
                    {
                        InCaseOfOil.Visible = true;
                        Capacity.Visible = true;
                        BDV.Visible = true;
                    }
                    else
                    {
                        InCaseOfOil.Visible = true;
                        Capacity.Visible = false;
                        BDV.Visible = false;
                    }
                    if (txtTransformerCapacity.Text == "KVA")
                    {
                        if (int.TryParse(txtTransformerCapacity.Text, out int value))
                        {
                            if (value >= 1000)
                            {
                                TypeOfHTBreaker.Visible = true;
                                ddlBreaker.Visible = true;
                                txtHTType.Visible = false;
                            }
                            else
                            {
                                ddlBreaker.Visible = false;
                                txtHTType.Visible = true;
                                TypeOfHTBreaker.Visible = false;
                            }
                        }
                    }
                    txtHTType.Text = ds.Tables[0].Rows[0]["TypeofHTPrimarySideSwitch"].ToString();
                    if (txtHTType.Text == "Breaker")
                    {
                        TypeOfHTBreaker.Visible = true;
                        Breaker.Visible = true;
                    }
                    txtTransformerCapacity.Text = ds.Tables[0].Rows[0]["TransformerCapacity"].ToString();
                    txtTransformerType.Text = ds.Tables[0].Rows[0]["TranformerType"].ToString();
                    txtPrimaryVoltage.Text = ds.Tables[0].Rows[0]["PrimaryVoltage"].ToString();
                    txtSecondryVoltage.Text = ds.Tables[0].Rows[0]["SecondoryVoltage"].ToString();
                    txtOilCapacity.Text = ds.Tables[0].Rows[0]["OilCapacity"].ToString();
                    txtOilBDV.Text = ds.Tables[0].Rows[0]["BreakDownVoltageofOil"].ToString();
                    txtHTsideInsulation.Text = ds.Tables[0].Rows[0]["HtInsulationHVEarth"].ToString();
                    txtLTSideInsulation.Text = ds.Tables[0].Rows[0]["LtInsulationLVEarth"].ToString();
                    txtLowestValue.Text = ds.Tables[0].Rows[0]["LowestvaluebetweenHTLTSide"].ToString();
                    txtLightningArrestor.Text = ds.Tables[0].Rows[0]["LightningArrestorLocationOther"].ToString();
                    lbltestReportId.Text = ds.Tables[0].Rows[0]["TestReportId"].ToString();
                    Session["TestReportIds"] = lbltestReportId.Text.Trim();

                    txtEarthing.Text = ds.Tables[0].Rows[0]["NumberOfEarthing"].ToString();
                    SubstationEarthingDiv.Visible = true;
                    if (txtEarthing.Text.Trim() == "4")
                    {
                        EarthingSubstation4.Visible = true;
                    }
                    else if (txtEarthing.Text.Trim() == "5")
                    {
                        EarthingSubstation4.Visible = true;
                        EathingSubstation5.Visible = true;
                    }
                    else if (txtEarthing.Text.Trim() == "6")
                    {
                        EarthingSubstation4.Visible = true;
                        EathingSubstation5.Visible = true;
                        EathingSubstation6.Visible = true;
                    }
                    else if (txtEarthing.Text.Trim() == "7")
                    {
                        EarthingSubstation4.Visible = true;
                        EathingSubstation5.Visible = true;
                        EathingSubstation6.Visible = true;
                        EathingSubstation7.Visible = true;
                    }
                    else if (txtEarthing.Text.Trim() == "8")
                    {
                        EarthingSubstation4.Visible = true;
                        EathingSubstation5.Visible = true;
                        EathingSubstation6.Visible = true;
                        EathingSubstation7.Visible = true;
                        EathingSubstation8.Visible = true;
                    }
                    else if (txtEarthing.Text.Trim() == "9")
                    {
                        EarthingSubstation4.Visible = true;
                        EathingSubstation5.Visible = true;
                        EathingSubstation6.Visible = true;
                        EathingSubstation7.Visible = true;
                        EathingSubstation8.Visible = true;
                        EathingSubstation9.Visible = true;
                    }
                    else if (txtEarthing.Text.Trim() == "10")
                    {
                        EarthingSubstation4.Visible = true;
                        EathingSubstation5.Visible = true;
                        EathingSubstation6.Visible = true;
                        EathingSubstation7.Visible = true;
                        EathingSubstation8.Visible = true;
                        EathingSubstation9.Visible = true;
                        EathingSubstation10.Visible = true;
                    }
                    else if (txtEarthing.Text.Trim() == "11")
                    {
                        EarthingSubstation4.Visible = true;
                        EathingSubstation5.Visible = true;
                        EathingSubstation6.Visible = true;
                        EathingSubstation7.Visible = true;
                        EathingSubstation8.Visible = true;
                        EathingSubstation9.Visible = true;
                        EathingSubstation10.Visible = true;
                        EathingSubstation11.Visible = true;
                    }
                    else if (txtEarthing.Text.Trim() == "12")
                    {
                        EarthingSubstation4.Visible = true;
                        EathingSubstation5.Visible = true;
                        EathingSubstation6.Visible = true;
                        EathingSubstation7.Visible = true;
                        EathingSubstation8.Visible = true;
                        EathingSubstation9.Visible = true;
                        EathingSubstation10.Visible = true;
                        EathingSubstation11.Visible = true;
                        EathingSubstation12.Visible = true;
                    }
                    else if (txtEarthing.Text.Trim() == "13")
                    {
                        EarthingSubstation4.Visible = true;
                        EathingSubstation5.Visible = true;
                        EathingSubstation6.Visible = true;
                        EathingSubstation7.Visible = true;
                        EathingSubstation8.Visible = true;
                        EathingSubstation9.Visible = true;
                        EathingSubstation10.Visible = true;
                        EathingSubstation11.Visible = true;
                        EathingSubstation12.Visible = true;
                        EathingSubstation13.Visible = true;
                    }
                    else if (txtEarthing.Text.Trim() == "14")
                    {
                        EarthingSubstation4.Visible = true;
                        EathingSubstation5.Visible = true;
                        EathingSubstation6.Visible = true;
                        EathingSubstation7.Visible = true;
                        EathingSubstation8.Visible = true;
                        EathingSubstation9.Visible = true;
                        EathingSubstation10.Visible = true;
                        EathingSubstation11.Visible = true;
                        EathingSubstation12.Visible = true;
                        EathingSubstation13.Visible = true;
                        EathingSubstation14.Visible = true;
                    }
                    else if (txtEarthing.Text.Trim() == "15")
                    {
                        EarthingSubstation4.Visible = true;
                        EathingSubstation5.Visible = true;
                        EathingSubstation6.Visible = true;
                        EathingSubstation7.Visible = true;
                        EathingSubstation8.Visible = true;
                        EathingSubstation9.Visible = true;
                        EathingSubstation10.Visible = true;
                        EathingSubstation11.Visible = true;
                        EathingSubstation12.Visible = true;
                        EathingSubstation13.Visible = true;
                        EathingSubstation14.Visible = true;
                        EathingSubstation15.Visible = true;
                    }
                    else
                    {
                        EarthingSubstation4.Visible = false;
                        EathingSubstation5.Visible = false;
                        EathingSubstation6.Visible = false;
                        EathingSubstation7.Visible = false;
                        EathingSubstation8.Visible = false;
                        EathingSubstation9.Visible = false;
                        EathingSubstation10.Visible = false;
                        EathingSubstation11.Visible = false;
                        EathingSubstation12.Visible = false;
                        EathingSubstation13.Visible = false;
                        EathingSubstation14.Visible = false;
                        EathingSubstation15.Visible = false;

                    }
                    txtEarthingType1.Text = ds.Tables[0].Rows[0]["EarthingType1"].ToString();
                    txtSubstationEarthing1.Text = ds.Tables[0].Rows[0]["Valueinohms1"].ToString();
                    txtUsedFor1.Text = ds.Tables[0].Rows[0]["UsedFor1"].ToString();
                    if (txtUsedFor1.Text == "Other")
                    {
                        txtOtherUsage1.Text = ds.Tables[0].Rows[0]["OtherEarthing1"].ToString();
                        txtOtherUsage1.Visible = true;
                        txtUsedFor1.Visible = false;

                    }
                    txtEarthingType2.Text = ds.Tables[0].Rows[0]["EarthingType2"].ToString();
                    txtSubstationEarthing2.Text = ds.Tables[0].Rows[0]["Valueinohms2"].ToString();
                    txtUsedFor2.Text = ds.Tables[0].Rows[0]["UsedFor2"].ToString();
                    if (txtUsedFor2.Text == "Other")
                    {
                        txtOtherUsage2.Text = ds.Tables[0].Rows[0]["OtherEarthing2"].ToString();
                        txtOtherUsage2.Visible = true;
                        txtUsedFor2.Visible = false;

                    }

                    txtEarthingType3.Text = ds.Tables[0].Rows[0]["EarthingType3"].ToString();
                    txtSubstationEarthing3.Text = ds.Tables[0].Rows[0]["Valueinohms3"].ToString();
                    txtUsedFor3.Text = ds.Tables[0].Rows[0]["UsedFor3"].ToString();
                    if (txtUsedFor3.Text == "Other")
                    {
                        txtOtherUsage3.Text = ds.Tables[0].Rows[0]["OtherEarthing3"].ToString();
                        txtOtherUsage3.Visible = true;
                        txtUsedFor3.Visible = false;

                    }
                    txtEarthingType4.Text = ds.Tables[0].Rows[0]["EarthingType4"].ToString();
                    txtSubstationEarthing4.Text = ds.Tables[0].Rows[0]["Valueinohms4"].ToString();
                    txtUsedFor4.Text = ds.Tables[0].Rows[0]["UsedFor4"].ToString();
                    if (txtUsedFor4.Text == "Other")
                    {
                        txtOtherUsage4.Text = ds.Tables[0].Rows[0]["OtherEarthing4"].ToString();
                        txtOtherUsage4.Visible = true;
                        txtUsedFor4.Visible = false;

                    }
                    txtEarthingType5.Text = ds.Tables[0].Rows[0]["EarthingType5"].ToString();
                    txtSubstationEarthing5.Text = ds.Tables[0].Rows[0]["Valueinohms5"].ToString();
                    txtUsedFor5.Text = ds.Tables[0].Rows[0]["UsedFor5"].ToString();
                    if (txtUsedFor5.Text == "Other")
                    {
                        txtOtherUsage5.Text = ds.Tables[0].Rows[0]["OtherEarthing5"].ToString();
                        txtOtherUsage5.Visible = true;
                        txtUsedFor5.Visible = false;

                    }
                    txtEarthingType6.Text = ds.Tables[0].Rows[0]["EarthingType6"].ToString();
                    txtSubstationEarthing6.Text = ds.Tables[0].Rows[0]["Valueinohms6"].ToString();
                    txtUsedFor6.Text = ds.Tables[0].Rows[0]["UsedFor6"].ToString();
                    if (txtUsedFor6.Text == "Other")
                    {
                        txtOtherUsage6.Text = ds.Tables[0].Rows[0]["OtherEarthing6"].ToString();
                        txtOtherUsage6.Visible = true;
                        txtUsedFor6.Visible = false;

                    }

                    txtEarthingType7.Text = ds.Tables[0].Rows[0]["EarthingType7"].ToString();
                    txtSubstationEarthing7.Text = ds.Tables[0].Rows[0]["Valueinohms7"].ToString();
                    txtUsedFor7.Text = ds.Tables[0].Rows[0]["UsedFor7"].ToString();
                    if (txtUsedFor7.Text == "Other")
                    {
                        txtOtherUsage7.Text = ds.Tables[0].Rows[0]["OtherEarthing7"].ToString();
                        txtOtherUsage7.Visible = true;
                        txtUsedFor7.Visible = false;

                    }

                    txtEarthingType8.Text = ds.Tables[0].Rows[0]["EarthingType8"].ToString();
                    txtSubstationEarthing8.Text = ds.Tables[0].Rows[0]["Valueinohms8"].ToString();
                    txtUsedFor8.Text = ds.Tables[0].Rows[0]["UsedFor8"].ToString();
                    if (txtUsedFor8.Text == "Other")
                    {
                        txtOtherUsage8.Text = ds.Tables[0].Rows[0]["OtherEarthing8"].ToString();
                        txtOtherUsage8.Visible = true;
                        txtUsedFor8.Visible = false;

                    }

                    txtEarthingType9.Text = ds.Tables[0].Rows[0]["EarthingType9"].ToString();
                    txtSubstationEarthing9.Text = ds.Tables[0].Rows[0]["Valueinohms9"].ToString();
                    txtUsedFor9.Text = ds.Tables[0].Rows[0]["UsedFor9"].ToString();
                    if (txtUsedFor9.Text == "Other")
                    {
                        txtOtherUsage9.Text = ds.Tables[0].Rows[0]["OtherEarthing9"].ToString();
                        txtOtherUsage9.Visible = true;
                        txtUsedFor9.Visible = false;

                    }

                    txtEarthingType10.Text = ds.Tables[0].Rows[0]["EarthingType10"].ToString();
                    txtSubstationEarthing10.Text = ds.Tables[0].Rows[0]["Valueinohms10"].ToString();
                    txtUsedFor10.Text = ds.Tables[0].Rows[0]["UsedFor10"].ToString();
                    if (txtUsedFor10.Text == "Other")
                    {
                        txtOtherUsage10.Text = ds.Tables[0].Rows[0]["OtherEarthing10"].ToString();
                        txtOtherUsage10.Visible = true;
                        txtUsedFor10.Visible = false;

                    }

                    txtEarthingType11.Text = ds.Tables[0].Rows[0]["EarthingType11"].ToString();
                    txtSubstationEarthing11.Text = ds.Tables[0].Rows[0]["Valueinohms11"].ToString();
                    txtUsedFor11.Text = ds.Tables[0].Rows[0]["UsedFor11"].ToString();
                    if (txtUsedFor11.Text == "Other")
                    {
                        txtOtherUsage11.Text = ds.Tables[0].Rows[0]["OtherEarthing11"].ToString();
                        txtOtherUsage11.Visible = true;
                        txtUsedFor11.Visible = false;

                    }

                    txtEarthingType12.Text = ds.Tables[0].Rows[0]["EarthingType12"].ToString();
                    txtSubstationEarthing12.Text = ds.Tables[0].Rows[0]["Valueinohms12"].ToString();
                    txtUsedFor12.Text = ds.Tables[0].Rows[0]["UsedFor12"].ToString();
                    if (txtUsedFor12.Text == "Other")
                    {
                        txtOtherUsage12.Text = ds.Tables[0].Rows[0]["OtherEarthing12"].ToString();
                        txtOtherUsage12.Visible = true;
                        txtUsedFor12.Visible = false;

                    }

                    txtEarthingType13.Text = ds.Tables[0].Rows[0]["EarthingType13"].ToString();
                    txtSubstationEarthing13.Text = ds.Tables[0].Rows[0]["Valueinohms13"].ToString();
                    txtUsedFor13.Text = ds.Tables[0].Rows[0]["UsedFor13"].ToString();
                    if (txtUsedFor13.Text == "Other")
                    {
                        txtOtherUsage13.Text = ds.Tables[0].Rows[0]["OtherEarthing13"].ToString();
                        txtOtherUsage13.Visible = true;
                        txtUsedFor13.Visible = false;

                    }

                    txtEarthingType14.Text = ds.Tables[0].Rows[0]["EarthingType14"].ToString();
                    txtSubstationEarthing14.Text = ds.Tables[0].Rows[0]["Valueinohms14"].ToString();
                    txtUsedFor14.Text = ds.Tables[0].Rows[0]["UsedFor14"].ToString();
                    if (txtUsedFor14.Text == "Other")
                    {
                        txtOtherUsage14.Text = ds.Tables[0].Rows[0]["OtherEarthing14"].ToString();
                        txtOtherUsage14.Visible = true;
                        txtUsedFor14.Visible = false;

                    }

                    txtEarthingType15.Text = ds.Tables[0].Rows[0]["EarthingType15"].ToString();
                    txtSubstationEarthing15.Text = ds.Tables[0].Rows[0]["Valueinohms15"].ToString();
                    txtUsedFor15.Text = ds.Tables[0].Rows[0]["UsedFor15"].ToString();
                    if (txtUsedFor15.Text == "Other")
                    {
                        txtOtherUsage15.Text = ds.Tables[0].Rows[0]["OtherEarthing15"].ToString();
                        txtOtherUsage15.Visible = true;
                        txtUsedFor15.Visible = false;

                    }

                    txtBreakerCapacity.Text = ds.Tables[0].Rows[0]["LoadBreakingCapacityOfBreakerInKA"].ToString();
                    txtLTProtection.Text = ds.Tables[0].Rows[0]["TypeOfLTProtection"].ToString();
                    if (txtLTProtection.Text == "Fuse Unit")
                    {

                        TypeOfHTBreaker.Visible = true;
                        FuseUnit.Visible = true;
                        Breaker.Visible = false;

                    }
                    txtIndividualCapacity.Text = ds.Tables[0].Rows[0]["CapacityOfIndividualFuseInAMPS"].ToString();
                    txtLTBreakerCapacity.Text = ds.Tables[0].Rows[0]["CapacityOfLTBreakerInAMPS"].ToString();
                    txtLoadBreakingCapacity.Text = ds.Tables[0].Rows[0]["LoadBreakingCapacityOfBreakerInAMPS"].ToString();
                    txtSealLevelPlinth.Text = ds.Tables[0].Rows[0]["SeaLevelOfTransformerInMeters"].ToString();
                    //txtRejection.Text = ds.Tables[0].Rows[0]["ReasonForRejection"].ToString();
                    Session["Contact"] = ds.Tables[0].Rows[0]["ContractorContactNo"].ToString();
                    Session["Email"] = ds.Tables[0].Rows[0]["ContractorEmail"].ToString();
                    //txtReportNo.Text = ds.Tables[0].Rows[0]["ID"].ToString(); gurmeet to showing new testreportid

                    lbltestReportId.Text = ds.Tables[0].Rows[0]["TestReportId"].ToString();
                    lblWorkIntimationId.Text = ds.Tables[0].Rows[0]["WorkIntimationId"].ToString();
                    lblIntimationId.Text = ds.Tables[0].Rows[0]["WorkIntimationId"].ToString();
                    lblReportNo.Text = ds.Tables[0].Rows[0]["TestReportId"].ToString();
                    //txtReportNo.Text = ds.Tables[0].Rows[0]["SubStationId"].ToString(); 
                    txtPreparedby.Text = ds.Tables[0].Rows[0]["SupervisorWhoCreated"].ToString();

                    Session["InspectionType"] = ds.Tables[0].Rows[0]["Inspectiontype"].ToString();
                    txtApprovalDate.Text = ds.Tables[0].Rows[0]["ApprovalDate"].ToString();
                    txtApprovedBy.Text = ds.Tables[0].Rows[0]["ContractorWhoCreated"].ToString();
                    txtTestReportCount.Text = ds.Tables[0].Rows[0]["Count"].ToString();
                    txtDistrict.Text = ds.Tables[0].Rows[0]["District"].ToString();
                    txtDivision.Text = ds.Tables[0].Rows[0]["Area"].ToString();
                    txtApplicantType.Text = ds.Tables[0].Rows[0]["ApplicantType"].ToString();
                }
            }
            catch
            {
            }
        }
        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (ddlType.SelectedValue == "2")
            //{
            //    Rejection.Visible = true;
            //}
            //else
            //{
            //    Rejection.Visible = false;
            //}
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
                    string TestReportIds = Session["TestReportIds"].ToString();
                    //CEI.UpdateSubstationData(id, Counts, ddlType.SelectedItem.ToString(), txtRejection.Text);
                    if (InspectionType == "Existing")
                    {
                        CEI.InsertExistingInspectionData(lbltestReportId.Text, lblIntimationId.Text, txtTestReportCount.Text, txtApplicantType.Text, "Substation Transformer", txtVoltagelevel.Text.Trim(),
                           txtDistrict.Text, txtDivision.Text, TxtPremises.Text, ContractorId);

                    }
                    if (Session["InspectionType"] != null && Session["InspectionType"].ToString() != "Existing" && txtApplicantType.Text.Trim() != "Power Utility")
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
                                    // Save to InstallationInvoice in first iteration
                                    string InstallationInvoiceFileName = "InstallationInvoice_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + ".pdf";
                                    folderPath = Server.MapPath("~/Attachment/" + "Contractor" + "SubstationTransformer" + TestReportIds + "/InstallationInvoice/");
                                    if (!Directory.Exists(folderPath))
                                    {
                                        Directory.CreateDirectory(folderPath);
                                    }
                                    fullFilePath = Path.Combine(folderPath, InstallationInvoiceFileName);
                                    fileUpload.SaveAs(fullFilePath);
                                    InstallationInvoice = "/Attachment/" + "Contractor" + "SubstationTransformer" + TestReportIds + "/InstallationInvoice/" + InstallationInvoiceFileName;
                                }
                                else if (rowIndex == 2)
                                {
                                    // Save to ManufacturingReport in second iteration
                                    string ManufacturingReportFileName = "ManufacturingReport_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + ".pdf";
                                    folderPath = Server.MapPath("~/Attachment/" + "Contractor" + "SubstationTransformer" + TestReportIds + "/ManufacturingReport/");
                                    if (!Directory.Exists(folderPath))
                                    {
                                        Directory.CreateDirectory(folderPath);
                                    }
                                    fullFilePath = Path.Combine(folderPath, ManufacturingReportFileName);
                                    fileUpload.SaveAs(fullFilePath);
                                    ManufacturingReport = "/Attachment/" + "Contractor" + "SubstationTransformer" + TestReportIds + "/ManufacturingReport/" + ManufacturingReportFileName;
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
                        if (isValid && rowIndex == 2) // Ensure two files have been uploaded
                        {
                            CEI.UpdateSubstationData(id, Counts, InstallationInvoice, ManufacturingReport);
                            Session["InspectionType"] = "";
                            string script = "alert('Test Report Approved Successfully'); window.location='/Contractor/Approved_Test_Reports.aspx';";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
                        }
                        else if (rowIndex < 2)
                        {
                            // Show error if fewer than 2 rows were processed
                            string script = "alert('Please upload documents for both rows.');";
                            ScriptManager.RegisterStartupScript(this, GetType(), "IncompleteUpload", script, true);
                        }
                    }
                    else
                    {
                        CEI.UpdateSubstationDataifExisting(id, Counts);
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
                if ( Session["SubstationOtp"].ToString() == "1")
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
                            //#region Otp bypass
                            //Session["OTP"] = CEI.ValidateOTPthroughEmail("");
                            //txtOtp.Text = "123456";
                            ////txtOtp.Enabled = false;
                            //#endregion
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
                            if (Session["InspectionType"] != null && Session["InspectionType"].ToString() != "Existing" && txtApplicantType.Text.Trim() != "Power Utility")
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showalert()", "alert('An Error Occured, Error :" + ex.Message.ToString() + "')", true);
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
