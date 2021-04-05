using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Altv_Roleplay.models
{
    public class Logs_Death
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]

        public int id { get; set; }
        public int playerName { get; set; }
        public int killerName { get; set; }
        public uint weaponId { get; set; }
        public DateTime timestamp { get; set; }
    }
}
