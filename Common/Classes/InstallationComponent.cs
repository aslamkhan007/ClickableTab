using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CEIHaryana.Model.Common.Classes
{
    [Serializable]
    public class InstallationComponent
    {
        public string Typs { get; set; }
        public string Application { get; set; }
        public string NoOfInstallation { get; set; }
        public string TotalInstallation { get; set; }
        public string InstallationId { get; set; }
        public string IHID { get; set; }
        public string VoltageLevel { get; set; }
        public string ApplicantType { get; set; }
    }
}
