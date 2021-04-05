using AltV.Net;
using AltV.Net.Async;
using AltV.Net.Elements.Entities;
using Altv_Roleplay.Factories;
using Altv_Roleplay.models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Altv_Roleplay.Model
{
    class ServerClothesStorages
    {
        public static List<Server_Clothes_Storages> ServerClothesStorages_ = new List<Server_Clothes_Storages>();
        public static List<Server_Faction_Clothes> ServerFactionClothes_ = new List<Server_Faction_Clothes>();

        public static void RequestClothesStorage(ClassicPlayer player, int storageId)
        {
            try
            {
                if (player == null || !player.Exists || player.CharacterId <= 0 || storageId <= 0) return;
                int storageFaction = GetStorageFaction(storageId);
                int gender = Convert.ToInt32(Characters.GetCharacterGender(player.CharacterId));
                if (storageFaction > 0 && (!ServerFactions.IsCharacterInAnyFaction(player.CharacterId) || ServerFactions.GetCharacterFactionId(player.CharacterId) != storageFaction)) return;
                var userClothes = CharactersClothes.CharactersOwnedClothes_.ToList().Where(x => x.charId == player.CharacterId).Select(x => new
                {
                    x.clothesName,
                    clothesType = ServerClothes.GetClothesType(x.clothesName),
                    clothesDraw = ServerClothes.GetClothesDraw(x.clothesName),
                    clothesTex = ServerClothes.GetClothesTexture(x.clothesName),
                }).ToList();

                var userCount = (int)userClothes.Count;
                var iterations = Math.Floor((decimal)(userCount / 25));
                var rest = userCount % 25;
                for(var i = 0; i < iterations; i++)
                {
                    var skip = i * 25;
                    player.EmitLocked("Client:ClothesStorage:sendItemsToClient", JsonConvert.SerializeObject(userClothes.Skip(skip).Take(25).ToList()));
                }
                if (rest != 0) player.EmitLocked("Client:ClothesStorage:sendItemsToClient", JsonConvert.SerializeObject(userClothes.Skip((int)iterations * 25).ToList()));

                if(storageFaction > 0)
                {
                    var factionClothes = ServerFactionClothes_.ToList().Where(x => x.faction == storageFaction).Select(x => new
                    {
                        x.clothesName,
                        clothesType = ServerClothes.GetClothesType(x.clothesName),
                        clothesDraw = ServerClothes.GetClothesDraw(x.clothesName),
                        clothesTex = ServerClothes.GetClothesTexture(x.clothesName),
                    }).ToList();
                    var factionCount = (int)factionClothes.Count;
                    var factioniterations = Math.Floor((decimal)(factionCount / 25));
                    var factionrest = factionCount % 25;
                    for (var i = 0; i < factioniterations; i++)
                    {
                        var factionskip = i * 25;
                        player.EmitLocked("Client:ClothesStorage:sendItemsToClient", JsonConvert.SerializeObject(factionClothes.Skip(factionskip).Take(25).ToList()));
                    }
                    if (factionrest != 0) player.EmitLocked("Client:ClothesStorage:sendItemsToClient", JsonConvert.SerializeObject(factionClothes.Skip((int)factioniterations * 25).ToList()));
                }

                var availableClothes = ServerClothes.ServerClothes_.ToList().Where(x => x.type == "Torso" && x.gender == gender).Select(x => new
                {
                    x.clothesName,
                    clothesType = x.type,
                    clothesDraw = x.draw,
                    clothesTex = x.texture,
                }).ToList();

                var torsoCount = (int)availableClothes.Count;
                var torsoIterations = Math.Floor((decimal)(torsoCount / 25));
                var torsoRest = torsoCount % 25;
                for (var i = 0; i < torsoIterations; i++)
                {
                    var torsoskip = i * 25;
                    player.EmitLocked("Client:ClothesStorage:sendItemsToClient", JsonConvert.SerializeObject(availableClothes.Skip(torsoskip).Take(25).ToList()));
                }
                if (torsoRest != 0) player.EmitLocked("Client:ClothesStorage:sendItemsToClient", JsonConvert.SerializeObject(availableClothes.Skip((int)torsoIterations * 25).ToList()));

                player.EmitLocked("Client:ClothesStorage:createCEF");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static int GetStorageFaction(int id)
        {
            try
            {
                var storage = ServerClothesStorages_.ToList().FirstOrDefault(x => x.id == id);
                if (storage != null) return storage.faction;
            }
            catch(Exception e)
            {
                Alt.Log($"{e}");
            }
            return 0;
        }
    }
}
