using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Altv_Roleplay.models
{
    public partial class Server_Vehicles_Mod
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        public int vehId { get; set; }
        public int colorPrimary { get; set; }
        public int colorSecondary { get; set; }
        public int colorPearl { get; set; }
        public int headlightColor { get; set; }
        public int spoiler { get; set; }
        public int front_bumper { get; set; }
        public int rear_bumper { get; set; }
        public int side_skirt { get; set; }
        public int exhaust { get; set; }
        public int frame { get; set; }
        public int grille { get; set; }
        public int hood { get; set; }
        public int fender { get; set; }
        public int right_fender { get; set; }
        public int roof { get; set; }
        public int engine { get; set; }
        public int brakes { get; set; }
        public int transmission { get; set; }
        public int horns { get; set; }
        public int suspension { get; set; }
        public int armor { get; set; }
        public int turbo { get; set; }
        public int xenon { get; set; }
        public int wheel_type { get; set; }
        public int wheels { get; set; }
        public int wheelcolor { get; set; }
        public int plate_holder { get; set; }
        public int trim_design { get; set; }
        public int ornaments { get; set; }
        public int dial_design { get; set; }
        public int steering_wheel { get; set; }
        public int shift_lever { get; set; }
        public int plaques { get; set; }
        public int hydraulics { get; set; }
        public int airfilter { get; set; }
        public int window_tint { get; set; }
        public int livery { get; set; }
        public int plate { get; set; }
        public int neon { get; set; }
        public int neon_r { get; set; }
        public int neon_g { get; set; }
        public int neon_b { get; set; }
        public int smoke_r { get; set; }
        public int smoke_g { get; set; }
        public int smoke_b { get; set; }
    }
}