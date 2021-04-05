using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Altv_Roleplay.models
{
    public partial class Server_All_Vehicle_Mods
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        public long vehicleHash { get; set; }
        public string modName { get; set; }
        public int modType { get; set; }
        public int modId { get; set; }
    }
}