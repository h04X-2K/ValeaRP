
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using AltV.Net;
using AltV.Net.Async;
using AltV.Net.Data;
using AltV.Net.Elements.Entities;
using Altv_Roleplay.Factories;
using Altv_Roleplay.Model;
using Altv_Roleplay.Utils;

namespace Altv_Roleplay.Handler
{
    class KeyHandler : IScript
    {
        [AsyncClientEvent("Server:KeyHandler:PressE")]
        public async Task PressE(IPlayer player)
        {
            lock (player)
            {
                if (player == null || !player.Exists) return;
                int charId = User.GetPlayerOnline(player);
                if (charId == 0) return;

                ClassicColshape farmCol = (ClassicColshape)ServerFarmingSpots.ServerFarmingSpotsColshapes_.FirstOrDefault(x => ((ClassicColshape)x).IsInRange((ClassicPlayer)player));
                if (farmCol != null && !player.IsInVehicle)
                {
                    if (player.HasPlayerHandcuffs() || player.HasPlayerRopeCuffs()) { HUDHandler.SendNotification(player, 3, 5000, "Wie willst du das mit Handschellen/Fesseln machen?"); return; }
                    if (player.GetPlayerFarmingActionMeta() != "None") return;
                    var farmColData = ServerFarmingSpots.ServerFarmingSpots_.FirstOrDefault(x => x.id == (int)farmCol.GetColShapeId());

                    if (farmColData != null)
                    {
                        if (farmColData.neededItemToFarm != "None")
                        {
                            if (!CharactersInventory.ExistCharacterItem(charId, farmColData.neededItemToFarm, "inventory") && !CharactersInventory.ExistCharacterItem(charId, farmColData.neededItemToFarm, "backpack")) { HUDHandler.SendNotification(player, 3, 3500, $"Zum Farmen benötigst du: {farmColData.neededItemToFarm}."); return; }
                        }
                        player.SetPlayerFarmingActionMeta("farm");
                        FarmingHandler.FarmFieldAction(player, farmColData.itemName, farmColData.itemMinAmount, farmColData.itemMaxAmount, farmColData.animation, farmColData.duration);
                        return;
                    }
                }

                ClassicColshape farmProducerCol = (ClassicColshape)ServerFarmingSpots.ServerFarmingProducerColshapes_.FirstOrDefault(x => ((ClassicColshape)x).IsInRange((ClassicPlayer)player));
                if (farmProducerCol != null && !player.IsInVehicle)
                {
                    if (player.GetPlayerFarmingActionMeta() != "None") { HUDHandler.SendNotification(player, 3, 5000, $"Warte einen Moment."); return; }
                    var farmColData = ServerFarmingSpots.ServerFarmingProducer_.FirstOrDefault(x => x.id == (int)farmProducerCol.GetColShapeId());
                    if (farmColData != null)
                    {
                        FarmingHandler.ProduceItem(player, farmColData.neededItem, farmColData.producedItem, farmColData.neededItemAmount, farmColData.producedItemAmount, farmColData.duration);
                        return;
                    }
                }        
                
                if(((ClassicColshape)Minijobs.Elektrolieferant.Main.startJobShape).IsInRange((ClassicPlayer)player))
                {
                    Minijobs.Elektrolieferant.Main.StartMinijob(player);
                    return;
                }

                if(((ClassicColshape)Minijobs.Pilot.Main.startJobShape).IsInRange((ClassicPlayer)player))
                {
                    Minijobs.Pilot.Main.TryStartMinijob(player);
                    return;
                }

                if(((ClassicColshape)Minijobs.Müllmann.Main.startJobShape).IsInRange((ClassicPlayer)player))
                {
                    Minijobs.Müllmann.Main.StartMinijob(player);
                    return;
                }

                if(((ClassicColshape)Minijobs.Busfahrer.Main.startJobShape).IsInRange((ClassicPlayer)player))
                {
                    Minijobs.Busfahrer.Main.TryStartMinijob(player);
                    return;
                }

                var houseEntrance = ServerHouses.ServerHouses_.FirstOrDefault(x => ((ClassicColshape)x.entranceShape).IsInRange((ClassicPlayer)player));
                if(houseEntrance != null)
                {
                    HouseHandler.openEntranceCEF(player, houseEntrance.id);
                    return;
                }

                var hotelPos = ServerHotels.ServerHotels_.FirstOrDefault(x => player.Position.IsInRange(new Position(x.posX, x.posY, x.posZ), 2f));
                if (hotelPos != null && !player.IsInVehicle)
                {
                    HotelHandler.openCEF(player, hotelPos);
                    return;
                }
                
                if(player.Dimension >= 5000)
                {
                    int houseInteriorCount = ServerHouses.GetMaxInteriorsCount();
                    for(var i = 1; i <= houseInteriorCount; i++)
                    {
                        if (i > houseInteriorCount || i <= 0) continue;
                        if((player.Dimension >= 5000 && player.Dimension < 10000) && player.Position.IsInRange(ServerHouses.GetInteriorExitPosition(i), 2f)) {
                            //Apartment Leave
                            HotelHandler.LeaveHotel(player);
                            return;
                        } 
                        else if((player.Dimension >= 5000 && player.Dimension < 10000) && player.Position.IsInRange(ServerHouses.GetInteriorStoragePosition(i), 2f))
                        {
                            //Apartment Storage
                            HotelHandler.openStorage(player);
                            return;
                        }
                        else if(player.Dimension >= 10000 && player.Position.IsInRange(ServerHouses.GetInteriorExitPosition(i), 2f))
                        {
                            //House Leave
                            HouseHandler.LeaveHouse(player, i);
                            return;
                        }
                        else if(player.Dimension >= 10000 && player.Position.IsInRange(ServerHouses.GetInteriorStoragePosition(i), 2f))
                        {
                            //House Storage
                            HouseHandler.openStorage(player);
                            return;
                        }
                        else if(player.Dimension >= 10000 && player.Position.IsInRange(ServerHouses.GetInteriorManagePosition(i), 2f))
                        {
                            //Hausverwaltung
                            HouseHandler.openManageCEF(player);
                            return;
                        }
                    }
                }                 

                var teleportsPos = ServerItems.ServerTeleports_.FirstOrDefault(x => player.Position.IsInRange(new Position(x.posX, x.posY, x.posZ), 1.5f));
                if (teleportsPos != null && !player.IsInVehicle)
                {
                    player.Position = new Position(teleportsPos.targetX, teleportsPos.targetY, teleportsPos.targetZ + 0.5f);
                    return;
                }

                var shopPos = ServerShops.ServerShops_.FirstOrDefault(x => player.Position.IsInRange(new Position(x.posX, x.posY, x.posZ), 3f));
                if (shopPos != null && !player.IsInVehicle)
                {
                    if (player.HasPlayerHandcuffs() || player.HasPlayerRopeCuffs()) { HUDHandler.SendNotification(player, 3, 5000, "Wie willst du das mit Handschellen/Fesseln machen?"); return; }
                    ShopHandler.openShop(player, shopPos);
                    return;
                }

                var garagePos = ServerGarages.ServerGarages_.FirstOrDefault(x => player.Position.IsInRange(new Position(x.posX, x.posY, x.posZ), 2f));
                if (garagePos != null && !player.IsInVehicle)
                {
                    GarageHandler.OpenGarageCEF(player, garagePos.id);
                    return;
                }

                var clothesStoragePos = ServerClothesStorages.ServerClothesStorages_.ToList().FirstOrDefault(x => player.Position.IsInRange(new Position(x.posX, x.posY, x.posZ), 5f));
                if(clothesStoragePos != null && !player.IsInVehicle)
                {
                    ServerClothesStorages.RequestClothesStorage((ClassicPlayer)player, clothesStoragePos.id);
                    return;
                }

                var clothesShopPos = ServerClothesShops.ServerClothesShops_.FirstOrDefault(x => player.Position.IsInRange(new Position(x.posX, x.posY, x.posZ), 6f));
                if(clothesShopPos != null && !player.IsInVehicle)
                {
                    ShopHandler.openClothesShop((ClassicPlayer)player, clothesShopPos.id);
                    return;
                }

                var tattooShop = ServerTattooShops.ServerTattooShops_.ToList().FirstOrDefault(x => x.owner != 0 && player.Position.IsInRange(new Position(x.pedX, x.pedY, x.pedZ), 2.5f));
                if (tattooShop != null && !player.IsInVehicle)
                {
                    ShopHandler.openTattooShop((ClassicPlayer)player, tattooShop);
                    return;
                }

                var vehicleShopPos = ServerVehicleShops.ServerVehicleShops_.FirstOrDefault(x => player.Position.IsInRange(new Position(x.pedX, x.pedY, x.pedZ), 2f));
                if (vehicleShopPos != null && !player.IsInVehicle)
                {
                    if (vehicleShopPos.neededLicense != "None" && !Characters.HasCharacterPermission(charId, vehicleShopPos.neededLicense)) { HUDHandler.SendNotification(player, 3, 5000, $"Du hast hier keinen Zugriff drauf."); return; }
                    ShopHandler.OpenVehicleShop(player, vehicleShopPos.name, vehicleShopPos.id);
                    return;
                }

                var bankPos = ServerBanks.ServerBanks_.FirstOrDefault(x => player.Position.IsInRange(new Position(x.posX, x.posY, x.posZ), 1f));
                if (bankPos != null && !player.IsInVehicle)
                {
                    if (bankPos.zoneName == "Maze Bank Fraktion")
                    {
                        if(!ServerFactions.IsCharacterInAnyFaction(charId)) return;
                        if(ServerFactions.GetCharacterFactionRank(charId) != ServerFactions.GetFactionMaxRankCount(ServerFactions.GetCharacterFactionId(charId)) && ServerFactions.GetCharacterFactionRank(charId) != ServerFactions.GetFactionMaxRankCount(ServerFactions.GetCharacterFactionId(charId)) - 1) { return; }
                        player.EmitLocked("Client:FactionBank:createCEF", "faction", ServerFactions.GetCharacterFactionId(charId), ServerFactions.GetFactionBankMoney(ServerFactions.GetCharacterFactionId(charId)));
                        return;
                    }
                    else if(bankPos.zoneName == "Maze Bank Company")
                    {
                        if (!ServerCompanys.IsCharacterInAnyServerCompany(charId)) return;
                        if(ServerCompanys.GetCharacterServerCompanyRank(charId) != 1 && ServerCompanys.GetCharacterServerCompanyRank(charId) != 2) { HUDHandler.SendNotification(player, 3, 5000, "Du hast kein Unternehmen auf welches du zugreifen kannst."); return; }
                        player.EmitLocked("Client:FactionBank:createCEF", "company", ServerCompanys.GetCharacterServerCompanyId(charId), ServerCompanys.GetServerCompanyMoney(ServerCompanys.GetCharacterServerCompanyId(charId)));
                        return;
                    }
                    else
                    {
                        var bankArray = CharactersBank.GetCharacterBankAccounts(charId);
                        player.EmitLocked("Client:Bank:createBankAccountManageForm", bankArray, bankPos.zoneName);
                        return;
                    }
                }             

                var barberPos = ServerBarbers.ServerBarbers_.FirstOrDefault(x => player.Position.IsInRange(new Position(x.posX, x.posY, x.posZ), 2f));
                if (barberPos != null && !player.IsInVehicle)
                {
                    player.EmitLocked("Client:Barber:barberCreateCEF", Characters.GetCharacterHeadOverlays(charId));
                    return;
                }

                if(player.Position.IsInRange(Constants.Positions.VehicleLicensing_Position, 3f))
                {
                    if (player.HasPlayerHandcuffs() || player.HasPlayerRopeCuffs()) { HUDHandler.SendNotification(player, 3, 5000, "Wie willst du das mit Handschellen/Fesseln machen?"); return; }
                    VehicleHandler.OpenLicensingCEF(player);
                    return;
                }

                if (ServerFactions.IsCharacterInAnyFaction(charId))
                {
                    int factionId = ServerFactions.GetCharacterFactionId(charId);
                    var factionDutyPos = ServerFactions.ServerFactionPositions_.FirstOrDefault(x => x.factionId == factionId && x.posType == "duty" && player.Position.IsInRange(new Position(x.posX, x.posY, x.posZ), 2f));
                    if (factionDutyPos != null && !player.IsInVehicle)
                    {
                        bool isDuty = ServerFactions.IsCharacterInFactionDuty(charId);
                        ServerFactions.SetCharacterInFactionDuty(charId, !isDuty);
                        if (isDuty) { 
                            HUDHandler.SendNotification(player, 2, 5000, "Du hast dich erfolgreich vom Dienst abgemeldet."); 
                        }
                        else { 
                            HUDHandler.SendNotification(player, 2, 5000, "Du hast dich erfolgreich zum Dienst angemeldet."); 
                        }
                        if(factionId == 2 || factionId == 12) SmartphoneHandler.RequestLSPDIntranet((ClassicPlayer)player);
                        return;
                    }

                    var factionStoragePos = ServerFactions.ServerFactionPositions_.FirstOrDefault(x => x.factionId == factionId && x.posType == "storage" && player.Position.IsInRange(new Position(x.posX, x.posY, x.posZ), 2f));
                    if(factionStoragePos != null && !player.IsInVehicle)
                    {
                        if (player.HasPlayerHandcuffs() || player.HasPlayerRopeCuffs()) { HUDHandler.SendNotification(player, 3, 5000, "Wie willst du das mit Handschellen/Fesseln machen?"); return; }
                        bool isDuty = ServerFactions.IsCharacterInFactionDuty(charId);
                        if(isDuty)
                        {
                            var factionStorageContent = ServerFactions.GetServerFactionStorageItems(factionId, charId); //Fraktionsspind Items
                            var CharacterInvArray = CharactersInventory.GetCharacterInventory(charId); //Spieler Inventar
                            player.EmitLocked("Client:FactionStorage:openCEF", charId, factionId, "faction", CharacterInvArray, factionStorageContent);
                            return;
                        }
                    }

                    var factionServicePhonePos = ServerFactions.ServerFactionPositions_.ToList().FirstOrDefault(x => x.factionId == factionId && x.posType == "servicephone" && player.Position.IsInRange(new Position(x.posX, x.posY, x.posZ), 2f));
                    if(factionServicePhonePos != null && !player.IsInVehicle && ServerFactions.IsCharacterInFactionDuty(charId))
                    {
                        ServerFactions.UpdateCurrentServicePhoneOwner(factionId, charId);
                        ServerFactions.sendMsg(factionId, $"{Characters.GetCharacterName(charId)} hat das Leitstellentelefon deiner Fraktion übernommen.");
                        return;
                    }
                }

                if (player.Position.IsInRange(Constants.Positions.Jobcenter_Position, 2.5f) && !Characters.IsCharacterCrimeFlagged(charId) && !player.IsInVehicle) //Arbeitsamt
                {
                    TownhallHandler.createJobcenterBrowser(player);
                    return;
                }

                if (player.Position.IsInRange(Constants.Positions.TownhallHouseSelector, 2.5f))
                {
                    TownhallHandler.openHouseSelector(player);
                    return;
                }

                if (player.Position.IsInRange(Constants.Positions.IdentityCardApply, 2.5f) && Characters.GetCharacterAccState(charId) == 0 && !player.IsInVehicle) //Rathaus IdentityCardApply
                {
                    TownhallHandler.tryCreateIdentityCardApplyForm(player);
                    return;
                }
            }
        }

        [AsyncClientEvent("Server:KeyHandler:PressU")]
        public async Task PressU(IPlayer player)
        {
            try
            {
                lock (player)
                {
                    if (player == null || !player.Exists) return;
                    int charId = User.GetPlayerOnline(player);
                    if (charId <= 0) return;
                    if (player.HasPlayerHandcuffs() || player.HasPlayerRopeCuffs()) { HUDHandler.SendNotification(player, 3, 5000, "Wie willst du das mit Handschellen/Fesseln machen?"); return; }

                    ClassicColshape serverDoorLockCol = (ClassicColshape)ServerDoors.ServerDoorsLockColshapes_.FirstOrDefault(x => ((ClassicColshape)x).IsInRange((ClassicPlayer)player));
                    if (serverDoorLockCol != null)
                    {
                        var doorColData = ServerDoors.ServerDoors_.FirstOrDefault(x => x.id == (int)serverDoorLockCol.GetColShapeId());
                        if (doorColData != null)
                        {
                            string doorKey = doorColData.doorKey;
                            string doorKey2 = doorColData.doorKey2;
                            if (doorKey == null || doorKey2 == null) return;
                            if (!CharactersInventory.ExistCharacterItem(charId, doorKey, "inventory") && !CharactersInventory.ExistCharacterItem(charId, doorKey, "backpack") && !CharactersInventory.ExistCharacterItem(charId, doorKey2, "inventory") && !CharactersInventory.ExistCharacterItem(charId, doorKey2, "backpack")) return;

                            if (!doorColData.state) { HUDHandler.SendNotification(player, 4, 1500, "Tür abgeschlossen."); }
                            else { HUDHandler.SendNotification(player, 2, 1500, "Tür aufgeschlossen."); }
                            doorColData.state = !doorColData.state;
                            Alt.EmitAllClients("Client:DoorManager:ManageDoor", doorColData.hash, new Position(doorColData.posX, doorColData.posY, doorColData.posZ), (bool)doorColData.state);
                            return;
                        }
                    }

                    if(player.Dimension >= 5000)
                    {
                        int houseInteriorCount = ServerHouses.GetMaxInteriorsCount();
                        for(var i = 1; i <= houseInteriorCount; i++)
                        {
                            if(player.Dimension >= 5000 && player.Dimension < 10000 && player.Position.IsInRange(ServerHouses.GetInteriorExitPosition(i), 2f))
                            {
                                //Hotel abschließen / aufschließen
                                if (player.Dimension - 5000 <= 0) continue;
                                int apartmentId = player.Dimension - 5000;
                                int hotelId = ServerHotels.GetHotelIdByApartmentId(apartmentId);
                                if (hotelId <= 0 || apartmentId <= 0) continue;
                                if(!ServerHotels.ExistHotelApartment(hotelId, apartmentId)) { HUDHandler.SendNotification(player, 3, 5000, "Ein unerwarteter Fehler ist aufgetreten [HOTEL-001]."); return; }
                                if (ServerHotels.GetApartmentOwner(hotelId, apartmentId) != charId) { HUDHandler.SendNotification(player, 3, 5000, "Du hast keinen Schlüssel."); return; }
                                HotelHandler.LockHotel(player, hotelId, apartmentId);
                                return;
                            }
                            else if(player.Dimension >= 10000 && player.Position.IsInRange(ServerHouses.GetInteriorExitPosition(i), 2f))
                            {
                                //Haus abschließen / aufschließen
                                if (player.Dimension - 10000 <= 0) continue;
                                int houseId = player.Dimension - 10000;
                                if (houseId <= 0) continue;
                                if(!ServerHouses.ExistHouse(houseId)) { HUDHandler.SendNotification(player, 3, 5000, "Ein unerwarteter Fehler ist aufgetreten [HOUSE-001]."); return; }
                                if (ServerHouses.GetHouseOwner(houseId) != charId && !ServerHouses.IsCharacterRentedInHouse(charId, houseId)) { HUDHandler.SendNotification(player, 3, 5000, "Dieses Haus gehört nicht dir und / oder du bist nicht eingemietet."); return; }
                                HouseHandler.LockHouse(player, houseId);
                                return;
                            }
                        }
                    }

                    var houseEntrance = ServerHouses.ServerHouses_.FirstOrDefault(x => ((ClassicColshape)x.entranceShape).IsInRange((ClassicPlayer)player));
                    if (houseEntrance != null)
                    {
                        HouseHandler.LockHouse(player, houseEntrance.id);
                    }
                }
            }
            catch(Exception e)
            {
                Alt.Log($"{e}");
            }
        }
    }
}
