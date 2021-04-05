import * as alt from 'alt';
import * as game from 'natives';
import { LocalStorage } from 'alt';

let loginBrowser = null;
let loginCam = null;
let loginPedHandle = null;
let loginModelHash = null;
const storage = LocalStorage.get();

alt.onServer('Client:Login:CreateCEF', () => {
    if (loginBrowser == null) {
        loginCam = game.createCamWithParams('DEFAULT_SCRIPTED_CAMERA', 3280, 5220, 26, 0, 0, 240, 50, true, 2);
        game.setCamActive(loginCam, true);
        game.renderScriptCams(true, false, 0, true, false);
        game.freezeEntityPosition(alt.Player.local.scriptID, true);
        alt.showCursor(true);
        alt.toggleGameControls(false);
        loginBrowser = new alt.WebView("http://resource/client/cef/login/index.html");
        loginBrowser.focus();
        loginBrowser.on("Client:Login:cefIsReady", () => {
            alt.setTimeout(() => {
                if (storage.get("username")) {
                    loginBrowser.emit("CEF:Login:setStorage", storage.get("username"), storage.get("password"));
                }
                loginBrowser.emit("CEF:Login:showArea", "login");
            }, 2000);
        });

        loginBrowser.on("Client:Login:sendLoginDataToServer", (name, password) => {
            alt.emitServer("Server:Login:ValidateLoginCredentials", name, password);
        });

        loginBrowser.on("Client:Register:sendRegisterDataToServer", (name, email, password, passwordrepeat) => {
            alt.emitServer("Server:Register:RegisterNewPlayer", name, email, password, passwordrepeat);
        });

        loginBrowser.on("Client:Charcreator:OpenCreator", () => {
            alt.emitServer("Server:Charcreator:CreateCEF");
            destroyLoginBrowser();
        });

        loginBrowser.on("Client:Login:DestroyCEF", () => {
            destroyLoginBrowser();
        });

        loginBrowser.on("Client:Charselector:KillCharacter", (charid) => {
            alt.emitServer("Server:Charselector:KillCharacter", charid);
        });

        loginBrowser.on("Client:Charselector:PreviewCharacter", (charid) => {
            alt.emitServer("Server:Charselector:PreviewCharacter", charid);
        });

        loginBrowser.on("Client:Charselector:spawnChar", (charid, spawnstr) => {
            alt.emitServer("Server:Charselector:spawnChar", spawnstr, charid);
        });
    }
});

alt.onServer("Client:SpawnArea:setCharSkin", (facefeaturearray, headblendsarray, headoverlayarray) => {
    let facefeatures = JSON.parse(facefeaturearray);
    let headblends = JSON.parse(headblendsarray);
    let headoverlays = JSON.parse(headoverlayarray);

    game.setPedHeadBlendData(alt.Player.local.scriptID, headblends[0], headblends[1], 0, headblends[2], headblends[5], 0, headblends[3], headblends[4], 0, 0);
    game.setPedHeadOverlayColor(alt.Player.local.scriptID, 1, 1, parseInt(headoverlays[2][1]), 1);
    game.setPedHeadOverlayColor(alt.Player.local.scriptID, 2, 1, parseInt(headoverlays[2][2]), 1);
    game.setPedHeadOverlayColor(alt.Player.local.scriptID, 5, 2, parseInt(headoverlays[2][5]), 1);
    game.setPedHeadOverlayColor(alt.Player.local.scriptID, 8, 2, parseInt(headoverlays[2][8]), 1);
    game.setPedHeadOverlayColor(alt.Player.local.scriptID, 10, 1, parseInt(headoverlays[2][10]), 1);
    game.setPedEyeColor(alt.Player.local.scriptID, parseInt(headoverlays[0][14]));
    game.setPedHeadOverlay(alt.Player.local.scriptID, 0, parseInt(headoverlays[0][0]), parseInt(headoverlays[1][0]));
    game.setPedHeadOverlay(alt.Player.local.scriptID, 1, parseInt(headoverlays[0][1]), parseFloat(headoverlays[1][1]));
    game.setPedHeadOverlay(alt.Player.local.scriptID, 2, parseInt(headoverlays[0][2]), parseFloat(headoverlays[1][2]));
    game.setPedHeadOverlay(alt.Player.local.scriptID, 3, parseInt(headoverlays[0][3]), parseInt(headoverlays[1][3]));
    game.setPedHeadOverlay(alt.Player.local.scriptID, 4, parseInt(headoverlays[0][4]), parseInt(headoverlays[1][4]));
    game.setPedHeadOverlay(alt.Player.local.scriptID, 5, parseInt(headoverlays[0][5]), parseInt(headoverlays[1][5]));
    game.setPedHeadOverlay(alt.Player.local.scriptID, 6, parseInt(headoverlays[0][6]), parseInt(headoverlays[1][6]));
    game.setPedHeadOverlay(alt.Player.local.scriptID, 7, parseInt(headoverlays[0][7]), parseInt(headoverlays[1][7]));
    game.setPedHeadOverlay(alt.Player.local.scriptID, 8, parseInt(headoverlays[0][8]), parseInt(headoverlays[1][8]));
    game.setPedHeadOverlay(alt.Player.local.scriptID, 9, parseInt(headoverlays[0][9]), parseInt(headoverlays[1][9]));
    game.setPedHeadOverlay(alt.Player.local.scriptID, 10, parseInt(headoverlays[0][10]), parseInt(headoverlays[1][10]));
    game.setPedComponentVariation(alt.Player.local.scriptID, 2, parseInt(headoverlays[0][13]), 0, 0);
    game.setPedHairColor(alt.Player.local.scriptID, parseInt(headoverlays[2][13]), parseInt(headoverlays[1][13]));

    for (let i = 0; i < 20; i++) {
        game.setPedFaceFeature(alt.Player.local.scriptID, i, facefeatures[i]);
    }
});

alt.onServer("Client:SpawnArea:setCharClothes", (componentId, drawableId, textureId) => {
    alt.log(`Component: ${componentId} - drawable: ${drawableId} - texture: ${textureId}`);
    game.setPedComponentVariation(alt.Player.local.scriptID, parseInt(componentId), parseInt(drawableId), parseInt(textureId), 0);
});

alt.onServer("Client:SpawnArea:setCharAccessory", (componentId, drawableId, textureId) => {
    game.setPedPropIndex(alt.Player.local.scriptID, componentId, drawableId, textureId, false);
});

alt.onServer("Client:SpawnArea:clearCharAccessory", (componentId) => {
    game.clearPedProp(alt.Player.local.scriptID, componentId);
});

alt.onServer("Client:Charselector:ViewCharacter", (gender, facefeaturearray, headblendsarray, headoverlayarray) => {
    spawnCharSelectorPed(gender, facefeaturearray, headblendsarray, headoverlayarray);
});

alt.onServer("Client:Login:SaveLoginCredentialsToStorage", (name, password) => {
    storage.set('username', name);
    storage.set('password', password);
    storage.save();
});

alt.onServer("Client:Login:showError", (msg) => {
    if (loginBrowser != null) {
        loginBrowser.emit("CEF:Login:showError", msg);
    }
});

alt.onServer("Client:Login:showArea", (area) => {
    if (loginBrowser != null) {
        loginBrowser.emit("CEF:Login:showArea", area);
        if (area == "charselect") {
            if (loginCam != null) {
                game.renderScriptCams(false, false, 0, true, false);
                game.setCamActive(loginCam, false);
                game.destroyCam(loginCam, true);
                loginCam = null;
            }
            game.setEntityAlpha(alt.Player.local.scriptID, 0, 0);
            loginCam = game.createCamWithParams('DEFAULT_SCRIPTED_CAMERA', 402.7, -1003, -98.6, 0, 0, 358, 18, true, 2);
            game.setCamActive(loginCam, true);
            game.renderScriptCams(true, false, 0, true, false);
        }
    }
});

alt.onServer("Client:Charselector:sendCharactersToCEF", (chars) => {
    if (loginBrowser != null) {
        loginBrowser.emit("CEF:Charselector:sendCharactersToCEF", chars)
    }
});

let destroyLoginBrowser = function() {
    if (loginBrowser != null) {
        loginBrowser.destroy();
    }
    loginBrowser = null;
    game.renderScriptCams(false, false, 0, true, false);
    game.setCamActive(loginCam, false);
    if (loginCam != null) {
        game.destroyCam(loginCam, true);
    }
    if (loginPedHandle != null) {
        game.deletePed(loginPedHandle);
        loginPedHandle = null;
    }
    loginCam = null;
    alt.showCursor(false);
    alt.toggleGameControls(true);
    game.freezeEntityPosition(alt.Player.local.scriptID, false);
    game.setEntityAlpha(alt.Player.local.scriptID, 255, 0);
}

function spawnCharSelectorPed(gender, facefeaturearray, headblendsarray, headoverlayarray) {
    let facefeatures = JSON.parse(facefeaturearray);
    let headblends = JSON.parse(headblendsarray);
    let headoverlays = JSON.parse(headoverlayarray);

    if (loginPedHandle != null) {
        game.deletePed(loginPedHandle);
        loginPedHandle = null;
    }

    if (gender == true) {
        loginModelHash = game.getHashKey('mp_f_freemode_01');
        game.requestModel(loginModelHash);
    } else if (gender == false) {
        loginModelHash = game.getHashKey('mp_m_freemode_01');
        game.requestModel(loginModelHash);
    }
    alt.setTimeout(function() {
        if (game.hasModelLoaded(loginModelHash)) {
            loginPedHandle = game.createPed(4, loginModelHash, 402.778, -996.9758, -100.01465, 0, false, true);
            game.setEntityAlpha(loginPedHandle, 255, 0);
            game.setEntityHeading(loginPedHandle, 180.0);
            game.setEntityInvincible(loginPedHandle, true);
            game.disablePedPainAudio(loginPedHandle, true);
            game.freezeEntityPosition(loginPedHandle, true);
            game.taskSetBlockingOfNonTemporaryEvents(loginPedHandle, true);

            game.setPedHeadBlendData(loginPedHandle, headblends[0], headblends[1], 0, headblends[2], headblends[5], 0, headblends[3], headblends[4], 0, 0);
            game.setPedHeadOverlayColor(loginPedHandle, 1, 1, parseInt(headoverlays[2][1]), 1);
            game.setPedHeadOverlayColor(loginPedHandle, 2, 1, parseInt(headoverlays[2][2]), 1);
            game.setPedHeadOverlayColor(loginPedHandle, 5, 2, parseInt(headoverlays[2][5]), 1);
            game.setPedHeadOverlayColor(loginPedHandle, 8, 2, parseInt(headoverlays[2][8]), 1);
            game.setPedHeadOverlayColor(loginPedHandle, 10, 1, parseInt(headoverlays[2][10]), 1);
            game.setPedEyeColor(loginPedHandle, parseInt(headoverlays[0][14]));
            game.setPedHeadOverlay(loginPedHandle, 0, parseInt(headoverlays[0][0]), parseInt(headoverlays[1][0]));
            game.setPedHeadOverlay(loginPedHandle, 1, parseInt(headoverlays[0][1]), parseFloat(headoverlays[1][1]));
            game.setPedHeadOverlay(loginPedHandle, 2, parseInt(headoverlays[0][2]), parseFloat(headoverlays[1][2]));
            game.setPedHeadOverlay(loginPedHandle, 3, parseInt(headoverlays[0][3]), parseInt(headoverlays[1][3]));
            game.setPedHeadOverlay(loginPedHandle, 4, parseInt(headoverlays[0][4]), parseInt(headoverlays[1][4]));
            game.setPedHeadOverlay(loginPedHandle, 5, parseInt(headoverlays[0][5]), parseInt(headoverlays[1][5]));
            game.setPedHeadOverlay(loginPedHandle, 6, parseInt(headoverlays[0][6]), parseInt(headoverlays[1][6]));
            game.setPedHeadOverlay(loginPedHandle, 7, parseInt(headoverlays[0][7]), parseInt(headoverlays[1][7]));
            game.setPedHeadOverlay(loginPedHandle, 8, parseInt(headoverlays[0][8]), parseInt(headoverlays[1][8]));
            game.setPedHeadOverlay(loginPedHandle, 9, parseInt(headoverlays[0][9]), parseInt(headoverlays[1][9]));
            game.setPedHeadOverlay(loginPedHandle, 10, parseInt(headoverlays[0][10]), parseInt(headoverlays[1][10]));
            game.setPedComponentVariation(loginPedHandle, 2, parseInt(headoverlays[0][13]), 0, 0);
            game.setPedHairColor(loginPedHandle, parseInt(headoverlays[2][13]), parseInt(headoverlays[1][13]));

            for (let i = 0; i < 20; i++) {
                game.setPedFaceFeature(loginPedHandle, i, facefeatures[i]);
            }
        }
    }, 200);
}

alt.on('connectionComplete', () => {
    loadallIPLsAndInteriors();
    alt.setStat('stamina', 50);
    alt.setStat('strength', 50);
    alt.setStat('lung_capacity', 100);
    alt.setStat('wheelie_ability', 100);
    alt.setStat('flying_ability', 100);
    alt.setStat('shooting_ability', 100);
    alt.setStat('stealth_ability', 100);
});

function loadallIPLsAndInteriors() {
    alt.removeIpl("rc12b_default"); //Pillbox Hill Hospital
    alt.removeIpl("rc12b_hospitalinterior"); //Pillbox Hill Hospital
    alt.removeIpl("rc12b_hospitalinterior_lod"); //Pillbox Hill Hospital
    alt.removeIpl("rc12b_destroyed"); //Pillbox Hill Hospital

    alt.requestIpl("hei_hw1_blimp_interior_v_apart_midspaz_milo");
    alt.requestIpl('canyonriver01');
    alt.requestIpl('chop_props');
    alt.requestIpl('FIBlobby');
    alt.removeIpl('FIBlobbyfake');
    alt.requestIpl('FBI_colPLUG');
    alt.requestIpl('FBI_repair');
    alt.requestIpl('v_tunnel_hole');
    alt.requestIpl('TrevorsMP');
    alt.requestIpl('TrevorsTrailer');
    alt.requestIpl('TrevorsTrailerTidy');
    alt.removeIpl('farm_burnt');
    alt.removeIpl('farm_burnt_lod');
    alt.removeIpl('farm_burnt_props');
    alt.removeIpl('farmint_cap');
    alt.removeIpl('farmint_cap_lod');
    alt.requestIpl('farm');
    alt.requestIpl('farmint');
    alt.requestIpl('farm_lod');
    alt.requestIpl('farm_props');
    alt.requestIpl('facelobby');
    alt.removeIpl('CS1_02_cf_offmission');
    alt.requestIpl('CS1_02_cf_onmission1');
    alt.requestIpl('CS1_02_cf_onmission2');
    alt.requestIpl('CS1_02_cf_onmission3');
    alt.requestIpl('CS1_02_cf_onmission4');
    alt.requestIpl('v_rockclub');
    alt.requestIpl('v_janitor');
    alt.removeIpl('hei_bi_hw1_13_door');
    alt.requestIpl('bkr_bi_hw1_13_int');
    alt.requestIpl('ufo');
    alt.requestIpl('ufo_lod');
    alt.requestIpl('ufo_eye');
    alt.removeIpl('v_carshowroom');
    alt.removeIpl('shutter_open');
    alt.removeIpl('shutter_closed');
    alt.removeIpl('shr_int');
    alt.requestIpl('csr_afterMission');
    alt.requestIpl('v_carshowroom');
    alt.requestIpl('shr_int');
    alt.requestIpl('shutter_closed');
    alt.requestIpl('smboat');
    alt.requestIpl('smboat_distantlights');
    alt.requestIpl('smboat_lod');
    alt.requestIpl('smboat_lodlights');
    alt.requestIpl('cargoship');
    alt.requestIpl('railing_start');
    alt.removeIpl('sp1_10_fake_interior');
    alt.removeIpl('sp1_10_fake_interior_lod');
    alt.requestIpl('sp1_10_real_interior');
    alt.requestIpl('sp1_10_real_interior_lod');
    alt.removeIpl('id2_14_during_door');
    alt.removeIpl('id2_14_during1');
    alt.removeIpl('id2_14_during2');
    alt.removeIpl('id2_14_on_fire');
    alt.removeIpl('id2_14_post_no_int');
    alt.removeIpl('id2_14_pre_no_int');
    alt.removeIpl('id2_14_during_door');
    alt.requestIpl('id2_14_during1');
    alt.removeIpl('Coroner_Int_off');
    alt.requestIpl('coronertrash');
    alt.requestIpl('Coroner_Int_on');
    alt.removeIpl('bh1_16_refurb');
    alt.removeIpl('jewel2fake');
    alt.removeIpl('bh1_16_doors_shut');
    alt.requestIpl('refit_unload');
    alt.requestIpl('post_hiest_unload');
    alt.requestIpl('Carwash_with_spinners');
    alt.requestIpl('KT_CarWash');
    alt.requestIpl('ferris_finale_Anim');
    alt.removeIpl('ch1_02_closed');
    alt.requestIpl('ch1_02_open');
    alt.requestIpl('AP1_04_TriAf01');
    alt.requestIpl('CS2_06_TriAf02');
    alt.requestIpl('CS4_04_TriAf03');
    alt.removeIpl('scafstartimap');
    alt.requestIpl('scafendimap');
    alt.removeIpl('DT1_05_HC_REMOVE');
    alt.requestIpl('DT1_05_HC_REQ');
    alt.requestIpl('DT1_05_REQUEST');
    alt.requestIpl('FINBANK');
    alt.removeIpl('DT1_03_Shutter');
    alt.removeIpl('DT1_03_Gr_Closed');
    alt.requestIpl('golfflags');
    alt.requestIpl('airfield');
    alt.requestIpl('v_garages');
    alt.requestIpl('v_foundry');
    alt.requestIpl('hei_yacht_heist');
    alt.requestIpl('hei_yacht_heist_Bar');
    alt.requestIpl('hei_yacht_heist_Bedrm');
    alt.requestIpl('hei_yacht_heist_Bridge');
    alt.requestIpl('hei_yacht_heist_DistantLights');
    alt.requestIpl('hei_yacht_heist_enginrm');
    alt.requestIpl('hei_yacht_heist_LODLights');
    alt.requestIpl('hei_yacht_heist_Lounge');
    alt.requestIpl('hei_carrier');
    alt.requestIpl('hei_Carrier_int1');
    alt.requestIpl('hei_Carrier_int2');
    alt.requestIpl('hei_Carrier_int3');
    alt.requestIpl('hei_Carrier_int4');
    alt.requestIpl('hei_Carrier_int5');
    alt.requestIpl('hei_Carrier_int6');
    alt.requestIpl('hei_carrier_LODLights');
    alt.requestIpl('bkr_bi_id1_23_door');
    alt.requestIpl('lr_cs6_08_grave_closed');
    alt.requestIpl('hei_sm_16_interior_v_bahama_milo_');
    alt.requestIpl('CS3_07_MPGates');
    alt.requestIpl('cs5_4_trains');
    alt.requestIpl('v_lesters');
    alt.requestIpl('v_trevors');
    alt.requestIpl('v_michael');
    alt.requestIpl('v_comedy');
    alt.requestIpl('v_cinema');
    alt.requestIpl('V_Sweat');
    alt.requestIpl('V_35_Fireman');
    alt.requestIpl('redCarpet');
    alt.requestIpl('triathlon2_VBprops');
    alt.requestIpl('jetstegameurnel');
    alt.requestIpl('Jetsteal_ipl_grp1');
    alt.requestIpl('v_hospital');


    alt.requestIpl("apa_v_mp_h_02_a");
    alt.requestIpl('shr_int'); //Premium Deluxe Motorsports
    game.activateInteriorEntitySet(game.getInteriorAtCoordsWithType(-38.62, -1099.01, 27.31, 'v_carshowroom'), 'csr_beforeMission'); //Premium Deluxe Motorsports
    game.activateInteriorEntitySet(game.getInteriorAtCoordsWithType(-38.62, -1099.01, 27.31, 'v_carshowroom'), 'shutter_closed'); //Premium Deluxe Motorsports

    var nightClubGalaxyIntId = game.getInteriorAtCoords(345.4899597168, 294.95315551758, 98.191421508789); //Galaxy Nightclub
    //120834 Galaxy InteriorId
    game.pinInteriorInMemory(nightClubGalaxyIntId);
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_security_upgrade"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_equipment_setup"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_Style01"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_Style02"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_Style03"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_style01_podium"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_style02_podium"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_style03_podium"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "int01_ba_lights_screen"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_Screen"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_bar_content"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_booze_01"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_booze_02"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_booze_03"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_dj01"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_dj02"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_dj03"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_dj04"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "DJ_01_Lights_01"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_01_Lights_02"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_01_Lights_03"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_01_Lights_04"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_02_Lights_01"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "DJ_02_Lights_02"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_02_Lights_03"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_02_Lights_04"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_03_Lights_01"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_03_Lights_02"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "DJ_03_Lights_03"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_03_Lights_04"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_04_Lights_01"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_04_Lights_02"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "DJ_04_Lights_03"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "DJ_04_Lights_04"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "light_rigs_off"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_lightgrid_01"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_Clutter"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_equipment_upgrade"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_clubname_01"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_clubname_02"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_clubname_03"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_clubname_04"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_clubname_05"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_clubname_06"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_clubname_07"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_clubname_08"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_clubname_09"); //Galaxy Nightclub
    game.activateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_dry_ice"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_deliverytruck"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_trophy04"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_trophy05"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_trophy07"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_trophy09"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_trophy08"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_trophy11"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_trophy10"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_trophy03"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_trophy01"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_trophy02"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_trad_lights"); //Galaxy Nightclub
    game.deactivateInteriorEntitySet(nightClubGalaxyIntId, "Int01_ba_Worklamps"); //Galaxy Nightclub
    game.refreshInterior(nightClubGalaxyIntId); //Galaxy Nightclub
}