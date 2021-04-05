using AltV.Net;
using AltV.Net.Data;
using AltV.Net.Elements.Entities;
using Altv_Roleplay.models;
using System;
using System.Collections.Generic;
using System.Text;
using AltV.Net.Enums;
using System.Linq;
using System.Globalization;
using Altv_Roleplay.Utils;
using Newtonsoft.Json;
using System.Threading.Tasks;
using AltV.Net.Async;
using Altv_Roleplay.Factories;

namespace Altv_Roleplay.Model
{
    class ServerVehicles
    {
        //this two
        public static List<Server_Vehicles> ServerVehiclesLocked_ { get { lock (ServerVehicles_) return ServerVehicles_.ToList(); } set => ServerVehicles_ = value; }
        public static List<Server_Vehicles> ServerVehicles_ = new List<Server_Vehicles>();
        public static List<Server_Vehicles_Mod> ServerVehiclesMod_ = new List<Server_Vehicles_Mod>();
        public static List<Server_Vehicle_Items> ServerVehicleTrunkItems_ = new List<Server_Vehicle_Items>();
        public static List<Server_All_Vehicle_Mods> ServerAllVehicleMods_ = new List<Server_All_Vehicle_Mods>();

        public static void CreateServerVehicle(int id, int charid, uint hash, int vehType, int factionid, float fuel, float km, bool engineState, bool isEngineHealthy, bool lockState, bool isInGarage, int garageId, Position position, Rotation rotation, string plate, DateTime lastUsage, DateTime buyDate)
        {
            var newVehicleData = new Server_Vehicles
            {
                id = id,
                charid = charid,
                hash = hash,
                vehType = vehType,
                faction = factionid,
                fuel = fuel,
                KM = km,
                engineState = engineState,
                isEngineHealthy = isEngineHealthy,
                lockState = lockState,
                isInGarage = isInGarage,
                garageId = garageId,
                posX = position.X,
                posY = position.Y,
                posZ = position.Z,
                rotX = rotation.Pitch,
                rotY = rotation.Roll,
                rotZ = rotation.Yaw,
                plate = plate,
                lastUsage = lastUsage,
                buyDate = buyDate
            };
            ServerVehicles_.Add(newVehicleData);

            if (isInGarage) return;
            IVehicle veh = Alt.CreateVehicle(hash, position, rotation);
            if (position == new Position(0, 0, 0)) { SetVehicleInGarage(veh, true, 10); return; }
            if (lockState == true) { veh.LockState = VehicleLockState.Locked; }
            else if (lockState == false) { veh.LockState = VehicleLockState.Unlocked; }
            veh.NumberplateText = plate;
            veh.EngineOn = engineState;
            veh.SetVehicleId((ulong)id);
            veh.SetVehicleTrunkState(false);
            SetVehicleModsCorrectly(veh);
        }

        public static void AddVehicleTrunkItem(int vehId, string itemName, int itemAmount, bool inGlovebox)
        {
            if (vehId <= 0 || itemName == "" || itemAmount <= 0) return;
            try
            {
                var itemData = new Server_Vehicle_Items
                {
                    vehId = vehId,
                    itemName = itemName,
                    itemAmount = itemAmount,
                    isInGlovebox = inGlovebox
                };

                var hasItem = ServerVehicleTrunkItems_.FirstOrDefault(i => i.vehId == vehId && i.itemName == itemName && i.isInGlovebox == inGlovebox);
                if (hasItem != null)
                {
                    //Item existiert, itemAmount erhöhen
                    hasItem.itemAmount += itemAmount;
                    using (gtaContext db = new gtaContext())
                    {
                        var dbitem = db.Server_Vehicle_Items.FirstOrDefault(i => i.vehId == vehId && i.itemName == itemName && i.isInGlovebox == inGlovebox);
                        if (dbitem != null)
                        {
                            dbitem.itemAmount = dbitem.itemAmount += itemAmount;
                        }
                        db.SaveChanges();
                    }
                }
                else
                {
                    //Existiert nicht, Item neu adden
                    ServerVehicleTrunkItems_.Add(itemData);
                    using (gtaContext db = new gtaContext())
                    {
                        db.Server_Vehicle_Items.Add(itemData);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static int GetVehicleIdByPlate(string plate)
        {
            try
            {
                var vehicle = ServerVehicles_.FirstOrDefault(x => x.plate == plate);
                if(vehicle != null)
                {
                    return vehicle.id;
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return 0;
        }

        public static int GetVehicleTrunkItemAmount(int vehId, string itemName, bool inGlovebox)
        {
            try
            {
                if (vehId <= 0 || itemName == "") return 0;
                var item = ServerVehicleTrunkItems_.FirstOrDefault(x => x.vehId == vehId && x.itemName == itemName && x.isInGlovebox == inGlovebox);
                if (item != null) return item.itemAmount;
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return 0;
        }

        public static void RemoveVehicleTrunkItemAmount(int vehId, string itemName, int itemAmount, bool inGlovebox)
        {
            try
            {
                if (vehId <= 0 || itemName == "" || itemAmount == 0) return;
                var item = ServerVehicleTrunkItems_.FirstOrDefault(i => i.vehId == vehId && i.itemName == itemName && i.isInGlovebox == inGlovebox);
                if (item != null)
                {
                    int prevAmount = item.itemAmount;
                    item.itemAmount -= itemAmount;
                    using (gtaContext db = new gtaContext())
                    {
                        if (item.itemAmount > 0)
                        {
                            db.Server_Vehicle_Items.Update(item);
                            db.SaveChanges();
                        }
                        else
                            RemoveVehicleTrunkItem(vehId, itemName, inGlovebox);
                    }
                }
            }
            catch (Exception _) { Alt.Log($"{_}"); }
        }

        public static void RemoveVehicleTrunkItem(int vehId, string itemName, bool inGlovebox)
        {
            var item = ServerVehicleTrunkItems_.FirstOrDefault(i => i.vehId == vehId && i.itemName == itemName && i.isInGlovebox == inGlovebox);
            if (item != null)
            {
                ServerVehicleTrunkItems_.Remove(item);
                using (gtaContext db = new gtaContext())
                {
                    db.Server_Vehicle_Items.Remove(item);
                    db.SaveChanges();
                }
            }
        }

        public static bool ExistVehicleTrunkItem(int vehId, string itemName, bool isInGlovebox)
        {
            try
            {
                if (vehId <= 0 || itemName == "") return false;
                var trunkData = ServerVehicleTrunkItems_.FirstOrDefault(x => x.vehId == vehId && x.itemName == itemName && x.isInGlovebox == isInGlovebox);
                if (trunkData != null) return true;
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return false;
        }

        public static string GetVehicleTrunkItems(int vehId, bool isInGlovebox)
        {
            var items = ServerVehicleTrunkItems_.ToList().Where(x => x != null && x.vehId == vehId && x.isInGlovebox == isInGlovebox).Select(x => new
            {
                x.id,
                x.vehId,
                x.itemName,
                x.itemAmount,
                itemPicName = ServerItems.ReturnItemPicSRC(x.itemName),
            }).ToList();
            return JsonConvert.SerializeObject(items);
        }

        public static void SetVehicleLockState(IVehicle veh, bool state)
        {
            if (veh == null || !veh.Exists) return;
            ulong vehID = veh.GetVehicleId();
            if (vehID == 0) return;
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if(vehs != null)
            {
                AltAsync.Do(() =>
                {
                    if (state == true) { veh.LockState = VehicleLockState.Locked; }
                    else if (state == false) { veh.LockState = VehicleLockState.Unlocked; }
                });
                vehs.lockState = state;
                
                using (gtaContext db = new gtaContext())
                {
                    db.Server_Vehicles.Update(vehs);
                    db.SaveChanges();
                }
            }
        }

        public static bool GetVehicleLockState(IVehicle veh)
        {
            ulong vehID = veh.GetVehicleId();
            if (veh == null || !veh.Exists || vehID == 0) return false;
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if (vehs != null)
            {
                return vehs.lockState;
            }
            return false;
        }

        public static void SetVehicleEngineState(IVehicle veh, bool state)
        {
            if (veh == null || !veh.Exists) return;
            ulong vehID = veh.GetVehicleId();
            if (vehID == 0) return;
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if (vehs != null)
            {
                AltAsync.Do(() =>
                {
                    veh.EngineOn = state;
                });
                vehs.engineState = state;
            }
        }

        public static bool GetVehicleEngineState(IVehicle veh)
        {
            ulong vehID = veh.GetVehicleId();
            if (veh == null || !veh.Exists || vehID == 0) return false;
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if (vehs != null)
            {
                return vehs.engineState;
            }
            return false;
        }

        public static Position GetVehiclePosition(IVehicle veh)
        {
            Position pos = new Position();
            ulong vehId = veh.GetVehicleId();
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehId);
            if(vehs != null)
            {
                pos = new Position(vehs.posX, vehs.posY, vehs.posZ);
            }
            return pos;
        }

        public static Rotation GetVehicleRotation(IVehicle veh)
        {
            Rotation rot = new Rotation();
            ulong vehID = veh.GetVehicleId();
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if(vehs != null)
            {
                rot = new Rotation(vehs.rotX, vehs.rotY, vehs.rotZ);
            }
            return rot;
        }

        public static int GetVehicleOwner(IVehicle veh)
        {
            ulong vehID = veh.GetVehicleId();
            if (veh == null || !veh.Exists || vehID == 0) return 0;
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if(vehs != null)
            {
                return vehs.charid;
            }
            return 0;
        }

        public static ulong GetVehicleHashById(int vehId)
        {
            try
            {
                if (vehId <= 0) return 0;
                var vehs = ServerVehicles_.FirstOrDefault(x => x.id == vehId);
                if(vehs != null)
                {
                    return vehs.hash;
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return 0;
        }

        public static int GetVehicleOwnerById(int vehId)
        {
            try
            {
                if (vehId <= 0) return 0;
                var vehs = ServerVehicles_.FirstOrDefault(v => v.id == vehId);
                if(vehs != null)
                {
                    return vehs.charid;
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return 0;
        }

        public static int GetVehicleFactionId(IVehicle veh)
        {
            ulong vehID = veh.GetVehicleId();
            if (veh == null || !veh.Exists || vehID == 0) return 0;
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if(vehs != null)
            {
                return vehs.faction;
            }
            return 0;
        }

        public static int GetVehicleType(IVehicle veh)
        {
            ulong vehID = veh.GetVehicleId();
            if (veh == null || !veh.Exists || vehID == 0) return -1;
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if(vehs != null)
            {
                return vehs.vehType;
            }
            return -1;
        }

        public static float GetVehicleFuel(IVehicle veh)
        {
            ulong vehID = veh.GetVehicleId();
            if (veh == null || !veh.Exists || vehID == 0) return 0;
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if(vehs != null)
            {
                return vehs.fuel;
            }
            return 0;
        }

        public static void SetVehicleFuel(IVehicle veh, float fuel)
        {
            try
            {
                if (veh == null || !veh.Exists) return;
                ulong vehID = veh.GetVehicleId();
                if (vehID == 0) return;
                var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
                if (vehs != null)
                {
                    vehs.fuel = fuel;
                    if (vehs.fuel <= 0)
                    {
                        vehs.fuel = 0f;
                        SetVehicleEngineState(veh, false);
                    }
                    else if (vehs.fuel > GetVehicleFuelLimitOnHash(veh.Model)) vehs.fuel = (float)GetVehicleFuelLimitOnHash(veh.Model);
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static float GetVehicleKM(IVehicle veh)
        {
            ulong vehID = veh.GetVehicleId();
            if (veh == null || !veh.Exists || vehID == 0) return 0;
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if(vehs != null)
            {
                return vehs.KM;
            }
            return 0;
        }

        public static void SetVehicleKM(IVehicle veh, float km)
        {
            try
            {
                if (veh == null || !veh.Exists) return;
                ulong vehID = veh.GetVehicleId();
                if (vehID == 0) return;
                var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
                if (vehs != null)
                {
                    vehs.KM = km;
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static void SetVehicleEngineHealthy(IVehicle veh, bool state)
        {
            try
            {
                if (veh == null || !veh.Exists) return;
                ulong vehID = veh.GetVehicleId();
                if (vehID == 0) return;
                var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
                if(vehs != null)
                {
                    vehs.isEngineHealthy = state;
                    using (gtaContext db = new gtaContext())
                    {
                        db.Server_Vehicles.Update(vehs);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static bool IsVehicleEngineHealthy(IVehicle veh)
        {
            try
            {
                if (veh == null || !veh.Exists) return false;
                ulong vehID = veh.GetVehicleId();
                if (vehID == 0) return false;
                var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
                if(vehs != null)
                {
                    return vehs.isEngineHealthy;
                }
                return false;
            }
            catch(Exception e)
            {
                Alt.Log($"{e}");
                return false;
            }
        }        

        public static string GetVehicleNameOnHash(ulong hash)
        {
            return ServerAllVehicles.ServerAllVehicles_.FirstOrDefault(x => x.hash == hash)?.name ?? "";
        }

        public static string GetVehicleManufactorOnHash(ulong hash)
        {
            return ServerAllVehicles.ServerAllVehicles_.FirstOrDefault(x => x.hash == hash)?.manufactor ?? "";
        }

        public static string GetVehicleFuelTypeOnHash(ulong hash)
        {
            return ServerAllVehicles.ServerAllVehicles_.FirstOrDefault(x => x.hash == hash)?.fuelType ?? "";
        }

        public static int GetVehicleFuelLimitOnHash(ulong hash)
        {
            return ServerAllVehicles.ServerAllVehicles_.FirstOrDefault(x => x.hash == hash)?.maxFuel ?? 0;
        }

        public static int GetVehicleTrunkCapacityOnHash(ulong hash)
        {
            return ServerAllVehicles.ServerAllVehicles_.FirstOrDefault(x => x.hash == hash)?.trunkCapacity ?? 0;
        }

        public static int GetVehicleMaxSeatsOnHash(ulong hash)
        {
            return ServerAllVehicles.ServerAllVehicles_.FirstOrDefault(x => x.hash == hash)?.seats ?? 0;
        }        

        public static bool ExistServerVehiclePlate(string plate)
        {
            bool Exist = false;
            var dbveh = ServerVehicles_.ToList().FirstOrDefault(x => x.plate == plate);
            if(dbveh != null)
            {
                Exist = true;
            }
            return Exist;
        }

        public static DateTime GetVehicleBuyDate(int vehicleId)
        {
            DateTime dt = new DateTime(0001, 01, 01);
            if (vehicleId <= 0) return dt;
            var vehs = ServerVehicles_.FirstOrDefault(p => p.id == vehicleId);
            if (vehs != null)
            {
                dt = vehs.buyDate;
            }
            return dt;
        }

        public static void SetServerVehiclePlate(int vehID, string plate)
        {
            try
            {
                if (vehID <= 0 || plate == "") return;
                var vehicle = ServerVehicles_.FirstOrDefault(x => x.id == vehID);
                if (vehicle != null)
                {
                    vehicle.plate = plate;

                    using (gtaContext db = new gtaContext())
                    {
                        db.Server_Vehicles.Update(vehicle);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static bool IsVehicleInGarage(IVehicle veh)
        {
            ulong vehID = veh.GetVehicleId();
            if (veh == null || !veh.Exists || vehID == 0) return false;
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if(vehs != null)
            {
                return vehs.isInGarage;
            }
            return false;
        }

        public static int GetVehicleGarageId(IVehicle veh)
        {
            ulong vehID = veh.GetVehicleId();
            if (veh == null || !veh.Exists || vehID == 0) return 0;
            var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
            if(vehs != null)
            {
                return vehs.garageId;
            }
            return 0;
        }       

        public static void SetVehicleInGarage(IVehicle veh, bool state, int garageId)
        {
            try
            {
                if (veh == null || !veh.Exists) return;
                ulong vehID = veh.GetVehicleId();
                if (vehID == 0) return;
                var dbVehicle = ServerVehicles_.FirstOrDefault(v => v.id == (int)veh.GetVehicleId());
                if (dbVehicle == null) return;
                dbVehicle.isInGarage = state;
                dbVehicle.lastUsage = DateTime.Now;
                if (state == true) { dbVehicle.garageId = garageId; dbVehicle.engineState = false; dbVehicle.lockState = true; veh.Remove(); }
                using (gtaContext db = new gtaContext())
                {
                    db.Server_Vehicles.Update(dbVehicle);
                    db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static float GetVehicleVehicleTrunkWeight(int vehId, bool searchOnlyGlovebox)
        {
            try
            {
                float invWeight = 0f;
                if (vehId <= 0) return invWeight;

                if (searchOnlyGlovebox)
                {
                    var gItem = ServerVehicleTrunkItems_.ToList().Where(i => i.vehId == vehId && i.isInGlovebox == true);
                    foreach (Server_Vehicle_Items i in gItem)
                    {
                        string iName = ServerItems.ReturnNormalItemName(i.itemName);
                        var serverItem = ServerItems.ServerItems_.ToList().FirstOrDefault(si => si.itemName == iName);
                        if (serverItem != null)
                        {
                            invWeight += serverItem.itemWeight * i.itemAmount;
                        }
                    }
                    return invWeight;
                }

                var item = ServerVehicleTrunkItems_.ToList().Where(i => i.vehId == vehId);
                foreach (Server_Vehicle_Items i in item)
                {
                    string iName = ServerItems.ReturnNormalItemName(i.itemName);
                    var serverItem = ServerItems.ServerItems_.ToList().FirstOrDefault(si => si.itemName == iName);
                    if (serverItem != null)
                    {
                        invWeight += serverItem.itemWeight * i.itemAmount;
                    }
                }
                return invWeight;
            }
            catch(Exception e)
            {
                Alt.Log($"{e}");
            }
            return 0f;
        }


        public static void SaveVehiclePositionAndStates(IVehicle veh)
        {
            try
            {
                ulong vehID = veh.GetVehicleId();
                if (veh == null || !veh.Exists || vehID == 0) return;
                var vehs = ServerVehicles_.FirstOrDefault(v => (ulong)v.id == vehID);
                if (vehs != null)
                {
                    vehs.posX = veh.Position.X;
                    vehs.posY = veh.Position.Y;
                    vehs.posZ = veh.Position.Z;
                    vehs.rotX = veh.Rotation.Pitch;
                    vehs.rotY = veh.Rotation.Roll;
                    vehs.rotZ = veh.Rotation.Yaw;
                    vehs.engineState = veh.EngineOn;
                    if (veh.LockState == VehicleLockState.Locked) { vehs.lockState = true; }
                    else if (veh.LockState == VehicleLockState.Unlocked) { vehs.lockState = false; }
                    vehs.KM = GetVehicleKM(veh);
                    vehs.fuel = GetVehicleFuel(veh);

                    using (gtaContext db = new gtaContext())
                    {
                        db.Server_Vehicles.Update(vehs);
                        db.SaveChanges();
                    }
                }    
            }
            catch(Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static string GetAllParkedOutFactionVehicles(string factionShort)
        {
            if (factionShort == "") return "";

            var items = Alt.Server.GetVehicles().ToList().Where(x => x.NumberplateText.Contains(factionShort)).Select(x => new
            {
                vehName = GetVehicleNameOnHash(x.Model),
                vehHash = x.Model,
                vehPlate = x.NumberplateText,
                vehPosX = x.Position.X,
                vehPosY = x.Position.Y,
            }).ToList();

            return JsonConvert.SerializeObject(items);
        }


        public static void AddVehicleModToList(params int[] args)
        {
            try 
            { 
                var vehMods = new Server_Vehicles_Mod
                {
                    id = args[0],
                    vehId = args[1],
                    colorPrimary = (byte)args[2],
                    colorSecondary = (byte)args[3],
                    spoiler = (byte)args[4],
                    front_bumper = (byte)args[5],
                    rear_bumper = (byte)args[6],
                    side_skirt = (byte)args[7],
                    exhaust = (byte)args[8],
                    frame = (byte)args[9],
                    grille = (byte)args[10],
                    hood = (byte)args[11],
                    fender = (byte)args[12],
                    right_fender = (byte)args[13],
                    roof = (byte)args[14],
                    engine = (byte)args[15],
                    brakes = (byte)args[16],
                    transmission = (byte)args[17],
                    horns = (byte)args[18],
                    suspension = (byte)args[19],
                    armor = (byte)args[20],
                    turbo = (byte)args[21],
                    xenon = (byte)args[22],
                    wheel_type = (byte)args[23],
                    wheels = (byte)args[24],
                    wheelcolor = (byte)args[25],
                    plate_holder = (byte)args[26],
                    trim_design = (byte)args[27],
                    ornaments = (byte)args[28],
                    dial_design = (byte)args[29],
                    steering_wheel = (byte)args[30],
                    shift_lever = (byte)args[31],
                    plaques = (byte)args[32],
                    hydraulics = (byte)args[33],
                    airfilter = (byte)args[34],
                    window_tint = (byte)args[35],
                    livery = (byte)args[36],
                    plate = (byte)args[37],
                    neon = (byte)args[38],
                    neon_r = (byte)args[39],
                    neon_g = (byte)args[40],
                    neon_b = (byte)args[41],
                    smoke_r = (byte)args[42],
                    smoke_g = (byte)args[43],
                    smoke_b = (byte)args[44],
                    colorPearl = (byte)args[45],
                    headlightColor = (byte)args[46]
                };

                ServerVehiclesMod_.Add(vehMods);

                using (gtaContext db = new gtaContext())
                {
                    var vMod = db.Server_Vehicles_Mods.FirstOrDefault(v => v.id == vehMods.id && v.vehId == vehMods.vehId);
                    if (vMod == null)
                    {
                        db.Server_Vehicles_Mods.Add(vehMods);
                        db.SaveChanges();
                    }
                }
            }
            catch(Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static byte GetCurrentVehMod(IVehicle veh, int modTyp)
        {
            if (veh == null || !veh.Exists) return 0;
            ulong vehID = veh.GetVehicleId();
            if (vehID == 0) return 0;
            var vMod = ServerVehiclesMod_.FirstOrDefault(v => v.vehId == (int)vehID);
            if (vMod != null)
            {
                switch(modTyp)
                {
                    case 0: return (byte)vMod.spoiler;
                    case 1: return (byte)vMod.front_bumper;
                    case 2: return (byte)vMod.rear_bumper;
                    case 3: return (byte)vMod.side_skirt;
                    case 4: return (byte)vMod.exhaust;
                    case 5: return (byte)vMod.frame;
                    case 6: return (byte)vMod.grille;
                    case 7: return (byte)vMod.hood;
                    case 8: return (byte)vMod.fender;
                    case 9: return (byte)vMod.right_fender;
                    case 10: return (byte)vMod.roof;
                    case 11: return (byte)vMod.engine;
                    case 12: return (byte)vMod.brakes;
                    case 13: return (byte)vMod.transmission;
                    case 14: return (byte)vMod.horns;
                    case 15: return (byte)vMod.suspension;
                    case 16: return (byte)vMod.armor;
                    case 18: return (byte)vMod.turbo;
                    case 22: return (byte)vMod.xenon;
                    case 131: return (byte)vMod.wheel_type;
                    case 23: return (byte)vMod.wheels;
                    case 132: return (byte)vMod.wheelcolor;
                    case 25: return (byte)vMod.plate_holder;
                    case 27: return (byte)vMod.trim_design;
                    case 28: return (byte)vMod.ornaments;
                    case 30: return (byte)vMod.dial_design;
                    case 33: return (byte)vMod.steering_wheel;
                    case 34: return (byte)vMod.shift_lever;
                    case 35: return (byte)vMod.plaques;
                    case 38: return (byte)vMod.hydraulics;
                    case 40: return (byte)vMod.airfilter;
                    case 46: return (byte)vMod.window_tint;
                    case 48: return (byte)vMod.livery;
                    case 62: return (byte)vMod.plate;
                    case 100: return (byte)vMod.colorPrimary;
                    case 200: return (byte)vMod.colorSecondary;
                    case 250: return (byte)vMod.colorPearl;
                    case 280: return (byte)vMod.headlightColor;
                    case 299: return (byte)vMod.neon;
                    case 300: return (byte)vMod.neon_r;
                    case 301: return (byte)vMod.neon_g;
                    case 302: return (byte)vMod.neon_b;
                    case 400: return (byte)vMod.smoke_r;
                    case 401: return (byte)vMod.smoke_g;
                    case 402: return (byte)vMod.smoke_b;
                    default: return 0;
                }
            }
            return 0;
        }

        public static void SetVehicleModsCorrectly(IVehicle veh)
        {
            try
            {
                if (veh == null || !veh.Exists) return;
                veh.ModKit = 1;
                veh.SetMod(0, GetCurrentVehMod(veh, 0));
                veh.SetMod(1, GetCurrentVehMod(veh, 1));
                veh.SetMod(2, GetCurrentVehMod(veh, 2));
                veh.SetMod(3, GetCurrentVehMod(veh, 3));
                veh.SetMod(4, GetCurrentVehMod(veh, 4));
                veh.SetMod(5, GetCurrentVehMod(veh, 5));
                veh.SetMod(6, GetCurrentVehMod(veh, 6));
                veh.SetMod(7, GetCurrentVehMod(veh, 7));
                veh.SetMod(8, GetCurrentVehMod(veh, 8));
                veh.SetMod(9, GetCurrentVehMod(veh, 9));
                veh.SetMod(10, GetCurrentVehMod(veh, 10));
                veh.SetMod(11, GetCurrentVehMod(veh, 11));
                veh.SetMod(12, GetCurrentVehMod(veh, 12));
                veh.SetMod(13, GetCurrentVehMod(veh, 13));
                veh.SetMod(14, GetCurrentVehMod(veh, 14));
                veh.SetMod(15, GetCurrentVehMod(veh, 15));
                veh.SetMod(16, GetCurrentVehMod(veh, 16));
                veh.SetMod(18, GetCurrentVehMod(veh, 18));
                veh.SetMod(22, GetCurrentVehMod(veh, 22));
                veh.SetWheels(0, GetCurrentVehMod(veh, 23));
                veh.SetMod(25, GetCurrentVehMod(veh, 25));
                veh.SetMod(27, GetCurrentVehMod(veh, 27));
                veh.SetMod(28, GetCurrentVehMod(veh, 28));
                veh.SetMod(30, GetCurrentVehMod(veh, 30));
                veh.SetMod(33, GetCurrentVehMod(veh, 33));
                veh.SetMod(34, GetCurrentVehMod(veh, 34));
                veh.SetMod(35, GetCurrentVehMod(veh, 35));
                veh.SetMod(38, GetCurrentVehMod(veh, 38));
                veh.SetMod(40, GetCurrentVehMod(veh, 40));
                veh.SetMod(48, GetCurrentVehMod(veh, 48));
                veh.SetMod(62, GetCurrentVehMod(veh, 62));
                veh.PrimaryColor = GetCurrentVehMod(veh, 100);
                veh.SecondaryColor = GetCurrentVehMod(veh, 200);
                veh.PearlColor = GetCurrentVehMod(veh, 250);
                veh.HeadlightColor = GetCurrentVehMod(veh, 280);
                veh.WheelColor = GetCurrentVehMod(veh, 132);
                if (GetCurrentVehMod(veh, 299) == 1)
                {
                    veh.SetNeonActive(true, true, true, true);
                    veh.NeonColor = new Rgba(GetCurrentVehMod(veh, 300), GetCurrentVehMod(veh, 301), GetCurrentVehMod(veh, 302), 1);
                } else if(GetCurrentVehMod(veh, 299) == 0) { veh.SetNeonActive(false, false, false, false); veh.NeonColor = new Rgba(GetCurrentVehMod(veh, 300), GetCurrentVehMod(veh, 301), GetCurrentVehMod(veh, 302), 1); }
                veh.CustomTires = true;
                veh.TireSmokeColor = new Rgba(GetCurrentVehMod(veh, 400), GetCurrentVehMod(veh, 401), GetCurrentVehMod(veh, 402), 255);
                veh.WindowTint = GetCurrentVehMod(veh, 46);
                //veh.WheelType = GetCurrentVehMod(veh, 131); todo

            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static void InstallVehicleMod(IVehicle veh, int modType, int modId)
        {
            try
            {
                if (veh == null || !veh.Exists) return;
                if (veh.GetVehicleId() <= 0) return;
                var mod = ServerVehiclesMod_.FirstOrDefault(x => x.vehId == (int)veh.GetVehicleId());
                if(mod != null)
                {
                    veh.ModKit = 1;
                    switch (modType)
                    {
                        case 0: mod.spoiler = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 1: mod.front_bumper = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 2: mod.rear_bumper = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 3: mod.side_skirt = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 4: mod.exhaust = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 5: mod.frame = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 6: mod.grille = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 7: mod.hood = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 8: mod.fender = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 9: mod.right_fender = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 10: mod.roof = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 11: mod.engine = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 12: mod.brakes = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 13: mod.transmission = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 14: mod.horns = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 15: mod.suspension = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 16: mod.armor = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 18: mod.turbo = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 22: mod.xenon = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        //ToDo: Reifentyp
                        //case 131: mod.wheel_type = modId; mod.wheels = -1; veh.WheelType = modId; veh.SetMod(23, -1); break;
                        case 23: mod.wheels = modId; veh.SetWheels(0, (byte)modId); break;
                        case 132: mod.wheelcolor = modId; veh.WheelColor = (byte)modId; break;
                        case 25: mod.plate_holder = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 27: mod.trim_design = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 28: mod.ornaments = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 30: mod.dial_design = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 33: mod.steering_wheel = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 34: mod.shift_lever = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 35: mod.plaques = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 38: mod.hydraulics = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 40: mod.airfilter = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 46: mod.window_tint = modId; veh.WindowTint = (byte)modId; break;
                        case 48: mod.livery = modId; veh.SetMod((byte)modType, (byte)modId); veh.Livery = (byte)modId; break;
                        case 62: mod.plate = modId; veh.SetMod((byte)modType, (byte)modId); break;
                        case 100: mod.colorPrimary = modId; veh.PrimaryColor = (byte)modId; break;
                        case 200: mod.colorSecondary = modId; veh.SecondaryColor = (byte)modId; break;
                        case 250: mod.colorPearl = modId; veh.PearlColor = (byte)modId; break;
                        case 280: mod.headlightColor = modId; veh.HeadlightColor = (byte)modId; break;
                        case 299: mod.neon = modId; veh.SetNeonActive(false, false, false, false); break;
                        case 300: mod.neon_r = modId; veh.SetNeonActive(true, true, true, true); veh.NeonColor = new Rgba((byte)mod.neon_r, (byte)mod.neon_g, (byte)mod.neon_b, 255); mod.neon = 1; break;
                        case 301: mod.neon_g = modId; veh.SetNeonActive(true, true, true, true); veh.NeonColor = new Rgba((byte)mod.neon_r, (byte)mod.neon_g, (byte)mod.neon_b, 255); mod.neon = 1; break;
                        case 302: mod.neon_b = modId; veh.SetNeonActive(true, true, true, true); veh.NeonColor = new Rgba((byte)mod.neon_r, (byte)mod.neon_g, (byte)mod.neon_b, 255); mod.neon = 1; break;
                        case 400: mod.smoke_r = modId; veh.TireSmokeColor = new Rgba((byte)mod.smoke_r, (byte)mod.smoke_g, (byte)mod.smoke_b, 255); break;
                        case 401: mod.smoke_g = modId; veh.TireSmokeColor = new Rgba((byte)mod.smoke_r, (byte)mod.smoke_g, (byte)mod.smoke_b, 255); break;
                        case 402: mod.smoke_b = modId; veh.TireSmokeColor = new Rgba((byte)mod.smoke_r, (byte)mod.smoke_g, (byte)mod.smoke_b, 255); break;
                    }

                    using (gtaContext db = new gtaContext())
                    {
                        db.Server_Vehicles_Mods.Update(mod);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static void CreateVehicle(ulong hash, int charid, int vehtype, int faction, bool isInGarage, int garageId, Position pos, Rotation rot, string plate, int primaryColor, int secondaryColor)
        {
            try
            {
                var nVehicle = new Server_Vehicles
                {
                    charid = charid,
                    hash = hash,
                    vehType = vehtype,
                    faction = faction,
                    fuel = GetVehicleFuelLimitOnHash(hash),
                    KM = 0f,
                    engineState = false,
                    isEngineHealthy = true,
                    lockState = true,
                    isInGarage = isInGarage,
                    garageId = garageId,
                    posX = pos.X,
                    posY = pos.Y,
                    posZ = pos.Z,
                    rotX = rot.Pitch,
                    rotY = rot.Roll,
                    rotZ = rot.Yaw,
                    plate = plate,
                    lastUsage = DateTime.Now,
                    buyDate = DateTime.Now
                };
                ServerVehicles_.Add(nVehicle);

                using (gtaContext db = new gtaContext())
                {
                    db.Server_Vehicles.Add(nVehicle);
                    db.SaveChanges();
                }

                if (vehtype != 2) { AddVehicleModToList(nVehicle.id, nVehicle.id, primaryColor, secondaryColor, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 0, 0, 0, 0, 0); }
                if (isInGarage) return;
                ClassicVehicle veh = (ClassicVehicle)Alt.CreateVehicle((uint)hash, pos, rot);
                veh.NumberplateText = plate;
                veh.LockState = VehicleLockState.Locked;
                veh.EngineOn = false;
                veh.SetVehicleId((ulong)nVehicle.id);
                veh.SetVehicleTrunkState(false);
                if (vehtype != 2) { SetVehicleModsCorrectly(veh); }
            }
            catch(Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static void RemoveVehiclePermanently(IVehicle veh)
        {
            try
            {
                if (veh == null || !veh.Exists) return;
                ulong vehID; vehID = veh.GetVehicleId();
                if (vehID <= 0) return;
                var mod = ServerVehiclesMod_.FirstOrDefault(x => x.vehId == (int)vehID);
                var vehItems = ServerVehicleTrunkItems_.Where(x => x.vehId == (int)vehID).ToList();
                var vehDb = ServerVehicles_.FirstOrDefault(x => x.id == (int)vehID);
                using (gtaContext db = new gtaContext())
                {
                    foreach (var item in vehItems)
                    {
                        db.Server_Vehicle_Items.Remove(item);
                        ServerVehicleTrunkItems_.Remove(item);
                    }

                    if (mod != null)
                    {
                        db.Server_Vehicles_Mods.Remove(mod);
                        ServerVehiclesMod_.Remove(mod);
                    }

                    if (vehDb != null)
                    {
                        db.Server_Vehicles.Remove(vehDb);
                        ServerVehicles_.Remove(vehDb);
                    }
                    db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static int ReturnMaxVehicleMods(IVehicle veh, int modType)
        {
            int maxMods = 0;
            try
            {
                maxMods = ServerAllVehicleMods_.Where(x => x.vehicleHash == veh.Model && x.modType == modType).Count();
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return maxMods;
        }

        public static int ReturnMaxTuningWheels(int modType)
        {
            try
            {
                int count = ServerAllVehicleMods_.Where(x => (int)x.vehicleHash == 0 && x.modType == modType).Count();
                return count;
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return 0;
        }

        public static void SetVehicleModID(IVehicle veh, string Type, string Action, int ModType)
        {
            try
            {
                if (veh == null || !veh.Exists) return;
                if (veh.GetVehicleId() <= 0) return;
                veh.ModKit = 1;
                if (Type == "Preview")
                {
                    if(Action == "<")
                    {
                        byte CurModID = 0;
                        if (ModType == 280) CurModID = veh.HeadlightColor;
                        else CurModID = veh.GetMod((byte)ModType);
                        if (CurModID == 255) CurModID = 0;
                        if(ModType != 131)
                        {
                            if(ModType != 46)
                            {
                                if(ModType != 132)
                                {
                                    if (ModType == 23) CurModID = veh.WheelVariation;
                                    else if (ModType == 100) CurModID = veh.PrimaryColor;
                                    else if (ModType == 200) CurModID = veh.SecondaryColor;
                                    else if (ModType == 250) CurModID = veh.PearlColor;
                                    else if (ModType == 280) CurModID = veh.HeadlightColor;

                                    if (CurModID <= 0)
                                    {
                                        if(ModType == 23)
                                        {                                           
                                            int WheelT = veh.WheelType;
                                            if (WheelT == 255) WheelT = 0;
                                            veh.SetWheels(0, (byte)ReturnMaxTuningWheels(Convert.ToInt32(ModType + "" + WheelT)));
                                        }
                                        else if(ModType == 100)
                                        {
                                            veh.PrimaryColor = Convert.ToByte(ReturnMaxTuningWheels(132));
                                        }
                                        else if (ModType == 200)
                                        {
                                            veh.SecondaryColor = Convert.ToByte(ReturnMaxTuningWheels(132));
                                        }
                                        else if (ModType == 250)
                                        {
                                            veh.PearlColor = Convert.ToByte(ReturnMaxTuningWheels(132));
                                        }
                                        else if(ModType == 280)
                                        {
                                            veh.HeadlightColor = Convert.ToByte(ReturnMaxTuningWheels(280));
                                        }
                                        else if(ModType == 11 || ModType == 12 || ModType == 13 || ModType == 14 || ModType == 15 || ModType == 22)
                                        {
                                            veh.SetMod((byte)ModType, (byte)ReturnMaxTuningWheels(ModType));
                                        }
                                        else
                                        {
                                            veh.SetMod((byte)ModType, (byte)ReturnMaxVehicleMod(veh, ModType));
                                        }
                                    }
                                    else if(CurModID > 0)
                                    {
                                        if (ModType == 23)
                                        {
                                            CurModID = veh.WheelVariation;
                                            veh.SetWheels(0, Convert.ToByte(CurModID - 1));
                                        }
                                        else if(ModType == 100)
                                        {
                                            CurModID = veh.PrimaryColor;
                                            veh.PrimaryColor = Convert.ToByte(CurModID - 1);
                                        }
                                        else if (ModType == 200)
                                        {
                                            CurModID = veh.SecondaryColor;
                                            veh.SecondaryColor = Convert.ToByte(CurModID - 1);
                                        }
                                        else if (ModType == 250)
                                        {
                                            CurModID = veh.PearlColor;
                                            veh.PearlColor = Convert.ToByte(CurModID - 1);
                                        }
                                        else if(ModType == 280)
                                        {
                                            CurModID = veh.HeadlightColor;
                                            veh.HeadlightColor = Convert.ToByte(CurModID - 1);
                                        }
                                        else
                                        {
                                            veh.SetMod((byte)ModType, Convert.ToByte(CurModID - 1));
                                        }
                                    }
                                }
                                else if(ModType == 132)
                                {
                                    CurModID = veh.WheelColor;
                                    if(CurModID <= 0)
                                    {
                                        veh.WheelColor = (byte)ReturnMaxTuningWheels(ModType);
                                    }
                                    else if(CurModID > 0)
                                    {
                                        veh.WheelColor = Convert.ToByte(CurModID - 1);
                                    }
                                }
                            }
                            else if(ModType == 46)
                            {
                                CurModID = veh.WindowTint;
                                if (CurModID == 255) CurModID = 0;
                                if (CurModID == 0) veh.WindowTint = (byte)ReturnMaxTuningWheels(46);
                                else veh.WindowTint = Convert.ToByte(CurModID - 1);
                            }
                        }
                        else if(ModType == 131)
                        {
                            CurModID = veh.WheelType;
                            if (CurModID == 255) CurModID = 0;
                            //ToDo: Reifentyp
                            //if (CurModID == 0) veh.WheelType = (byte)ReturnMaxTuningWheels(131);
                            //else if (CurModID != 0) veh.WheelType = Convert.ToByte(CurModID - 1);
                        }
                    }
                    else if(Action == ">")
                    {
                        int CurModID = 0;
                        if (ModType == 280) CurModID = veh.HeadlightColor;
                        else CurModID = veh.GetMod((byte)ModType);
                        if (CurModID == 255) CurModID = 0;

                        if (ModType == 23)
                        {
                            CurModID = veh.WheelVariation;
                            int WheelT = veh.WheelType;
                            if (WheelT == 255) WheelT = 0;
                            if (CurModID == ReturnMaxTuningWheels(Convert.ToInt32(ModType + "" + WheelT))) veh.SetWheels(0, 0);
                            else veh.SetWheels(0, Convert.ToByte(CurModID + 1));
                        }
                        else if (ModType == 46)
                        {
                            CurModID = veh.WindowTint;
                            if (CurModID == 255) CurModID = 0;

                            if (CurModID == ReturnMaxTuningWheels(46)) veh.WindowTint = 0;
                            else veh.WindowTint = Convert.ToByte(CurModID + 1);
                        }
                        else if (ModType == 131)
                        {
                            CurModID = veh.WheelType;
                            if (CurModID == 255) CurModID = 0;
                            //ToDo: Reifentyp
                            //if (CurModID == 9) veh.WheelType = 0;
                            //else veh.WheelType = CurModID + 1;
                        }
                        else if (ModType == 132)
                        {
                            CurModID = veh.WheelColor;
                            if (CurModID == 255) CurModID = 0;
                            if (CurModID == ReturnMaxTuningWheels(132)) veh.WheelColor = 0;
                            else veh.WheelColor = Convert.ToByte(CurModID + 1);
                        }
                        else if(ModType == 100)
                        {
                            CurModID = veh.PrimaryColor;
                            if (CurModID == 255) CurModID = 0;
                            if (CurModID == ReturnMaxTuningWheels(132)) veh.PrimaryColor = 0;
                            else veh.PrimaryColor = Convert.ToByte(CurModID + 1);
                        }
                        else if (ModType == 200)
                        {
                            CurModID = veh.SecondaryColor;
                            if (CurModID == 255) CurModID = 0;
                            if (CurModID == ReturnMaxTuningWheels(132)) veh.SecondaryColor = 0;
                            else veh.SecondaryColor = Convert.ToByte(CurModID + 1);
                        }
                        else if (ModType == 250)
                        {
                            CurModID = veh.PearlColor;
                            if (CurModID == 255) CurModID = 0;
                            if (CurModID == ReturnMaxTuningWheels(132)) veh.PearlColor = 0;
                            else veh.PearlColor = Convert.ToByte(CurModID + 1);
                        }
                        else if(ModType == 280)
                        {
                            CurModID = veh.HeadlightColor;
                            if (CurModID == 255) CurModID = 0;
                            if (CurModID == ReturnMaxTuningWheels(280)) veh.HeadlightColor = 0;
                            else veh.HeadlightColor = Convert.ToByte(CurModID + 1);
                        }
                        else if (ModType == 11 || ModType == 12 || ModType == 13 || ModType == 14 || ModType == 15 || ModType == 22)
                        {
                            if (CurModID == ReturnMaxTuningWheels(ModType)) veh.SetMod((byte)ModType, 0);
                            else 
                            {
                                veh.SetMod((byte)ModType, Convert.ToByte(CurModID + 1));
                            }
                        }
                        else
                        {
                            if (CurModID == ReturnMaxVehicleMod(veh, ModType)) veh.SetMod((byte)ModType, 0);
                            else veh.SetMod((byte)ModType, Convert.ToByte(CurModID + 1));
                        }
                    }
                }
                else if(Type == "Build")
                {
                    byte curModId = 0;
                    if(ModType == 131)
                    {
                        curModId = veh.WheelType;
                        if (curModId == 255) curModId = 0;
                    }
                    else if(ModType == 132)
                    {
                        curModId = veh.WheelColor;
                        if (curModId == 255) curModId = 0;
                    }
                    else if(ModType == 46)
                    {
                        curModId = veh.WindowTint;
                        if (curModId == 255) curModId = 0;
                    } 
                    else if(ModType == 23)
                    {
                        curModId = veh.WheelVariation;
                        if (curModId == 255) curModId = 0;
                    }
                    else if(ModType == 100)
                    {
                        curModId = veh.PrimaryColor;
                        if (curModId == 255) curModId = 0;
                    }
                    else if (ModType == 200)
                    {
                        curModId = veh.SecondaryColor;
                        if (curModId == 255) curModId = 0;
                    }
                    else if (ModType == 250)
                    {
                        curModId = veh.PearlColor;
                        if (curModId == 255) curModId = 0;
                    }
                    else if(ModType == 280)
                    {
                        curModId = veh.HeadlightColor;
                        if (curModId == 255) curModId = 0;
                    }
                    else
                    {
                        curModId = veh.GetMod((byte)ModType);
                        if (curModId == 255) curModId = 0;
                    }
                    InstallVehicleMod(veh, ModType, curModId);
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
        }

        public static int ReturnMaxVehicleMod(IVehicle veh, int modType)
        {
            int maxMods = 0;
            try
            {
                for(var i = 0; i < ServerAllVehicleMods_.Count; i++)
                {
                    if(ServerAllVehicleMods_[i].vehicleHash == veh.Model)
                    {
                        if(ServerAllVehicleMods_[i].modType == modType)
                        {
                            maxMods++;
                        }
                    }
                }
            }
            catch(Exception e)
            {
                Alt.Log($"{e}");
            }
            return maxMods;
        }

        public static bool AddVehicleMods(uint hash, string modName, int modType, int ModID)
        {
            try
            {
                var mod = ServerAllVehicleMods_.FirstOrDefault(x => x.modName == modName && x.modType == modType && x.modId == ModID && x.vehicleHash == hash);
                if (mod != null) return false;

                var allMods = new Server_All_Vehicle_Mods
                {
                    vehicleHash = hash,
                    modName = modName,
                    modType = modType,
                    modId = ModID
                };

                ServerAllVehicleMods_.Add(allMods);

                using (gtaContext db = new gtaContext())
                {
                    db.Server_All_Vehicle_Mods.Add(allMods);
                    return db.SaveChanges() != 0;
                }
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return false;
        }

        public static string GetVehicleModName(uint vehHash, int modType, int modId)
        {
            try
            {
                var mod = ServerAllVehicleMods_.FirstOrDefault(x => x.vehicleHash == vehHash && x.modType == modType && x.modId == modId);
                if (mod != null) return mod.modName;
            }
            catch (Exception e)
            {
                Alt.Log($"{e}");
            }
            return "";
        }
    }
}