using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CEIHaryana.Model.Common.Classes
{
    [Serializable]
    public class SwitchingSubstationComponent
    {
        public string TestReportId { get; set; }
        public string Approval { get; set; }      
        public string Counts { get; set; }         
    }
}
