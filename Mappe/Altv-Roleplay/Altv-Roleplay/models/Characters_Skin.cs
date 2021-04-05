using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Altv_Roleplay.models
{
    public partial class Characters_Skin
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int charId { get; set; }
        public string facefeatures { get; set; }
        public string headblendsdata { get; set; }
        public string headoverlays { get; set; }
        public string clothesTop { get; set; }
        public string clothesTorso { get; set; }
        public string clothesLeg { get; set; }
        public string clothesFeet { get; set; }
        public string clothesHat { get; set; }
        public string clothesGlass { get; set; }
        public string clothesEarring { get; set; }
        public string clothesNecklace { get; set; }
        public string clothesMask { get; set; }
        public string clothesArmor { get; set; }
        public string clothesUndershirt { get; set; }
        public string clothesBracelet { get; set; }
        public string clothesWatch { get; set; }
        public string clothesBag { get; set; }
        public string clothesDecal { get; set; }
    }
}