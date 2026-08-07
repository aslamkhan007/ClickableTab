using CEI_PRoject;
using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEIHaryana.UserPages
{
    public partial class PrintSwitchingSubstationTestReport : System.Web.UI.Page
    {
        CEI CEI = new CEI();
        string TestReportId;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    TestReportId = Session["SwitchingSubstationId"].ToString();
                    GetSwitchingDetailswithId(TestReportId);
                    GetEarthingData(TestReportId);
                }

            }
            catch { }
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

                
                DataSet ds = new DataSet();
                ds = CEI.SwitchingTestReportData(id);
                lblReportNo.Text = id;
                txtInstallation.Text = ds.Tables[0].Rows[0]["ContractorType"].ToString();
                txtName.Text = ds.Tables[0].Rows[0]["NameOfOwner"].ToString();
                txtagency.Text = ds.Tables[0].Rows[0]["NameOfAgency"].ToString();
                txtPhone.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                string dp_Id1 = ds.Tables[0].Rows[0]["Permises"].ToString();
                Session["Email"] = ds.Tables[0].Rows[0]["ContractorEmail"].ToString();
                Session["InspectionType"] = ds.Tables[0].Rows[0]["Inspectiontype"].ToString();
                TxtPremises.Text = dp_Id1;
                //string dp_Id2 = ds.Tables[0].Rows[0]["OtherPremises"].ToString();
                //string dp_Id3 = ds.Tables[0].Rows[0]["VoltageLevel"].ToString().Trim();
                string dp_Id3 = ds.Tables[0].Rows[0]["VoltageLevel"].ToString().Trim();
                txtVoltagelevel.Text = "Upto " + dp_Id3;
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
                //lblWorkIntimationId.Text = ds.Tables[0].Rows[0]["IntimationId"].ToString();
                txtSubmittedBy.Text = ds.Tables[0].Rows[0]["ContractorWhoCreated"].ToString();
                txtPreparedby.Text = ds.Tables[0].Rows[0]["SupervisorWhoCreated"].ToString();

            }
            catch
            {
            }
        }
    }
}