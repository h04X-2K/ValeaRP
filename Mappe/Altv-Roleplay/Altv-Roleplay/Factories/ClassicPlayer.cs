using AltV.Net.Elements.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Altv_Roleplay.Factories
{
    public class ClassicPlayer : Player
    {
        public int CharacterId { get; set; } = 0;
        public string FarmingAction { get; set; } = "None";
        public bool IsUsingCrowbar { get; set; } = false;
        public bool IsUnconscious { get; set; } = false;
        public string CurrentMinijob { get; set; } = "None";
        public string CurrentMinijobStep { get; set; } = "None";
        public int CurrentMinijobActionCount { get; set; } = 0;
        public int CurrentMinijobRouteId { get; set; } = 0;
        public bool isAduty { get; set; } = false;
        public bool isRobbingAShop { get; set; } = false;


        public ClassicPlayer(IntPtr nativePointer, ushort id) : base(nativePointer, id)
        {
        }
    }
}
