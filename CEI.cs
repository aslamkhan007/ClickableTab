using CEIHaryana.Contractor;
using CEIHaryana.Model.Industry;
using iTextSharp.text.pdf.parser;
using Newtonsoft.Json;
using Pipelines.Sockets.Unofficial.Arenas;
using QRCoder;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Sockets;
using System.Text;
using System.Web;
using System.Web.Helpers;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Media.TextFormatting;
using static System.Net.WebRequestMethods;

namespace CEI_PRoject
{

    public class CEI
    {
        private int tCounter = 1;
        private int lCounter = 1;
        private SqlParameter outputParam;
        #region Bind DropDown Draw State
        public DataSet WorkIntimationGridData(string LicenceNo)
        {
            return DBTask.ExecuteDataset(ConfigurationManager.ConnectionStrings["DBConnection"].ToString(), "sp_WorkIntimationGridData", LicenceNo);
        }
        #endregion

               public DataSet InsertSwitchinData(SqlConnection con,SqlTransaction tran,string Count,string IntimationId,string SerialNoofSwitchingStation,string VoltageLevelofSwitchingStation,
        string NamePlaceofSwitchingStation,string TypeofBreaker,string OtherBreakerType,string TotalNoofBreakers,string CapacityofStationTransformerInKva,string NumberofEarthing,string CreatedBy)
        {
            using (SqlCommand cmd = new SqlCommand("sp_InsertSwitchingStation", con, tran))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Count", Count);
                cmd.Parameters.AddWithValue("@IntimationId", IntimationId);
                cmd.Parameters.AddWithValue("@SerialNoofSwitchingStation", SerialNoofSwitchingStation);
                cmd.Parameters.AddWithValue("@VoltageLevelofSwitchingStation", VoltageLevelofSwitchingStation);
                cmd.Parameters.AddWithValue("@NamePlaceofSwitchingStation", NamePlaceofSwitchingStation);
                cmd.Parameters.AddWithValue("@TypeofBreaker", TypeofBreaker);
                cmd.Parameters.AddWithValue("@OtherBreakerType", OtherBreakerType);
                cmd.Parameters.AddWithValue("@TotalNoofBreakers", TotalNoofBreakers);
                cmd.Parameters.AddWithValue("@CapacityofStationTransformerInKva", CapacityofStationTransformerInKva);
                cmd.Parameters.AddWithValue("@NumberofEarthing", NumberofEarthing);
                cmd.Parameters.AddWithValue("@CreatedBy", CreatedBy);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds;
            }
        }
        public void InsertSwitchingEarting(SqlConnection con,SqlTransaction tran,string TestReportId,int RowNumber,string EarthingType,string Valueinohms, string UsedFor,string OtherEarthing)
        {
            using (SqlCommand cmd = new SqlCommand("sp_InsertSwitchingEarthingData", con, tran))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TestReportId", TestReportId);
                cmd.Parameters.AddWithValue("@RowNumber", RowNumber);
                cmd.Parameters.AddWithValue("@EarthingType", EarthingType);
                cmd.Parameters.AddWithValue("@Valueinohms", Valueinohms);
                cmd.Parameters.AddWithValue("@UsedFor", UsedFor);
                cmd.Parameters.AddWithValue("@OtherEarthing", OtherEarthing);
                cmd.ExecuteNonQuery();
            }
        }
        public void UpdateInstallations(SqlConnection con,SqlTransaction tran,string InstallationNo,string IntimationId)
        {
            using (SqlCommand cmd = new SqlCommand("sp_CheckTestReportHistory", con, tran))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", InstallationNo);
                cmd.Parameters.AddWithValue("@IntimationId", IntimationId);

                cmd.ExecuteNonQuery();
            }
        }
		
		        public int InsertSwitchingStationData_Existing_HavingPreviousReport(int Count, string IntimationId, string Voltage,
 string SwitchingStationName, string BreakerType, string OtherbreakerType, string TotalBreakers, int StationTransformerCapacity,
 string SerialNo, string LastInspectionDate, string ApplicantType, string VoltageLevel, string District, string Division,
 string Inspectiontype, string CreatedBy)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_InsertSwitchingStationData_Existing_HavingPreviousReport", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Count", Count);
                    cmd.Parameters.AddWithValue("@IntimationId", string.IsNullOrEmpty(IntimationId) ? (object)DBNull.Value : IntimationId);
                    cmd.Parameters.AddWithValue("@StationVoltage", Voltage == "Select" ? (object)DBNull.Value : Voltage);
                    cmd.Parameters.AddWithValue("@SwitchingStationName", string.IsNullOrEmpty(SwitchingStationName) ? (object)DBNull.Value : SwitchingStationName);
                    cmd.Parameters.AddWithValue("@BreakerType", BreakerType == "Select" ? (object)DBNull.Value : BreakerType);
                    cmd.Parameters.AddWithValue("@OtherbreakerType", string.IsNullOrEmpty(OtherbreakerType) ? (object)DBNull.Value : OtherbreakerType);
                    cmd.Parameters.AddWithValue("@TotalBreakers", string.IsNullOrEmpty(TotalBreakers) ? (object)DBNull.Value : TotalBreakers);
                    cmd.Parameters.AddWithValue("@StationTransformerCapacity", StationTransformerCapacity);
                    cmd.Parameters.AddWithValue("@SerialNo", string.IsNullOrEmpty(SerialNo) ? (object)DBNull.Value : SerialNo);
                    cmd.Parameters.AddWithValue("@LastInspectionDate", string.IsNullOrEmpty(LastInspectionDate) ? (object)DBNull.Value : LastInspectionDate);
                    cmd.Parameters.AddWithValue("@ApplicantType", string.IsNullOrEmpty(ApplicantType) ? (object)DBNull.Value : ApplicantType);
                    cmd.Parameters.AddWithValue("@VoltageLevel", string.IsNullOrEmpty(VoltageLevel) ? (object)DBNull.Value : VoltageLevel);
                    cmd.Parameters.AddWithValue("@District", string.IsNullOrEmpty(District) ? (object)DBNull.Value : District);
                    cmd.Parameters.AddWithValue("@Division", string.IsNullOrEmpty(Division) ? (object)DBNull.Value : Division);
                    cmd.Parameters.AddWithValue("@Inspectiontype", string.IsNullOrEmpty(Inspectiontype) ? (object)DBNull.Value : Inspectiontype);
                    cmd.Parameters.AddWithValue("@CreatedBy", CreatedBy);

                    SqlParameter returnStatusParam = new SqlParameter("@ReturnStatus", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output
                    };
                    cmd.Parameters.Add(returnStatusParam);

                    // Open the connection and execute the command
                    con.Open();
                    cmd.ExecuteNonQuery();

                    // Retrieve the output parameter value
                    return (int)returnStatusParam.Value;
                }
            }
        }
        #endregion
       
    }
}


