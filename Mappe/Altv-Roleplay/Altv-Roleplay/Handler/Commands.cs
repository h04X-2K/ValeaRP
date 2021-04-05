using AltV.Net;
using AltV.Net.Async;
using AltV.Net.Data;
using AltV.Net.Elements.Entities;
using AltV.Net.Enums;
using AltV.Net.Resources.Chat.Api;
using Altv_Roleplay.Factories;
using Altv_Roleplay.Model;
using Altv_Roleplay.models;
using Altv_Roleplay.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Altv_Roleplay.Handler
{
    public class Commands : IScript
    {
        [Command("getaccountidbymail")]
        public static void CMD_getAccountIdByMail(ClassicPlayer player, string mail)
        {
            try
            {
                if (player == null || !player.Exists || player.CharacterId <= 0 || player.AdminLevel() <= 0) return;
                var accEntry = User.Player.ToList().FirstOrDefault(x => x.Email == mail);
                if (accEntry == null) return;
                player.SendChatMessage($"Spieler-ID der E-Mail {mail} lautet: {accEntry.playerid} - Spielername: {accEntry.playerName}");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("trace")]
        public static void trace_CMD(IPlayer player)
        {
            try
            {
                if (player == null || !player.Exists || player.AdminLevel() <= 8) return;
                AltTrace.Start("FabiansDebugKasten");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("stoptrace")]
        public static void stopTrace_CMD(IPlayer player)
        {
            try
            {
                if (player == null || !player.Exists || player.AdminLevel() <= 8) return;
                AltTrace.Stop();
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("kick")]
        public static void cmd_KICK(IPlayer player, int charId)
        {
            try
            {
                if (player == null || !player.Exists || charId <= 0 || player.AdminLevel() <= 1) return;
                var targetP = Alt.Server.GetPlayers().ToList().FirstOrDefault(x => x != null && x.Exists && User.GetPlayerOnline(x) == charId);
                if (targetP == null) return;
                targetP.Kick("");
                HUDHandler.SendNotification(player, 4, 5000, $"Spieler mit Char-ID {charId} Erfolgreich gekickt.");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("ban")]
        public static void cmd_BAn(IPlayer player, int accId)
        {
            try
            {
                if (player == null || !player.Exists || accId <= 0 || player.AdminLevel() <= 2) return;
                User.SetPlayerBanned(accId, true, $"Gebannt von {Characters.GetCharacterName(User.GetPlayerOnline(player))}");
                var targetP = Alt.Server.GetPlayers().ToList().FirstOrDefault(x => x != null && x.Exists && User.GetPlayerAccountId(x) == accId);
                if (targetP != null) targetP.Kick("");
                HUDHandler.SendNotification(player, 4, 5000, $"Spieler mit ID {accId} Erfolgreich gebannt.");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("unban")]
        public static void CMD_Unban(ClassicPlayer player, int accId)
        {
            try
            {
                if (player == null || !player.Exists || player.CharacterId <= 0 || accId <= 0 || player.AdminLevel() <= 3) return;
                User.SetPlayerBanned(accId, false, "");
                HUDHandler.SendNotification(player, 4, 5000, $"Spieler mit ID {accId} Erfolgreich entbannt.");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("changeprice")]
        public static void cmd_ChangeP(IPlayer player, int shopId, int itemId, int newPrice)
        {
            try
            {
                if (player == null || !player.Exists || shopId <= 0 || itemId <= 0 || newPrice < 0 || player.AdminLevel() <= 8) return;
                var shopItem = ServerShopsItems.ServerShopsItems_.FirstOrDefault(x => x != null && x.shopId == shopId && x.id == itemId);
                if (shopItem == null) return;
                shopItem.itemPrice = newPrice;
                using (gtaContext db = new gtaContext())
                {
                    db.Server_Shops_Items.Update(shopItem);
                    db.SaveChanges();
                }
                player.SendChatMessage("Preis geändert.");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("announce", true)]
        public void announceCMD(IPlayer player, string msg)
        {
            try
            {
                if (player == null || !player.Exists) return;
                if (player.AdminLevel() <= 8) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }

                foreach(var client in Alt.Server.GetPlayers())
                {
                    if (client == null || !client.Exists) continue;
                    HUDHandler.SendNotification(client, 4, 5000, msg);
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("clothes")]
        public void clothesCMD(IPlayer player, int type, int draw, int tex)
        {
            if (player == null || !player.Exists) return;
            if (player.AdminLevel() <= 8) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            player.EmitLocked("Client:SpawnArea:setCharClothes", type, draw, tex);
        }

        [Command("adolf")]
        public void adolfCMD(IPlayer player, int type, int draw, int tex)
        {
            if (player == null || !player.Exists || player.AdminLevel() <= 8) return;
            player.EmitLocked("Client:SpawnArea:setCharAccessory", type, draw, tex);
        }

        [Command("support", true)]
        public void supportCMD(IPlayer player, string msg)
        {
            try
            {
                if (player == null || !player.Exists || User.GetPlayerOnline(player) <= 0) return;
                foreach (var admin in Alt.Server.GetPlayers().Where(x => x != null && x.Exists && x.AdminLevel() > 0))
                {
                    admin.SendChatMessage($"[SUPPORT] {Characters.GetCharacterName(User.GetPlayerOnline(player))} (ID: {User.GetPlayerOnline(player)}) benötigt Support: {msg}");
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("changegender")]
        public void cMD(IPlayer player, int gender)
        {
            if (player.AdminLevel() <= 8) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            switch (gender)
            {
                case 0: player.Model = 1885233650; break;
                case 1: player.Model = 2627665880; break;
            }
        }

        [Command("weapon")]
        public void wCMD(IPlayer player, WeaponModel wp)
        {
            if (player.AdminLevel() <= 8) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            try
            {
                if (player == null || !player.Exists) return;
                player.GiveWeapon(wp, 9999, true);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("spawnveh")]
        public void heyCMD(IPlayer player, string model)
        {
            if (player == null || !player.Exists) return;
            if (player.AdminLevel() <= 1) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            if (player.Vehicle != null && player.Vehicle.Exists) player.Vehicle.Remove();
            IVehicle veh = Alt.CreateVehicle(model, player.Position, player.Rotation);
            veh.EngineOn = true;
            veh.LockState = VehicleLockState.Unlocked;
        }

        [Command("time")]
        public void timeCMD(IPlayer player, int hour, int minute)
        {
            if (player.AdminLevel() <= 8) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            try
            {
                player.SetDateTime(DateTime.Now.Day, DateTime.Now.Month, DateTime.Now.Year, hour, minute, 0);
                player.EmitLocked("Client:Entity:setTime", hour, minute);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("color")]
        public void colorCMD(IPlayer player, int pr, int se)
        {
            try
            {
                if (player == null || !player.Exists) return;
                if (player.AdminLevel() <= 8) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
                if (player.Vehicle == null || !player.Vehicle.Exists) return;
                if (pr < 0 || se < 0) return;
                player.Vehicle.PrimaryColor = (byte)pr;
                player.Vehicle.SecondaryColor = (byte)se;
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("vehpos")]
        public void vehPos(IPlayer player)
        {
            if (player == null || !player.Exists || !player.IsInVehicle) return;
            if (player.AdminLevel() <= 8) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            player.SendChatMessage($"{player.Vehicle.Position.ToString()}");
            player.SendChatMessage($"{player.Vehicle.Rotation.ToString()}");
        }
        
        [Command("test")]
        public void returnVehicleModsCMD(IPlayer player, int modId)
        {
            if (player == null || !player.Exists || player.Vehicle == null) return;
            if (player.AdminLevel() <= 0) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            if (!player.Vehicle.Exists) return;
            //player.Vehicle.ModKit = 1;
            player.EmitLocked("returnVehicleMods", player.Vehicle, modId);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 0);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 1);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 2); //Hier schlagen
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 3);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 4);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 5);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 6);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 7);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 8);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 9);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 10);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 25);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 26);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 27);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 28);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 29);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 30);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 31);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 32);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 33);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 34);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 35);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 36);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 37);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 38);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 39);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 40);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 41);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 42);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 43);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 44);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 45);
            //player.EmitLocked("returnVehicleMods", player.Vehicle, 48);
        }

        [Command("players")]
        public void PlayerCMD(IPlayer player)
        {
            try
            {
                if (player == null || !player.Exists) return;
                if (player.AdminLevel() <= 0) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
                string msg = "Liste aller Spieler:<br>";
                foreach(var p in Alt.Server.GetPlayers().Where(x => x != null && x.Exists && x.GetCharacterMetaId() > 0))
                {
                    msg += $"{Characters.GetCharacterName((int)p.GetCharacterMetaId())} ({p.GetCharacterMetaId()})<br>";
                }
                HUDHandler.SendNotification(player, 1, 8000, msg);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("makeAdmin")]
        public static void CMD_Giveadmin(IPlayer player, int accId, int adminLevel)
        {
            try
            {
                if (player == null || !player.Exists) return;
                User.SetPlayerAdminLevel(accId, adminLevel);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("tppos")]
        public void TpPosCMD(IPlayer player, float X, float Y, float Z)
        {
            try
            {
                if (player == null || !player.Exists) return;
                if (player.AdminLevel() <= 2) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
                player.Position = new Position(X, Y, Z);
            }
            catch(Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("pos")]
        public void PosCMD(IPlayer player)
        {
            if (player == null || !player.Exists) return;
            if (player.AdminLevel() <= 0) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            player.SendChatMessage($"{player.Position.ToString()}");
        }

        [Command("rot")]
        public void RotCMD(IPlayer player)
        {
            if (player == null || !player.Exists) return;
            if (player.AdminLevel() <= 0) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            player.SendChatMessage($"{player.Rotation.ToString()}");
        }

        [Command("torso")]
        public void TorsoCMD(IPlayer player, int torso)
        {
            if (player == null || !player.Exists) return;
            if (player.AdminLevel() <= 0) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            player.EmitLocked("Client:SpawnArea:setCharClothes", 3, torso, 0);
        }

        [Command("delcar")]
        public void delcarCMD(IPlayer player)
        {
            try
            {
                if (player == null || !player.Exists || player.Vehicle == null || !player.Vehicle.Exists) return;
                if (player.AdminLevel() <= 1) return;
                else
                {
                    if (player.IsInVehicle)
                    {
                        HUDHandler.SendNotification(player, 4, 5000, "Du hast ein Fahrzeug gelöscht.");
                        player.Vehicle.Remove();
                    }
                    else HUDHandler.SendNotification(player, 4, 5000, "Du bist in keinem Fahrzeug.");
                }
            }
            catch(Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("parkvehicle")]
        public static void CMD_parkVehicleById(IPlayer player, int vehId)
        {
            try
            {
                if (player == null || !player.Exists || player.AdminLevel() <= 8 || vehId <= 0) return;
                var vehicle = Alt.Server.GetVehicles().ToList().FirstOrDefault(x => x != null && x.Exists && x.HasVehicleId() && (int)x.GetVehicleId() == vehId);
                if (vehicle == null) return;
                ServerVehicles.SetVehicleInGarage(vehicle, true, 25);
                HUDHandler.SendNotification(player, 4, 5000, $"Fahrzeug {vehId} in Garage 1(Pillbox) eingeparkt");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("parkallvehicles")]
        public static void CMD_ParkALlVehs(IPlayer player)
        {
            try
            {
                if (player == null || !player.Exists || player.AdminLevel() <= 8) return;
                int count = 0;
                foreach(var veh in Alt.Server.GetVehicles().ToList().Where(x => x != null && x.Exists && x.HasVehicleId()))
                {
                    if (veh == null || !veh.Exists || !veh.HasVehicleId()) continue;
                    int currentGarageId = ServerVehicles.GetVehicleGarageId(veh);
                    if (currentGarageId <= 0) continue;
                    ServerVehicles.SetVehicleInGarage(veh, true, currentGarageId);
                    count++;
                }

                player.SendChatMessage($"{count} Fahrzeuge eingeparkt.");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("parkvehiclekz", true)]
        public static void CMD_parkVehicle(IPlayer player, string plate)
        {
            try
            {
                if (player == null || !player.Exists || player.AdminLevel() <= 1 || string.IsNullOrWhiteSpace(plate)) return;
                var vehicle = Alt.Server.GetVehicles().ToList().FirstOrDefault(x => x != null && x.Exists && x.HasVehicleId() && (int)x.GetVehicleId() > 0 && x.NumberplateText.ToLower() == plate.ToLower());
                if (vehicle == null) return;
                ServerVehicles.SetVehicleInGarage(vehicle, true, 25);
                HUDHandler.SendNotification(player, 4, 5000, $"Fahrzeug mit dem Kennzeichen {plate} in Garage 1 (Pillbox) eingeparkt");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("whitelist")]
        public void WhitelistCMD(IPlayer player, int targetAccId)
        {
            try
            {
                if (player == null || !player.Exists || targetAccId <= 0 || player.GetCharacterMetaId() <= 0) return;
                if (player.AdminLevel() <= 0) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
                if (!User.ExistPlayerById(targetAccId)) { HUDHandler.SendNotification(player, 4, 5000, $"Diese ID existiert nicht {targetAccId}"); return; }
                if(User.IsPlayerWhitelisted(targetAccId)) { HUDHandler.SendNotification(player, 4, 5000, "Der Spieler ist bereits gewhitelisted."); return; }
                User.SetPlayerWhitelistState(targetAccId, true);
                player.SendChatMessage($"Du hast den Spieler {targetAccId} gewhitelistet.");
            }
            catch(Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("killme")]
        public void KillMeCMD(IPlayer player)
        {
            if (player == null || !player.Exists) return;
            if (player.AdminLevel() <= 8) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            player.Health = 0;
        }

        [Command("reviveme")]
        public void ReviveCMD(IPlayer player)
        {
            if (player == null || !player.Exists) return;
            if (player.AdminLevel() <= 8) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            player.EmitLocked("Client:Ragdoll:SetPedToRagdoll", false, 2000);
            player.Health = 200;
            HUDHandler.SendNotification(player, 2, 5000, "Du hast dich wiederbelebt.");
        }

        [Command("revive")]
        public void ReviveTargetCMD(IPlayer player, int targetId)
        {
            if (player == null || !player.Exists) return;
            if (player.AdminLevel() <= 2) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            string charName = Characters.GetCharacterName(targetId);
            if (!Characters.ExistCharacterName(charName)) return;
            var tp = Alt.Server.GetPlayers().FirstOrDefault(x => x != null && x.Exists && x.GetCharacterMetaId() == (ulong)targetId);
            if(tp != null)
            {
                tp.Health = 200;
                DeathHandler.revive(tp);
                player.SendChatMessage($"Du hast den Spieler {charName} wiederbelebt.");
                return;
            }
            player.SendChatMessage($"Der Spieler {charName} ist nicht online.");
        }

        [Command("faction")]
        public void FactionCMD(IPlayer player, int charId, int id)
        {
            try
            {
                if (player == null || !player.Exists || player.GetCharacterMetaId() <= 0) return;
                if (player.AdminLevel() <= 8) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
                if (ServerFactions.IsCharacterInAnyFaction(charId))
                {
                    ServerFactions.RemoveServerFactionMember(ServerFactions.GetCharacterFactionId(charId), charId);
                }

                ServerFactions.CreateServerFactionMember(id, charId, ServerFactions.GetFactionMaxRankCount(id), charId);
                player.SendChatMessage($"Done.");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("giveitem")]
        public void GiveItemCMD(IPlayer player, string itemName, int itemAmount)
        {
            if (player == null || !player.Exists) return;
            if (player.AdminLevel() <= 8) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            if (!ServerItems.ExistItem(ServerItems.ReturnNormalItemName(itemName))) { HUDHandler.SendNotification(player, 4, 5000, $"Itemname nicht gefunden: {itemName}"); return; }
            ulong charId = player.GetCharacterMetaId();
            if (charId <= 0) return;
            CharactersInventory.AddCharacterItem((int)charId, itemName, itemAmount, "inventory");
            HUDHandler.SendNotification(player, 2, 5000, $"Gegenstand '{itemName}' ({itemAmount}x) erhalten.");
        }

 /*       [Command("ban", true)]
        public void BanPlayerCMD(IPlayer player, int targetId, string reason)
        {
            if (player == null || !player.Exists) return;
            if (player.AdminLevel() <= 0) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            if(targetId <= 0 || reason.Length <= 0) {
                player.SendChatMessage("Benutzung: /ban targetId Grund");
                return;
            }
            string targetCharName = Characters.GetCharacterName(targetId);
            if (targetCharName.Length <= 0) {
                HUDHandler.SendNotification(player, 3, 5000, $"Warnung: Die angegebene Character-ID wurde nicht gefunden ({targetId}).");
                return; 
            }
            if(!Characters.ExistCharacterName(targetCharName))
            {
                HUDHandler.SendNotification(player, 3, 5000, $"Warnung: Der angegebene Charaktername wurde nicht gefunden ({targetCharName} - ID: {targetId}).");
                return;
            }
            int targetAccId = Characters.GetCharacterAccountId(targetId);
            if (targetAccId <= 0) return;
            if(User.IsPlayerBanned(targetAccId)) { HUDHandler.SendNotification(player, 1, 5000, "Der Spieler ist bereits gebannt."); return; }
            User.SetPlayerBanned(targetAccId, true, reason);
            HUDHandler.SendNotification(player, 2, 5000, $"Du hast den Spieler {targetCharName} (CharId: {targetId} - SpielerID: {targetAccId}) gebannt. Grund: {reason}");
            var targetPlayer = Alt.Server.GetPlayers().FirstOrDefault(x => x != null && x.Exists && x.GetCharacterMetaId() == (ulong)targetId);
            if(targetPlayer != null && targetPlayer.Exists)
            {
                targetPlayer.kickWithMessage("Du wurdest gebannt.");
            }
        }
*/
/*        [Command("kick", true)]
        public void KickPlayerCMD(IPlayer player, int targetId, string reason)
        {
            if (targetId <= 0 || reason.Length <= 0)
            {
                player.SendChatMessage("Benutzung: /kick targetId Grund");
                return;
            }
            string targetCharName = Characters.GetCharacterName(targetId);
            if (targetCharName.Length <= 0)
            {
                HUDHandler.SendNotification(player, 3, 5000, $"Warnung: Die angegebene Character-ID wurde nicht gefunden ({targetId}).");
                return;
            }
            if (!Characters.ExistCharacterName(targetCharName))
            {
                HUDHandler.SendNotification(player, 3, 5000, $"Warnung: Der angegebene Charaktername wurde nicht gefunden ({targetCharName} - ID: {targetId}).");
                return;
            }
            int targetAccId = Characters.GetCharacterAccountId(targetId);
            if (targetAccId <= 0) return;
            HUDHandler.SendNotification(player, 2, 5000, $"Du hast den Spieler {targetCharName} (CharId: {targetId} - SpielerID: {targetAccId}) gekickt. Grund: {reason}");
            var targetPlayer = Alt.Server.GetPlayers().FirstOrDefault(x => x != null && x.Exists && x.GetCharacterMetaId() == (ulong)targetId);
            if (targetPlayer != null && targetPlayer.Exists)
            {
                targetPlayer.Kick(reason);
                targetPlayer.kickWithMessage("Du wurdest vom Server gekickt!");
            }

        }
*/
        [Command("goto", false)]
        public void GotoCMD(IPlayer player, int targetId)
        {
            if (player.AdminLevel() <= 1) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            try
            {
                if (player == null || !player.Exists) return;
                if(targetId <= 0 || targetId.ToString().Length <= 0)
                {
                    player.SendChatMessage("Benutzung: /goto charId");
                    return;
                }
                string targetCharName = Characters.GetCharacterName(targetId);
                if (targetCharName.Length <= 0)
                {
                    HUDHandler.SendNotification(player, 3, 5000, $"Warnung: Die angegebene Character-ID wurde nicht gefunden ({targetId}).");
                    return;
                }
                if (!Characters.ExistCharacterName(targetCharName))
                {
                    HUDHandler.SendNotification(player, 3, 5000, $"Warnung: Der angegebene Charaktername wurde nicht gefunden ({targetCharName} - ID: {targetId}).");
                    return;
                }
                var targetPlayer = Alt.Server.GetPlayers().FirstOrDefault(x => x != null && x.Exists && x.GetCharacterMetaId() == (ulong)targetId);
                if(targetPlayer == null || !targetPlayer.Exists) { HUDHandler.SendNotification(player, 4, 5000, "Fehler: Spieler ist nicht online."); return; }
                HUDHandler.SendNotification(targetPlayer, 1, 5000, $"{Characters.GetCharacterName((int)player.GetCharacterMetaId())} hat sich zu dir teleportiert.");
                HUDHandler.SendNotification(player, 2, 5000, $"Du hast dich zu dem Spieler {Characters.GetCharacterName((int)targetPlayer.GetCharacterMetaId())} teleportiert.");
                player.Position = targetPlayer.Position + new Position(0, 0, 1);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("gethere", false)]
        public void GetHereCMD(IPlayer player, int targetId)
        {
            if (player.AdminLevel() <= 1) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }
            try
            {
                if (player == null || !player.Exists) return;
                if (targetId <= 0 || targetId.ToString().Length <= 0)
                {
                    player.SendChatMessage("Benutzung: /gethere charId");
                    return;
                }
                string targetCharName = Characters.GetCharacterName(targetId);
                if (targetCharName.Length <= 0)
                {
                    HUDHandler.SendNotification(player, 3, 5000, $"Warnung: Die angegebene Character-ID wurde nicht gefunden ({targetId}).");
                    return;
                }
                if (!Characters.ExistCharacterName(targetCharName))
                {
                    HUDHandler.SendNotification(player, 3, 5000, $"Warnung: Der angegebene Charaktername wurde nicht gefunden ({targetCharName} - ID: {targetId}).");
                    return;
                }
                var targetPlayer = Alt.Server.GetPlayers().FirstOrDefault(x => x != null && x.Exists && x.GetCharacterMetaId() == (ulong)targetId);
                if (targetPlayer == null || !targetPlayer.Exists) { HUDHandler.SendNotification(player, 4, 5000, "Fehler: Spieler ist nicht online."); return; }
                HUDHandler.SendNotification(targetPlayer, 1, 5000, $"{Characters.GetCharacterName((int)player.GetCharacterMetaId())} hat dich zu Ihm teleportiert.");
                HUDHandler.SendNotification(player, 2, 5000, $"Du hast den Spieler {Characters.GetCharacterName((int)targetPlayer.GetCharacterMetaId())} zu dir teleportiert.");
                targetPlayer.Position = player.Position + new Position(0, 0, 1);
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        [Command("aduty", true)]
        public void AdutyCMD(IPlayer player)
        {
            if (player == null || !player.Exists) return;
            if (player.AdminLevel() <= 0) { HUDHandler.SendNotification(player, 4, 5000, "Keine Rechte."); return; }

            if(player.HasData("isAduty"))
            {
                player.DeleteData("isAduty");
                player.EmitLocked("Client:Admin:Invincible", false);
                Characters.SetCharacterCorrectClothes(player);
                HUDHandler.SendNotification(player, 4, 5000, $"Du befindest dich nun im nicht mehr im Aduty");
            }
            else
            {
                player.SetData("isAduty", true);
                if (!Characters.GetCharacterGender((int)player.GetCharacterMetaId()))
                {
                    //Männlich
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 1, 135, 2);
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 4, 114, 2);
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 6, 78, 2);
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 3, 3, 0);
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 11, 287, 2);
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 8, 1, 99);
                } else
                {
                    //Weiblich
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 1, 135, 2);
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 11, 300, 2);
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 4, 121, 2);
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 3, 8, 0);
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 8, 1, 99);
                    player.EmitLocked("Client:SpawnArea:setCharClothes", 6, 82, 2);
                }    
                player.EmitLocked("Client:Admin:Invincible", true);
                HUDHandler.SendNotification(player, 4, 5000, $"Du befindest dich nun im Aduty");
            }
        }

        [Command("resethwid")]
        public void CMD_ResetHwId(IPlayer player, int accountId)
        {
            try
            {
                if (player == null || !player.Exists) return;
                if(player.GetCharacterMetaId() <= 0 || player.AdminLevel() <= 0) { HUDHandler.SendNotification(player, 4, 2500, "Keine Rechte."); return; }
                if(!User.ExistPlayerById(accountId)) { HUDHandler.SendNotification(player, 3, 2500, "Der Spieler existiert nicht."); return; }
                User.ResetPlayerHardwareID(accountId);
                HUDHandler.SendNotification(player, 1, 2500, $"Hardware-ID zurückgesetzt (Acc-ID: {accountId}).");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        /*

        [Command("call", true)]
        public void CallCMD(IPlayer player, int targetId)
        {
            try
            {
                if (player == null || !player.Exists) return;
                string targetCharName = Characters.GetCharacterName(targetId);
                if (targetCharName.Length <= 0)
                {
                    HUDHandler.SendNotification(player, 3, 5000, $"Warnung: Die angegebene Character-ID wurde nicht gefunden ({targetId}).");
                    return;
                }
                if (!Characters.ExistCharacterName(targetCharName))
                {
                    HUDHandler.SendNotification(player, 3, 5000, $"Warnung: Der angegebene Charaktername wurde nicht gefunden ({targetCharName} - ID: {targetId}).");
                    return;
                }
                var targetPlayer = Alt.Server.GetPlayers().FirstOrDefault(x => x != null && x.Exists && x.GetCharacterMetaId() == (ulong)targetId);
                if (targetPlayer == null || !targetPlayer.Exists) { HUDHandler.SendNotification(player, 4, 5000, "Fehler: Spieler ist nicht online."); return; }
                player.EmitLocked("SaltyChat_EstablishedCall",targetPlayer);
                targetplayer.EmitLocked("SaltyChat_EstablishedCall",player);

            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

    */

    }
}
