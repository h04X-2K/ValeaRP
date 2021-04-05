using AltV.Net;
using Altv_Roleplay.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Altv_Roleplay.Model
{
    class ServerClothes
    {
        public static List<Server_Clothes> ServerClothes_ = new List<Server_Clothes>();

        public static int GetClothesGender(string clothesName)
        {
            try
            {
                var clothes = ServerClothes_.ToList().FirstOrDefault(x => x.clothesName == clothesName);
                if (clothes != null) return clothes.gender;
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return 0;
        }

        public static string GetClothesType(string clothesName)
        {
            try
            {
                var clothes = ServerClothes_.ToList().FirstOrDefault(x => x.clothesName == clothesName);
                if (clothes != null) return clothes.type;
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return "";
        }

        public static int GetClothesDraw(string clothesName)
        {
            try
            {
                var clothes = ServerClothes_.ToList().FirstOrDefault(x => x.clothesName == clothesName);
                if (clothes != null) return clothes.draw;
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return 0;
        }

        public static bool ExistClothes(string clothesName)
        {
            try
            {
                return ServerClothes_.ToList().Exists(x => x.clothesName == clothesName);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return false;
        }

        public static int GetClothesTexture(string clothesName)
        {
            try
            {
                var clothes = ServerClothes_.ToList().FirstOrDefault(x => x.clothesName == clothesName);
                if (clothes != null) return clothes.texture;
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return 0;
        }
    }
}
