using Altv_Roleplay.models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using AltV.Net;

namespace Altv_Roleplay.Model
{
    class ServerClothesShops
    {
        public static List<Server_Clothes_Shops> ServerClothesShops_ = new List<Server_Clothes_Shops>();
        public static List<Server_Clothes_Shops_Items> ServerClothesShopsItems_ = new List<Server_Clothes_Shops_Items>();

        public static bool ExistClothesShop(int shopId)
        {
            try
            {
                return ServerClothesShops_.ToList().Exists(x => x.id == shopId);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return false;
        }

        public static int GetClothesPrice(int shopId, string clothesName)
        {
            try
            {
                var clothesData = ServerClothesShopsItems_.ToList().FirstOrDefault(x => x.shopId == shopId && x.clothesName == clothesName);
                if (clothesData != null) return clothesData.itemPrice;
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return 0;
        }
    }
}
