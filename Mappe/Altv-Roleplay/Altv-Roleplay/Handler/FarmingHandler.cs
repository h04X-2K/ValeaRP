using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using AltV.Net;
using AltV.Net.Data;
using AltV.Net.Elements.Entities;
using Altv_Roleplay.Model;
using Altv_Roleplay.Utils;

namespace Altv_Roleplay.Handler
{
    class FarmingHandler
    {
        internal static async void FarmFieldAction(IPlayer player, string itemName, int itemMinAmount, int itemMaxAmount, string animation, int duration)
        {
            if (player == null || !player.Exists || itemName == "" || itemMinAmount == 0 || itemMaxAmount == 0 || animation == "") return;
            int charId = User.GetPlayerOnline(player); 
            if (charId <= 0) return;
            if (player.HasPlayerHandcuffs() || player.HasPlayerRopeCuffs()) { HUDHandler.SendNotification(player, 3, 5000, "Wie willst du das mit Handschellen/Fesseln machen?"); return; }
            InventoryHandler.InventoryAnimation(player, animation, duration);
            await Task.Delay(duration + 1250);
            lock (player)
            {
                player.SetPlayerFarmingActionMeta("None");
            }
                int rndItemAmount = new Random().Next(itemMinAmount, itemMaxAmount);
                //Doppelte Menge aufsammeln
                if (Characters.IsCharacterFastFarm(charId)) rndItemAmount += 1;
                float itemWeight = ServerItems.GetItemWeight(itemName) * rndItemAmount;
                float invWeight = CharactersInventory.GetCharacterItemWeight(charId, "inventory");
                float backpackWeight = CharactersInventory.GetCharacterItemWeight(charId, "backpack");
                if (invWeight + itemWeight > 15f && backpackWeight + itemWeight > Characters.GetCharacterBackpackSize(Characters.GetCharacterBackpack(charId))) { HUDHandler.SendNotification(player, 3, 5000, $"Deine Taschen sind voll."); return; }

                if (invWeight + itemWeight <= 15f)
                {
                    HUDHandler.SendNotification(player, 2, 5000, $"Du hast {itemName} ({rndItemAmount}x) gesammelt (Lagerort: Inventar).");
                    CharactersInventory.AddCharacterItem(charId, itemName, rndItemAmount, "inventory");
                    return;
                }

                if (Characters.GetCharacterBackpack(charId) != "None" && backpackWeight + itemWeight <= Characters.GetCharacterBackpackSize(Characters.GetCharacterBackpack(charId)))
                {
                    HUDHandler.SendNotification(player, 2, 5000, $"Du hast {itemName} ({rndItemAmount}x) gesammelt (Lagerort: Rucksack / Tasche).");
                    CharactersInventory.AddCharacterItem(charId, itemName, rndItemAmount, "backpack");
                    return;
                }
        }
        internal static async void ProduceItem(IPlayer player, string neededItem, string producedItem, int neededItemAmount, int producedItemAmount, int duration)
        {
            try
            {
                if (player == null || !player.Exists || neededItem == "" || producedItem == "" || neededItemAmount == 0 || producedItemAmount == 0 || duration < 0) return;
                int charId = User.GetPlayerOnline(player);
                if (charId == 0) return;
                if (!CharactersInventory.ExistCharacterItem(charId, neededItem, "inventory") && !CharactersInventory.ExistCharacterItem(charId, neededItem, "backpack")) return; //Item existiert nicht, abbrechen.
                int invAmount = CharactersInventory.GetCharacterItemAmount(charId, neededItem, "inventory"); //Anzahl an neededItem im Inventar
                int backpackAmount = CharactersInventory.GetCharacterItemAmount(charId, neededItem, "backpack"); //Anzahl an neededItem im Rucksack
                int finalAmount = invAmount + backpackAmount; //Zusammengerechnete Anzahl von neededItems.
                int giveInvItems = 0;
                int giveBackItems = 0;
                int removeInvItems = 0;
                int removeBackItems = 0;
                if (invAmount <= 0 && backpackAmount <= 0) return; //Abbrechen wenn Anzahl von beiden 0 ist = existiert nicht.
                if (finalAmount < neededItemAmount) return; //Spieler hat nicht genug Gegenstände dabei.
                if (invAmount < neededItemAmount && backpackAmount < neededItemAmount) { HUDHandler.SendNotification(player, 3, 5000, $"Du benötigst mindestens {neededItemAmount} Gegenstände in der gleichen Tasche."); return; }
                player.SetPlayerFarmingActionMeta("produce");
                if (invAmount >= neededItemAmount)
                {
                    int availableNeededItems = invAmount / neededItemAmount;
                    giveInvItems = availableNeededItems * producedItemAmount;
                    removeInvItems = availableNeededItems * neededItemAmount;
                }

                if (backpackAmount >= neededItemAmount)
                {
                    int availableNeededItems = backpackAmount / neededItemAmount;
                    giveBackItems = availableNeededItems * producedItemAmount;
                    removeBackItems = availableNeededItems * neededItemAmount;
                }

                Position ProducerPos = player.Position;
                int finalDuration = (removeInvItems + removeBackItems) * duration;
                HUDHandler.SendNotification(player, 1, finalDuration, $"Verarbeitung ({neededItem}) angefangen.");
                await Task.Delay(finalDuration);
                // Amount welchen man am Abschluss vom verarbeiten hat sprich sollte da was weggelegt werden wird der kleiner als der InvAmount und somit hat jemand probiert zu Dupen
                int antiDupeInvAmount = CharactersInventory.GetCharacterItemAmount(charId, neededItem, "inventory"); //Anzahl an neededItem im Inventar beim verarbeiten
                int antiDupeBackpackAmount = CharactersInventory.GetCharacterItemAmount(charId, neededItem, "backpack"); //Anzahl an neededItem im Rucksack beim verarbeiten
                if (!player.Position.IsInRange(ProducerPos, 3f)) { HUDHandler.SendNotification(player, 4, 5000, $"Du hast dich zu weit entfernt."); player.SetPlayerFarmingActionMeta("None"); return; }
                if (antiDupeInvAmount < invAmount || antiDupeBackpackAmount < backpackAmount) { HUDHandler.SendNotification(player, 3, 5000, $"Du darfst nichts wegwerfen während du verarbeitest!"); return; }
                lock (player)
                {
                    player.SetPlayerFarmingActionMeta("None");
                    HUDHandler.SendNotification(player, 1, 5000, $"Verarbeitung ({neededItem} abgeschlossen.");
                }
                CharactersInventory.RemoveCharacterItemAmount(charId, neededItem, removeInvItems, "inventory");
                CharactersInventory.RemoveCharacterItemAmount(charId, neededItem, removeBackItems, "backpack");
                CharactersInventory.AddCharacterItem(charId, producedItem, giveInvItems, "inventory");
                CharactersInventory.AddCharacterItem(charId, producedItem, giveBackItems, "backpack");
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }        
    }
}
