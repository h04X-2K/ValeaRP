import * as alt from 'alt';
import * as game from 'natives';
let inventoryBrowser = null;
let lastInteract = 0;

alt.on('keyup', (key) => {
    if (key == 'I'.charCodeAt(0)) {
        if (inventoryBrowser == null) { //Inv �ffnen
            alt.log(`CEFState: ${alt.Player.local.getSyncedMeta("IsCefOpen")}`);
            if (alt.Player.local.getSyncedMeta("HasHandcuffs") == true || alt.Player.local.getSyncedMeta("HasRopeCuffs") == true || alt.Player.local.getSyncedMeta("IsCefOpen") == true) return;
            openInventoryCEF(true);
        } else { //Inv close
            closeInventoryCEF();
        }
    }
});

function canInteract() { return lastInteract + 1000 < Date.now() }

function UseItem(itemname, itemAmount, fromContainer) {
    if (!canInteract) return
    lastInteract = Date.now()
    alt.emitServer("Server:Inventory:UseItem", itemname, parseInt(itemAmount), fromContainer);
}

function DropItem(itemname, itemAmount, fromContainer) {
    if (!canInteract) return
    lastInteract = Date.now()
    alt.emitServer("Server:Inventory:DropItem", itemname, parseInt(itemAmount), fromContainer);
}

function switchItemToDifferentInv(itemname, itemAmount, fromContainer, toContainer) {
    if (!canInteract) return
    lastInteract = Date.now()
    alt.emitServer("Server:Inventory:switchItemToDifferentInv", itemname, parseInt(itemAmount), fromContainer, toContainer);
}

function GiveItem(itemname, itemAmount, fromContainer, targetPlayerID) {
    if (!canInteract) return;
    lastInteract = Date.now()
    alt.emitServer("Server:Inventory:GiveItem", itemname, parseInt(itemAmount), fromContainer, parseInt(targetPlayerID));
}

alt.onServer("Client:Inventory:CreateInventory", (invArray, backpackSize, targetPlayerID) => {
    openInventoryCEF(false);
    alt.setTimeout(() => {
        if (inventoryBrowser != null) {
            inventoryBrowser.emit('CEF:Inventory:AddInventoryItems', invArray, backpackSize, targetPlayerID);
        }
    }, 800);
});

alt.onServer('Client:Inventory:AddInventoryItems', (invArray, backpackSize, targetPlayerID) => {
    if (inventoryBrowser != null) {
        inventoryBrowser.emit('CEF:Inventory:AddInventoryItems', invArray, backpackSize, targetPlayerID);
    }
});

alt.onServer('Client:Inventory:closeCEF', () => {
    closeInventoryCEF();
});

alt.onServer('Client:Inventory:PlayAnimation', (animDict, animName, duration, flag, lockpos) => {
    game.requestAnimDict(animDict);
    let interval = alt.setInterval(() => {
        if (game.hasAnimDictLoaded(animDict)) {
            alt.clearInterval(interval);
            game.taskPlayAnim(game.playerPedId(), animDict, animName, 8.0, 1, duration, flag, 1, lockpos, lockpos, lockpos);
        }
    }, 0);
});

alt.onServer("Client:Inventory:StopAnimation", () => {
    game.clearPedTasks(alt.Player.local.scriptID);
});

let openInventoryCEF = function(requestItems) {
    if (inventoryBrowser == null && alt.Player.local.getSyncedMeta("IsCefOpen") == false && alt.Player.local.getSyncedMeta("PLAYER_SPAWNED") == true) {
        alt.showCursor(true);
        alt.toggleGameControls(false);
        inventoryBrowser = new alt.WebView("http://resource/client/cef/inventory/index.html");
        inventoryBrowser.focus();
        alt.emitServer("Server:CEF:setCefStatus", true);
        inventoryBrowser.on("Client:Inventory:cefIsReady", () => {
            if (!requestItems) return;
            alt.emitServer("Server:Inventory:RequestInventoryItems");
        });
        inventoryBrowser.on("Client:Inventory:UseInvItem", UseItem);
        inventoryBrowser.on("Client:Inventory:DropInvItem", DropItem);
        inventoryBrowser.on("Client:Inventory:switchItemToDifferentInv", switchItemToDifferentInv);
        inventoryBrowser.on("Client:Inventory:giveItem", GiveItem);
    }
}

export function closeInventoryCEF() {
    if (inventoryBrowser != null) {
        inventoryBrowser.off("Client:Inventory:UseInvItem", UseItem);
        inventoryBrowser.off("Client:Inventory:DropInvItem", DropItem);
        inventoryBrowser.off("Client:Inventory:switchItemToDifferentInv", switchItemToDifferentInv);
        inventoryBrowser.off("Client:Inventory:giveItem", GiveItem);
        inventoryBrowser.unfocus();
        inventoryBrowser.destroy();
        inventoryBrowser = null;
        alt.showCursor(false);
        alt.toggleGameControls(true);
        alt.emitServer("Server:CEF:setCefStatus", false);
    }
}