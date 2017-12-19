using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AttendanceMarking.DataModel
{
    public class MultiCRN
    {
    }

    public class MultiCrnStudent
    {
        public string leagacyId { get; set; }
        public string loginId { get; set; }
        public string fullName { get; set; }
        public string crn { get; set; }
        public string teacher { get; set; }
        public string image { get; set; }
        public bool marked { get; set; }

    }

}