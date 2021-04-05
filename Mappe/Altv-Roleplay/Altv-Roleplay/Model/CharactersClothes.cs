using AltV.Net;
using Altv_Roleplay.models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Altv_Roleplay.Model
{
    class CharactersClothes
    {
        public static List<CharactersOwnedClothes> CharactersOwnedClothes_ = new List<CharactersOwnedClothes>();

        public static void CreateCharacterOwnedClothes(int charId, string clothesName)
        {
            try
            {
                if (ExistCharacterClothes(charId, clothesName)) return;
                var clothesData = new CharactersOwnedClothes
                {
                    charId = charId,
                    clothesName = clothesName
                };
                CharactersOwnedClothes_.Add(clothesData);
                using (var db = new gtaContext())
                {
                    db.CharactersOwnedClothes.Add(clothesData);
                    db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static bool ExistCharacterClothes(int charId, string clothesName)
        {
            try
            {
                return CharactersOwnedClothes_.ToList().Exists(x => x.charId == charId && x.clothesName == clothesName);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return false;
        }
    }
}
