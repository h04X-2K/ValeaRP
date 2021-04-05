using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using AltV.Net;
using AltV.Net.Async;
using AltV.Net.Data;
using AltV.Net.Elements.Entities;
using Altv_Roleplay.Handler;
using Altv_Roleplay.Model;
using Altv_Roleplay.Services;
using Altv_Roleplay.Utils;

namespace Altv_Roleplay.Factions.ACLS
{
    class Functions : IScript
    {
        [AsyncClientEvent("Server:Raycast:RepairVehicle")]
        public async Task RepairVehicle(IPlayer player, IVehicle vehicle)
        {
            try
            {
                if (player == null || !player.Exists || vehicle == null || !vehicle.Exists) return;
                int charId = (int)player.GetCharacterMetaId();
                if (charId <= 0 || player.HasPlayerRopeCuffs() || player.HasPlayerHandcuffs() || player.IsPlayerUnconscious()) return;
                if(!CharactersInventory.ExistCharacterItem(charId, "Reparaturkit", "inventory") && !CharactersInventory.ExistCharacterItem(charId, "Reparaturkit", "backpack")) { HUDHandler.SendNotification(player, 4, 2000, "Du besitzt kein Reparaturkit."); return; }
                if (CharactersInventory.ExistCharacterItem(charId, "Reparaturkit", "inventory")) CharactersInventory.RemoveCharacterItemAmount(charId, "Reparaturkit", 1, "inventory");
                else if (CharactersInventory.ExistCharacterItem(charId, "Reparaturkit", "backpack")) CharactersInventory.RemoveCharacterItemAmount(charId, "Reparaturkit", 1, "backpack");
                //ToDo: Reparatur-Animation abspielen
                ServerVehicles.SetVehicleEngineHealthy(vehicle, true);
                Alt.EmitAllClients("Client:Utilities:repairVehicle", vehicle);
                //player.EmitLocked("Client:Utilities:repairVehicle", vehicle);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [AsyncClientEvent("Server:Raycast:towVehicle")]
        public async Task TowVehicle(IPlayer player, IVehicle vehicle)
        {
            try
            {
                if (player == null || !player.Exists || vehicle == null || !vehicle.Exists) return;
                int charId = (int)player.GetCharacterMetaId();
                int vehId = (int)vehicle.GetVehicleId();
                if (charId <= 0 || player.HasPlayerRopeCuffs() || player.HasPlayerHandcuffs() || player.IsPlayerUnconscious() || !ServerFactions.IsCharacterInAnyFaction(charId) || !vehicle.Position.IsInRange(Constants.Positions.AutoClubLosSantos_StoreVehPosition, 5f) || vehId <= 0) return;
                if (ServerFactions.GetCharacterFactionId(charId) != 4) return;
                int vehClass = ServerAllVehicles.GetVehicleClass(vehicle.Model);
                switch(vehClass)
                {
                    case 0: //Fahrzeuge
                        ServerVehicles.SetVehicleInGarage(vehicle, true, 10);
                        break;
                    case 1: //Boote
                        break;
                    case 2: //Flugzeuge
                        break;
                    case 3: //Helikopter
                        break;
                }              
                ServerFactions.SetFactionBankMoney(4, ServerFactions.GetFactionBankMoney(4) + 1500); //ToDo: Anpassen
                HUDHandler.SendNotification(player, 2, 2000, "Fahrzeug erfolgreich verwahrt.");
                LoggingService.NewFactionLog(4, charId, vehId, "towVehicle", $"{Characters.GetCharacterName(charId)} hat das Fahrzeug mit der ID {vehId} abgeschleppt.");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }


        [AsyncClientEvent("Server:Raycast:tuneVehicle")]
        public async Task openTuningMenu(IPlayer player, IVehicle vehicle)
        {
            try
            {
                if (player == null || !player.Exists || vehicle == null || !vehicle.Exists) return;
                int charId = (int)player.GetCharacterMetaId();
                int vehId = (int)vehicle.GetVehicleId();
                if (charId <= 0 || vehId <= 0) return;
                vehicle.ModKit = 1;
                string tuningItems = "Primärfarbe:100;Sekundärfarbe:200;Pearl-Effekt:250;Neonröhren:300";
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 0) != 0) { tuningItems += ";Spoiler:0"; }
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 1) != 0) { tuningItems += ";Frontstoßstange:1"; }
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 2) != 0) { tuningItems += ";Heckstoßstange:2"; }
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 3) != 0) { tuningItems += ";Seitenverkleidung:3"; }
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 4) != 0) { tuningItems += ";Auspuff:4"; }
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 5) != 0) { tuningItems += ";Überrollkäfig:5"; }
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 6) != 0) { tuningItems += ";Kühlergrill:6"; }
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 7) != 0) { tuningItems += ";Motorhaube:7"; }
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 8) != 0) { tuningItems += ";Linker Kotflügel:8"; }
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 9) != 0) { tuningItems += ";Rechter Kotflügel:9"; }
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 10) != 0) { tuningItems += ";Dach:10"; }
                if(ServerVehicles.ReturnMaxTuningWheels(11) != 0) { tuningItems += ";Motor:11"; }
                if(ServerVehicles.ReturnMaxTuningWheels(12) != 0) { tuningItems += ";Bremsen:12"; }
                if(ServerVehicles.ReturnMaxTuningWheels(13) != 0) { tuningItems += ";Getriebe:13"; }
                if(ServerVehicles.ReturnMaxTuningWheels(14) != 0) { tuningItems += ";Hupe:14"; }
                if(ServerVehicles.ReturnMaxTuningWheels(15) != 0) { tuningItems += ";Federung:15"; }
                if(ServerVehicles.ReturnMaxTuningWheels(22) != 0) { tuningItems += ";Xenon:22"; }
                tuningItems += ";Scheinwerferfarbe:280";
                 //ToDo: Reifentyp
                //if (ServerVehicles.ReturnMaxTuningWheels(131) != 0) { tuningItems += ";Reifen Typ:131"; }

                int wheelT = vehicle.WheelType;
                if (wheelT == 255 || wheelT == 0) wheelT = 0;

                if(ServerVehicles.ReturnMaxTuningWheels(Convert.ToInt32(23 + "" + wheelT)) != 0) { tuningItems += ";Reifen:23"; }
                if (ServerVehicles.ReturnMaxTuningWheels(132) != 0) { tuningItems += ";Reifen Farbe:132"; }
                if(ServerVehicles.ReturnMaxVehicleMods(vehicle, 25) != 0) { tuningItems += ";Nummernschild Rahmen:25"; }
                if(ServerVehicles.ReturnMaxVehicleMods(vehicle, 27) != 0) { tuningItems += ";Innenpolster:27"; }
                if(ServerVehicles.ReturnMaxVehicleMods(vehicle, 28) != 0) { tuningItems += ";Wackelkopf:28"; }
                if(ServerVehicles.ReturnMaxVehicleMods(vehicle, 30) != 0) { tuningItems += ";Tacho Design:30"; }
                if(ServerVehicles.ReturnMaxVehicleMods(vehicle, 33) != 0) { tuningItems += ";Lenkrad:33"; }
                if(ServerVehicles.ReturnMaxVehicleMods(vehicle, 34) != 0) { tuningItems += ";Schaltknüppel:34"; }
                if(ServerVehicles.ReturnMaxVehicleMods(vehicle, 35) != 0) { tuningItems += ";Tafel:35"; }
                if(ServerVehicles.ReturnMaxVehicleMods(vehicle, 40) != 0) { tuningItems += ";Luftfilter:40"; }
                if(ServerVehicles.ReturnMaxTuningWheels(46) != 0) { tuningItems += ";Fenstertönung:46"; }
                if (ServerVehicles.ReturnMaxVehicleMods(vehicle, 48) != 0) { tuningItems += ";Vinyls:48"; }

                player.EmitLocked("Client:Tuning:openTuningMenu", vehicle, tuningItems);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [AsyncClientEvent("Server:Tuning:switchTuningColor")]
        public async Task switchTuningColor(IPlayer player, IVehicle vehicle, string Type, string Data, int R, int G, int B)
        {
            try
            {
                if (player == null || !player.Exists || vehicle == null || !vehicle.Exists) return;
                int charId = (int)player.GetCharacterMetaId();
                int vehId = (int)vehicle.GetVehicleId();
                if (charId <= 0 || vehId <= 0) return;
                vehicle.ModKit = 1;
                if (Type == "Test")
                {
                    switch(Data)
                    {
                        case "Neonröhren":
                            vehicle.NeonColor = new Rgba((byte)R, (byte)G, (byte)B, 255);
                            vehicle.SetNeonActive(true, true, true, true);
                            break;
                        case "Reifenqualm":
                            vehicle.TireSmokeColor = new Rgba((byte)R, (byte)G, (byte)B, 255);
                            break;
                    }
                } 
                else if(Type == "Build")
                {
                    switch(Data)
                    {
                        case "Neonröhren":
                            vehicle.SetNeonActive(true, true, true, true);
                            ServerVehicles.InstallVehicleMod(vehicle, 300, R);
                            ServerVehicles.InstallVehicleMod(vehicle, 301, G);
                            ServerVehicles.InstallVehicleMod(vehicle, 302, B);
                            break;
                        case "Reifenqualm":
                            ServerVehicles.InstallVehicleMod(vehicle, 400, R);
                            ServerVehicles.InstallVehicleMod(vehicle, 401, G);
                            ServerVehicles.InstallVehicleMod(vehicle, 402, B);
                            break;
                    }
                    LoggingService.NewFactionLog(4, charId, vehId, "tuneVehColor", $"{Characters.GetCharacterName(charId)} hat Fahrzeug ({vehId}) modifiziert ({Data} - ({R}-{G}-{B}))");
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [AsyncClientEvent("Server:Tuning:resetToNormal")]
        public async Task resetTuningToNormal(IPlayer player, IVehicle vehicle)
        {
            try
            {
                if (player == null || !player.Exists || vehicle == null || !vehicle.Exists) return;
                if (player.GetCharacterMetaId() <= 0 || vehicle.GetVehicleId() <= 0) return;
                ServerVehicles.SetVehicleModsCorrectly(vehicle);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [AsyncClientEvent("Server:Tuning:switchTuning")]
        public async Task switchTuning(IPlayer player, IVehicle vehicle, string Type, int ModType, string Action)
        {
            try
            {
                if (player == null || !player.Exists || vehicle == null || !vehicle.Exists) return;
                if (player.GetCharacterMetaId() <= 0 || vehicle.GetVehicleId() <= 0) return;
                vehicle.ModKit = 1;
                if(Type == "Preview")
                {
                    ServerVehicles.SetVehicleModID(vehicle, Type, Action, ModType);
                    byte modId = 0;
                    if(ModType == 280) modId = vehicle.HeadlightColor;
                    else modId = vehicle.GetMod(Convert.ToByte(ModType));
                    if (modId == 255) modId = 0;
                    if (ModType == 46)
                    {
                        modId = vehicle.WindowTint;
                        if (modId == 255) modId = 0;
                    }
                    else if (ModType == 132) modId = vehicle.WheelColor;
                    else if (ModType == 23) modId = vehicle.WheelVariation;
                    else if (ModType == 100) modId = vehicle.PrimaryColor;
                    else if (ModType == 200) modId = vehicle.SecondaryColor;
                    else if (ModType == 250) modId = vehicle.PearlColor;
                    else if (ModType == 280) modId = vehicle.HeadlightColor;

                    if(modId > 0)
                    {
                        if(ModType == 23)
                        {
                            int WheelT = vehicle.WheelType;
                            if (WheelT == 255) WheelT = 0;
                            string modName = ServerVehicles.GetVehicleModName(0, Convert.ToInt32(ModType + "" + WheelT), modId);
                            HUDHandler.SendNotification(player, 1, 3500, $"Mod Name: {modName} | Mod-ID: {modId} | Mod-Type: {ModType}");
                        }
                        else if(ModType == 46)
                        {
                            modId = vehicle.WindowTint;
                            if (modId == 255) modId = 0;
                            string modName = ServerVehicles.GetVehicleModName(0, 46, modId);
                            HUDHandler.SendNotification(player, 1, 3500, $"Mod Name: {modName} | Mod-ID: {modId} | Mod-Type: {ModType}");
                        }
                        else if (ModType == 11 || ModType == 12 || ModType == 13 || ModType == 14 || ModType == 15 || ModType == 22)
                        {
                            string modName = ServerVehicles.GetVehicleModName(0, ModType, modId);
                            HUDHandler.SendNotification(player, 1, 3500, $"Mod Name: {modName} | Mod-ID: {modId} | Mod-Type: {ModType}");
                        }
                        else if(ModType == 100)
                        {
                            modId = vehicle.PrimaryColor;
                            string modName = ServerVehicles.GetVehicleModName(0, 132, modId);
                            HUDHandler.SendNotification(player, 1, 3500, $"Mod-Name: {modName} | Mod-ID: {modId} | Mod-Type: {ModType}");
                        }
                        else if(ModType == 200)
                        {
                            modId = vehicle.SecondaryColor;
                            string modName = ServerVehicles.GetVehicleModName(0, 132, modId);
                            HUDHandler.SendNotification(player, 1, 3500, $"Mod-Name: {modName} | Mod-ID: {modId}| Mod-Type: {ModType}");
                        }
                        else if(ModType == 250)
                        {
                            modId = vehicle.PearlColor;
                            string modName = ServerVehicles.GetVehicleModName(0, 132, modId);
                            HUDHandler.SendNotification(player, 1, 3500, $"Mod-Name: {modName} | Mod-ID: {modId}| Mod-Type: {ModType}");
                        }
                        else if(ModType == 280)
                        {
                            modId = vehicle.HeadlightColor;
                            string modName = ServerVehicles.GetVehicleModName(0, 280, modId);
                            HUDHandler.SendNotification(player, 1, 3500, $"Mod-Name: {modName} | Mod-ID: {modId}| Mod-Type: {ModType}");
                        }
                        else if(ModType == 131)
                        {
                            modId = vehicle.WheelType;
                            string modName = ServerVehicles.GetVehicleModName(0, 131, modId);
                            HUDHandler.SendNotification(player, 1, 3500, $"Mod Name: {modName} | Mod-ID: {modId} | Mod-Type: {ModType}");
                        }
                        else if(ModType == 132)
                        {
                            modId = vehicle.WheelColor;
                            string modName = ServerVehicles.GetVehicleModName(0, 132, modId);
                            HUDHandler.SendNotification(player, 1, 3500, $"Mod Name: {modName} | Mod-ID: {modId} | Mod-Type: {ModType}");
                        }
                        else
                        {
                            string modName = ServerVehicles.GetVehicleModName(0, ModType, modId);
                            HUDHandler.SendNotification(player, 1, 3500, $"Mod Name: {modName} | Mod-ID: {modId} | Mod-Type: {ModType}");
                        }
                    }
                    else if(modId <= 0)
                    {
                        HUDHandler.SendNotification(player, 4, 2000, $"Tuning Teil entfernt. [ModType: {ModType}].");
                    }
                }
                else if(Type == "Build")
                {
                    ServerVehicles.SetVehicleModID(vehicle, Type, Action, ModType);                    
                    int ModID = ServerVehicles.GetCurrentVehMod(vehicle, ModType);
                    if (ModID == 255) ModID = 0;
                    if(ModID > 0)
                    {
                        if(ModType == 23)
                        {
                            int WheelT = vehicle.WheelType;
                            if (WheelT == 255) WheelT = 0;
                            string modName = ServerVehicles.GetVehicleModName(0, Convert.ToInt32(ModType + "" + WheelT), ModID);
                            HUDHandler.SendNotification(player, 1, 1500, $"Mod-Name: {modName} | Mod-ID: {ModID} | Mod-Type: {ModType}");
                        }
                        else if(ModType == 46)
                        {
                            ModID = vehicle.WindowTint;
                            if (ModID == 255) ModID = 0;
                            string modName = ServerVehicles.GetVehicleModName(0, 46, ModID);
                        }
                        else if(ModType == 11 || ModType == 12 || ModType == 13 || ModType == 14 || ModType == 15 || ModType == 22)
                        {
                            string modName = ServerVehicles.GetVehicleModName(0, ModType, ModID);
                            HUDHandler.SendNotification(player, 1, 1500, $"Mod-Name: {modName} | Mod-ID: {ModID} | Mod-Type: {ModType}");
                        }
                        else if(ModType == 100)
                        {
                            ModID = vehicle.PrimaryColor;
                            if (ModID == 255) ModID = 0;
                            string modName = ServerVehicles.GetVehicleModName(0, 132, ModID);
                            HUDHandler.SendNotification(player, 1, 1500, $"Mod-Name: {modName} | Mod-ID: {ModID} | Mod-Type: {ModType}");
                        }
                        else if(ModType == 200)
                        {
                            ModID = vehicle.SecondaryColor;
                            if (ModID == 255) ModID = 0;
                            string modName = ServerVehicles.GetVehicleModName(0, 132, ModID);
                            HUDHandler.SendNotification(player, 1, 1500, $"Mod-Name: {modName} | Mod-ID: {ModID} | Mod-Type: {ModType}");
                        }
                        else if (ModType == 250)
                        {
                            ModID = vehicle.PearlColor;
                            if (ModID == 255) ModID = 0;
                            string modName = ServerVehicles.GetVehicleModName(0, 132, ModID);
                            HUDHandler.SendNotification(player, 1, 1500, $"Mod-Name: {modName} | Mod-ID: {ModID} | Mod-Type: {ModType}");
                        }
                        else if(ModType == 280)
                        {
                            ModID = vehicle.HeadlightColor;
                            if (ModID == 255) ModID = 0;
                            string modName = ServerVehicles.GetVehicleModName(0, 280, ModID);
                            HUDHandler.SendNotification(player, 1, 1500, $"Mod-Name: {modName} | Mod-ID: {ModID} | Mod-Type: {ModType}");
                        }
                        else if(ModType == 131)
                        {
                            string modName = ServerVehicles.GetVehicleModName(0, 131, ModID);
                            HUDHandler.SendNotification(player, 1, 1500, $"Mod-Name: {modName} | Mod-ID: {ModID} | Mod-Type: {ModType}");
                        }
                        else if(ModType == 132)
                        {
                            string modName = ServerVehicles.GetVehicleModName(0, 132, ModID);
                            HUDHandler.SendNotification(player, 1, 1500, $"Mod-Name: {modName} | Mod-ID: {ModID} | Mod-Type: {ModType}");
                        }
                        else
                        {
                            string modName = ServerVehicles.GetVehicleModName(vehicle.Model, ModType, ModID);
                            HUDHandler.SendNotification(player, 1, 1500, $"Mod-Name: {modName} | Mod-ID: {ModID} | Mod-Type: {ModType}");
                        }
                    }
                    else if (ModID <= 0)
                    {
                        HUDHandler.SendNotification(player, 4, 2000, $"Tuning Teil entfernt. [ModType: {ModType} - ModID: {ModID}].");
                    }
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }
    }
}
