import * as alt from 'alt';
import * as game from 'natives';
var canUseEKey = true;
var lastInteract = 0;

function canInteract() { return lastInteract + 1000 < Date.now() }

alt.on('keyup', (key) => {
    if (!canInteract) return;
    lastInteract = Date.now();
    if (key == 'E'.charCodeAt(0)) {
        alt.emitServer("Server:KeyHandler:PressE");
    } else if (key == 'U'.charCodeAt(0)) {
        alt.emitServer("Server:KeyHandler:PressU");
    } else if (key === 17) { //STRG
        alt.emitServer("Server:Crouch:toggleCrouch");
    }
});

alt.onServer("Client:DoorManager:ManageDoor", (hash, pos, isLocked) => {
    if (hash != undefined && pos != undefined && isLocked != undefined) {
        // game.doorControl(game.getHashKey(hash), pos.x, pos.y, pos.z, isLocked, 0.0, 50.0, 0.0); //isLocked (0) = Open | isLocked (1) = True
        game.setStateOfClosestDoorOfType(game.getHashKey(hash), pos.x, pos.y, pos.z, isLocked, 0, 0);
    }
});