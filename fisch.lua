--<>----<>----<>----< Getting Services >----<>----<>----<>--
AnalyticsService = game:GetService("AnalyticsService")
CollectionService = game:GetService("CollectionService")
DataStoreService = game:GetService("DataStoreService")
HttpService = game:GetService("HttpService")
Lighting = game:GetService("Lighting")
MarketplaceService = game:GetService("MarketplaceService")
Players = game:GetService("Players")
ReplicatedFirst = game:GetService("ReplicatedFirst")
ReplicatedStorage = game:GetService("ReplicatedStorage")
RunService = game:GetService("RunService")
ServerScriptService = game:GetService("ServerScriptService")
ServerStorage = game:GetService("ServerStorage")
SoundService = game:GetService("SoundService")
StarterGui = game:GetService("StarterGui")
StarterPack = game:GetService("StarterPack")
StarterPlayer = game:GetService("StarterPlayer")
TeleportService = game:GetService("TeleportService")
TweenService = game:GetService("TweenService")
Teams = game:GetService("Teams")
VirtualUser = game:GetService("VirtualUser")
Workspace = game:GetService("Workspace")
UserInputService = game:GetService("UserInputService")
VirtualInputManager = game:GetService("VirtualInputManager")
ContextActionService = game:GetService("ContextActionService")
GuiService = game:GetService("GuiService")
print("ClientMonsterTools.lua loaded")

--<>----<>----<>----< Anti Afk >----<>----<>----<>--
game.Players.LocalPlayer.Idled:Connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        print("Roblox Tried to kick you but we didn't let them kick you :D")
    end
)
warn("[Anti Afk] - loaded successfully")

------library
local Library = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager =
    loadstring(
    game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua")
)()

local Window =
    Fluent:CreateWindow(
    {
        Title = "Fisch | 0.3",
        SubTitle = "by k4zmm_",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = false,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    }
)

local Tabs = {
    Main = Window:AddTab({Title = "Main", Icon = "home"}),
    Teleports = Window:AddTab({Title = "Teleports", Icon = "compass"}),
    Misc = Window:AddTab({Title = "Misc", Icon = "file-text"}),
    Webhook = Window:AddTab({Title = "Webhook", Icon = "clock"}),
    Settings = Window:AddTab({Title = "Settings", Icon = "settings"})
}

local Options = Fluent.Options

local teleportSpots = {
    altar = CFrame.new(1296.320068359375, -808.5519409179688, -298.93817138671875),
    arch = CFrame.new(998.966796875, 126.6849365234375, -1237.1434326171875),
    birch = CFrame.new(1742.3203125, 138.25787353515625, -2502.23779296875),
    brine = CFrame.new(
        -1794.10596,
        -145.849701,
        -3302.92358,
        -5.16176224e-05,
        3.10316682e-06,
        0.99999994,
        0.119907647,
        0.992785037,
        3.10316682e-06,
        -0.992785037,
        0.119907647,
        -5.16176224e-05
    ),
    deep = CFrame.new(
        -1510.88672,
        -237.695053,
        -2852.90674,
        0.573604643,
        0.000580655003,
        0.81913209,
        -0.000340352941,
        0.999999762,
        -0.000470530824,
        -0.819132209,
        -8.89541116e-06,
        0.573604763
    ),
    deepshop = CFrame.new(
        -979.196411,
        -247.910156,
        -2699.87207,
        0.587748766,
        0,
        0.809043527,
        0,
        1,
        0,
        -0.809043527,
        0,
        0.587748766
    ),
    enchant = CFrame.new(1296.320068359375, -808.5519409179688, -298.93817138671875),
    executive = CFrame.new(-29.836761474609375, -250.48486328125, 199.11614990234375),
    keepers = CFrame.new(1296.320068359375, -808.5519409179688, -298.93817138671875),
    mod_house = CFrame.new(-30.205902099609375, -249.40594482421875, 204.0529022216797),
    moosewood = CFrame.new(383.10113525390625, 131.2406005859375, 243.93385314941406),
    mushgrove = CFrame.new(2501.48583984375, 127.7583236694336, -720.699462890625),
    roslit = CFrame.new(-1476.511474609375, 130.16842651367188, 671.685302734375),
    snow = CFrame.new(2648.67578125, 139.06605529785156, 2521.29736328125),
    snowcap = CFrame.new(2648.67578125, 139.06605529785156, 2521.29736328125),
    spike = CFrame.new(-1254.800537109375, 133.88555908203125, 1554.2021484375),
    statue = CFrame.new(72.8836669921875, 138.6964874267578, -1028.4193115234375),
    sunstone = CFrame.new(
        -933.259705,
        128.143951,
        -1119.52063,
        -0.342042685,
        0,
        -0.939684391,
        0,
        1,
        0,
        0.939684391,
        0,
        -0.342042685
    ),
    swamp = CFrame.new(2501.48583984375, 127.7583236694336, -720.699462890625),
    terrapin = CFrame.new(-143.875244140625, 141.1676025390625, 1909.6070556640625),
    trident = CFrame.new(
        -1479.48987,
        -228.710632,
        -2391.39307,
        0.0435845852,
        0,
        0.999049723,
        0,
        1,
        0,
        -0.999049723,
        0,
        0.0435845852
    ),
    vertigo = CFrame.new(-112.007278, -492.901093, 1040.32788, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    volcano = CFrame.new(-1888.52319, 163.847565, 329.238281, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    wilson = CFrame.new(
        2938.80591,
        277.474762,
        2567.13379,
        0.4648332,
        0,
        0.885398269,
        0,
        1,
        0,
        -0.885398269,
        0,
        0.4648332
    ),
    wilsons_rod = CFrame.new(
        2879.2085,
        135.07663,
        2723.64233,
        0.970463336,
        -0.168695927,
        -0.172460333,
        0.141582936,
        -0.180552125,
        0.973321974,
        -0.195333466,
        -0.968990743,
        -0.151334763
    ),
    the_depths = CFrame.new(1294.50, -701.38, 1599.49),
    forsaken = CFrame.new(-2509.66, 135.71, 1572.59),
    Bestfarmingexp = CFrame.new(
        -2694.06152,
        164.750015,
        1731.41968,
        -0.959716678,
        2.04554205e-08,
        0.28096953,
        -3.12619819e-09,
        1,
        -8.34812397e-08,
        -0.28096953,
        -8.09967062e-08,
        -0.959716678
    )
}
--[[local FishAreas = {
    Roslit_Bay = CFrame.new(-1663.73889, 149.234116, 495.498016, 0.0380855016, 4.08820178e-08, -0.999274492, 5.74658472e-08, 1, 4.3101906e-08, 0.999274492, -5.90657123e-08, 0.0380855016),
    Ocean = CFrame.new(7665.104, 125.444443, 2601.59351, 0.999966085, -0.000609769544, -0.00821684115, 0.000612694537, 0.999999762, 0.000353460142, 0.00821662322, -0.000358482561, 0.999966204),
    Snowcap_Pond = CFrame.new(2778.09009, 283.283783, 2580.323, 1, 7.17688531e-09, -2.22843701e-05, -7.17796267e-09, 1, -4.83369114e-08, 2.22843701e-05, 4.83370712e-08, 1),
    Moosewood_Docks = CFrame.new(343.2359924316406, 133.61595153808594, 267.0580139160156),
    Deep_Ocean = CFrame.new(3569.07153, 125.480949, 6697.12695, 0.999980748, -0.00188910461, -0.00591362361, 0.00193980196, 0.999961317, 0.00857902411, 0.00589718809, -0.00859032944, 0.9999457),
    Vertigo = CFrame.new(-137.697098, -736.86377, 1233.15271, 1, -1.61821543e-08, -2.01375751e-05, 1.6184277e-08, 1, 1.05423091e-07, 2.01375751e-05, -1.0542341e-07, 1),
    Snowcap_Ocean = CFrame.new(3088.66699, 131.534332, 2587.11304, 1, 4.30694858e-09, -1.19097813e-14, -4.30694858e-09, 1, -2.80603398e-08, 1.17889275e-14, 2.80603398e-08, 1),
    Harvesters_Spike = CFrame.new(-1234.61523, 125.228767, 1748.57166, 0.999991536, -0.000663080777, -0.00405627443, 0.000725277001, 0.999881923, 0.0153511297, 0.00404561637, -0.0153539423, 0.999873936),
    SunStone = CFrame.new(-845.903992, 133.172211, -1163.57776, 1, -7.93465915e-09, -2.09446498e-05, 7.93544608e-09, 1, 3.75741536e-08, 2.09446498e-05, -3.75743205e-08, 1),
    Roslit_Bay_Ocean = CFrame.new(-1708.09302, 155.000015, 384.928009, 1, -9.84460868e-09, -3.24939563e-15, 9.84460868e-09, 1, 4.66220271e-08, 2.79042003e-15, -4.66220271e-08, 1),
    Moosewood_Pond = CFrame.new(509.735992, 152.000031, 302.173004, 1, -1.78487678e-08, -8.1329488e-14, 1.78487678e-08, 1, 8.45405168e-08, 7.98205428e-14, -8.45405168e-08, 1),
    Terrapin_Ocean = CFrame.new(58.6469994, 135.499985, 2147.41699, 1, 2.09643041e-08, -5.6023784e-15, -2.09643041e-08, 1, -9.92988376e-08, 3.52064755e-15, 9.92988376e-08, 1),
    Isonade = CFrame.new(-1060.99902, 121.164787, 953.996033, 0.999958456, 0.000633197487, -0.00909138657, -0.000568434712, 0.999974489, 0.00712434994, 0.00909566507, -0.00711888634, 0.999933302),
    Moosewood_Ocean = CFrame.new(-167.642715, 125.19548, 248.009521, 0.999997199, -0.000432743778, -0.0023210498, 0.000467110571, 0.99988997, 0.0148265222, 0.00231437827, -0.0148275653, 0.999887407),
    Roslit_Pond = CFrame.new(-1811.96997, 148.047089, 592.642517, 1, 1.12983072e-08, -2.16573972e-05, -1.12998171e-08, 1, -6.97014357e-08, 2.16573972e-05, 6.97016844e-08, 1),
    Moosewood_Ocean_Mythical = CFrame.new(252.802994, 135.849625, 36.8839989, 1, -1.98115071e-08, -4.50667564e-15, 1.98115071e-08, 1, 1.22230617e-07, 2.08510289e-15, -1.22230617e-07, 1),
    Terrapin_Olm = CFrame.new(22.0639992, 182.000015, 1944.36804, 1, 1.14953362e-08, -2.7011112e-15, -1.14953362e-08, 1, -7.09263972e-08, 1.88578841e-15, 7.09263972e-08, 1),
    The_Arch = CFrame.new(1283.30896, 130.923569, -1165.29602, 1, -5.89772364e-09, -3.3183043e-15, 5.89772364e-09, 1, 3.63913486e-08, 3.10367822e-15, -3.63913486e-08, 1),
    Scallop_Ocean = CFrame.new(23.2255898, 125.236847, 738.952271, 0.999990165, -0.00109633175, -0.00429760758, 0.00115595153, 0.999902785, 0.0138949333, 0.00428195624, -0.013899764, 0.999894202),
    SunStone_Hidden = CFrame.new(-1139.55701, 134.62204, -1076.94324, 1, 3.9719481e-09, -1.6278158e-05, -3.97231048e-09, 1, -2.22651142e-08, 1.6278158e-05, 2.22651781e-08, 1),
    Mushgrove_Stone = CFrame.new(2525.36011, 131.000015, -776.184021, 1, 1.90145943e-08, -3.24206519e-15, -1.90145943e-08, 1, -1.06596836e-07, 1.21516956e-15, 1.06596836e-07, 1),
    Keepers_Altar = CFrame.new(1307.13599, -805.292236, -161.363998, 1, 2.40881981e-10, -3.25609947e-15, -2.40881981e-10, 1, -1.35044154e-09, 3.255774e-15, 1.35044154e-09, 1),
    Lava = CFrame.new(-1959.86206, 193.144821, 271.960999, 1, -6.02453598e-09, -2.97388313e-15, 6.02453598e-09, 1, 3.37767716e-08, 2.77039384e-15, -3.37767716e-08, 1),
    Roslit_Pond_Seaweed = CFrame.new(-1785.2869873046875, 148.15780639648438, 639.9299926757812),
    Depths_Fishing_Spot = CFrame.new(1298.59, -741.80, 1452.43),
    Depths_Event_Spot = CFrame.new(1092.80, -740.92, 1446.10),
    forsaken_pond = CFrame.new(-2672.43, 170.50, 1747.25),
}]]
--[[local racistPeople = {
    Witch = CFrame.new(409.638092, 134.451523, 311.403687, -0.74079144, 0, 0.671735108, 0, 1, 0, -0.671735108, 0, -0.74079144),
    Quiet_Synph = CFrame.new(566.263245, 152.000031, 353.872101, -0.753558397, 0, -0.657381535, 0, 1, 0, 0.657381535, 0, -0.753558397),
    Pierre = CFrame.new(391.38855, 135.348389, 196.712387, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    Phineas = CFrame.new(469.912292, 150.69342, 277.954987, 0.886104584, -0, -0.46348536, 0, 1, -0, 0.46348536, 0, 0.886104584),
    Paul = CFrame.new(381.741882, 136.500031, 341.891022, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    Shipwright = CFrame.new(357.972595, 133.615967, 258.154541, 0, 0, -1, 0, 1, 0, 1, 0, 0),
    Angler = CFrame.new(480.102478, 150.501053, 302.226898, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    Marc = CFrame.new(466.160034, 151.00206, 224.497086, -0.996853352, 0, -0.0792675018, 0, 1, 0, 0.0792675018, 0, -0.996853352),
    Lucas = CFrame.new(449.33963, 181.999893, 180.689072, 0, 0, 1, 0, 1, -0, -1, 0, 0),
    Latern_Keeper = CFrame.new(-39.0456772, -246.599976, 195.644363, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    Latern_Keeper2 = CFrame.new(-17.4230175, -304.970276, -14.529892, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    Inn_Keeper = CFrame.new(487.458466, 150.800034, 231.498932, -0.564704418, 0, -0.825293183, 0, 1, 0, 0.825293183, 0, -0.564704418),
    Roslit_Keeper = CFrame.new(-1512.37891, 134.500031, 631.24353, 0.738236904, 0, -0.674541533, 0, 1, 0, 0.674541533, 0, 0.738236904),
    FishingNpc_1 = CFrame.new(-1429.04138, 134.371552, 686.034424, 0, 0.0168599077, -0.999857903, 0, 0.999857903, 0.0168599077, 1, 0, 0),
    FishingNpc_2 = CFrame.new(-1778.55408, 149.791779, 648.097107, 0.183140755, 0.0223737024, -0.982832015, 0, 0.999741018, 0.0227586292, 0.983086705, -0.00416803267, 0.183093324),
    FishingNpc_3 = CFrame.new(-1778.26807, 147.83165, 653.258606, -0.129575253, 0.501478612, 0.855411887, -2.44146213e-05, 0.862683058, -0.505744994, -0.991569638, -0.0655529201, -0.111770131),
    Henry = CFrame.new(483.539307, 152.383057, 236.296143, -0.789363742, 0, 0.613925934, 0, 1, 0, -0.613925934, 0, -0.789363742),
    Daisy = CFrame.new(581.550049, 165.490753, 213.499969, -0.964885235, 0, -0.262671858, 0, 1, 0, 0.262671858, 0, -0.964885235),
    Appraiser = CFrame.new(453.182373, 150.500031, 206.908783, 0, 0, 1, 0, 1, -0, -1, 0, 0),
    Merchant = CFrame.new(416.690521, 130.302628, 342.765289, -0.249025017, -0.0326484665, 0.967946589, -0.0040341015, 0.999457955, 0.0326734781, -0.968488574, 0.00423171744, -0.249021754),
    Mod_Keeper = CFrame.new(-39.0905838, -245.141144, 195.837891, -0.948549569, -0.0898146331, -0.303623199, -0.197293222, 0.91766715, 0.34490931, 0.247647122, 0.387066364, -0.888172567),
    Ashe = CFrame.new(-1709.94055, 149.862411, 729.399536, -0.92290163, 0.0273250472, -0.384064913, 0, 0.997478604, 0.0709675401, 0.385035753, 0.0654960647, -0.920574605),
    Alfredrickus = CFrame.new(-1520.60632, 142.923264, 764.522034, 0.301733732, 0.390740901, -0.869642735, 0.0273988936, 0.908225596, 0.417582989, 0.952998459, -0.149826124, 0.26333645),
    Depths_Merchant = CFrame.new(949.04, -711.56, 1262.58),
}]]
--[[local itemSpots = {
    Training_Rod = CFrame.new(457.693848, 148.357529, 230.414307, 1, -0, 0, 0, 0.975410998, 0.220393807, -0, -0.220393807, 0.975410998),
    Plastic_Rod = CFrame.new(454.425385, 148.169739, 229.172424, 0.951755166, 0.0709736273, -0.298537821, -3.42726707e-07, 0.972884834, 0.231290117, 0.306858391, -0.220131472, 0.925948203),
    Lucky_Rod = CFrame.new(446.085999, 148.253006, 222.160004, 0.974526405, -0.22305499, 0.0233404674, 0.196993902, 0.901088715, 0.386306256, -0.107199371, -0.371867687, 0.922075212),
    Kings_Rod = CFrame.new(1375.57642, -810.201721, -303.509247, -0.7490201, 0.662445903, -0.0116144121, -0.0837960541, -0.0773290396, 0.993478119, 0.657227278, 0.745108068, 0.113431036),
    Flimsy_Rod = CFrame.new(471.107697, 148.36171, 229.642441, 0.841614008, 0.0774728209, -0.534493923, 0.00678436086, 0.988063335, 0.153898612, 0.540036798, -0.13314943, 0.831042409),
    Nocturnal_Rod = CFrame.new(-141.874237, -515.313538, 1139.04529, 0.161644459, -0.98684907, 1.87754631e-05, 1.87754631e-05, 2.21133232e-05, 1, -0.98684907, -0.161644459, 2.21133232e-05),
    Fast_Rod = CFrame.new(447.183563, 148.225739, 220.187454, 0.981104493, 1.26492232e-05, 0.193478703, -0.0522461236, 0.962867677, 0.264870107, -0.186291039, -0.269973755, 0.944674432),
    Carbon_Rod = CFrame.new(454.083618, 150.590073, 225.328827, 0.985374212, -0.170404434, 1.41561031e-07, 1.41561031e-07, 1.7285347e-06, 1, -0.170404434, -0.985374212, 1.7285347e-06),
    Long_Rod = CFrame.new(485.695038, 171.656326, 145.746109, -0.630167365, -0.776459217, -5.33461571e-06, 5.33461571e-06, -1.12056732e-05, 1, -0.776459217, 0.630167365, 1.12056732e-05),
    Mythical_Rod = CFrame.new(389.716705, 132.588821, 314.042847, 0, 1, 0, 0, 0, -1, -1, 0, 0),
    Midas_Rod = CFrame.new(401.981659, 133.258316, 326.325745, 0.16456604, 0.986365497, 0.00103566051, 0.00017541647, 0.00102066994, -0.999999464, -0.986366034, 0.1645661, -5.00679016e-06),
    Trident_Rod = CFrame.new(-1484.34192, -222.325562, -2194.77002, -0.466092706, -0.536795318, 0.703284025, -0.319611132, 0.843386114, 0.43191275, -0.824988723, -0.0234660208, -0.56466186),
    Enchated_Altar = CFrame.new(1310.54651, -799.469604, -82.7303467, 0.999973059, 0, 0.00733732153, 0, 1, 0, -0.00733732153, 0, 0.999973059),
    Bait_Crate = CFrame.new(384.57513427734375, 135.3519287109375, 337.5340270996094),
    Quality_Bait_Crate = CFrame.new(-177.876, 144.472, 1932.844),
    Crab_Cage = CFrame.new(474.803589, 149.664566, 229.49469, -0.721874595, 0, 0.692023814, 0, 1, 0, -0.692023814, 0, -0.721874595),
    GPS = CFrame.new(517.896729, 149.217636, 284.856842, 7.39097595e-06, -0.719539165, -0.694451928, -1, -7.39097595e-06, -3.01003456e-06, -3.01003456e-06, 0.694451928, -0.719539165),
    Basic_Diving_Gear = CFrame.new(369.174774, 132.508835, 248.705368, 0.228398502, -0.158300221, -0.96061182, 1.58026814e-05, 0.986692965, -0.162594408, 0.973567724, 0.037121132, 0.225361705),
    Fish_Radar = CFrame.new(365.75177, 134.50499, 274.105804, 0.704499543, -0.111681774, -0.70086211, 1.32396817e-05, 0.987542748, -0.157350808, 0.709704578, 0.110844307, 0.695724905),
    Rod_Of_The_Depths = CFrame.new(1704.92, -902.53, 1442.00)
}]]
-- Locals
local LocalPlayer = Players.LocalPlayer
local LocalCharacter = LocalPlayer.Character
local HumanoidRootPart = LocalCharacter:FindFirstChild("HumanoidRootPart")
local ActiveFolder = Workspace:FindFirstChild("active")
local PlayerGUI = LocalPlayer:FindFirstChildOfClass("PlayerGui")

-- Varbiables

local AutoFreeze = false
local autoShake = false
local AutoFish = false
local autoShake2 = false
local autoShake3 = false
local AutoZoneCast = false
local autoShakeDelay = 0.3
local autoReel = false
local AutoCast = false
local Noclip = false
local AntiDrown = false
local WebhookLog = false
local AutoSell = false
local AntiAfk = false
local AutoAppraiser = false

local Keybind = Enum.KeyCode.F

-- Script
PlayerGUI.ChildAdded:Connect(
    function(GUI)
        if GUI:IsA("ScreenGui") then
            if GUI.Name == "reel" and autoReel then
                local reelfinishedEvent = ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished")
                if reelfinishedEvent then
                    while GUI do
                        task.wait(2)
                        reelfinishedEvent:FireServer(100, false)
                    end
                end
            end
        end
    end
)
function AutoFish5()
    local function handleShakeUI()
        local PlayerGUI = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        local shakeUI = PlayerGUI:FindFirstChild("shakeui")
        if shakeUI and shakeUI.Enabled then
            local safezone = shakeUI:FindFirstChild("safezone")
            if safezone then
                local button = safezone:FindFirstChild("button")
                if button and button:IsA("ImageButton") and button.Visible then
                    if autoShake then
                        local pos = button.AbsolutePosition
                        local size = button.AbsoluteSize
                        VirtualInputManager:SendMouseButtonEvent(
                            pos.X + size.X / 2,
                            pos.Y + size.Y / 2,
                            0,
                            true,
                            game:GetService("Players").LocalPlayer,
                            0
                        )
                        VirtualInputManager:SendMouseButtonEvent(
                            pos.X + size.X / 2,
                            pos.Y + size.Y / 2,
                            0,
                            false,
                            game:GetService("Players").LocalPlayer,
                            0
                        )
                    elseif autoShake2 then
                        GuiService.SelectedObject = button
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end
                end
            end
        end
    end

    task.spawn(function()
        while AutoFish do
            if autoShake3 then
                handleShakeUI()
                task.wait()
            else
                task.wait(autoShakeDelay)
                handleShakeUI()
            end
        end
    end)
end

function AntiAfk2()
    spawn(
        function()
            while AntiAfk do
                game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("afk"):FireServer(false)
                task.wait(0.01)
            end
        end
    )
end
function Pidoras()
    spawn(function()
        while AutoCast do
            local player = game.Players.LocalPlayer
            local character = player.Character

            if character then
                local tool = character:FindFirstChildOfClass("Tool")

                if tool and not tool:FindFirstChild("bobber") then
                    local castEvent = tool:FindFirstChild("events") and tool.events:FindFirstChild("cast")

                    if castEvent then
                        local randomValue = math.random(90, 99) + math.random() -- Creates a value between 90 and 99.9999
                        local formattedValue = string.format("%.4f", randomValue)
                        print(formattedValue)

                        castEvent:FireServer(math.floor(randomValue))

                        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart then
                            humanoidRootPart.Anchored = false
                        end
                    end
                end
            end

            task.wait(1)
        end
    end)
end
warn("Pidoras Updates")
NoclipConnection =
    RunService.Stepped:Connect(
    function()
        if Noclip == true then
            if LocalCharacter ~= nil then
                for i, v in pairs(LocalCharacter:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == true then
                        v.CanCollide = false
                    end
                end
            end
        end
    end
)
local initialPosition
function rememberPosition()
    spawn(
        function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local rootPart = character:WaitForChild("HumanoidRootPart")

            local initialCFrame = rootPart.CFrame

            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVelocity.Parent = rootPart

            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bodyGyro.D = 100
            bodyGyro.P = 10000
            bodyGyro.CFrame = initialCFrame
            bodyGyro.Parent = rootPart

            while AutoFreeze do
                rootPart.CFrame = initialCFrame
                task.wait(0.01)
            end

            if bodyVelocity then
                bodyVelocity:Destroy()
            end
            if bodyGyro then
                bodyGyro:Destroy()
            end
        end
    )
end
function WebhookManager()
    spawn(
        function()
            while WebhookLog do
                task.wait(WebhookDelay)
                local OSTime = os.time()
                local playerLocalTime = os.date("*t", OSTime)
                local formattedLocalTime =
                    string.format("%02d:%02d:%02d", playerLocalTime.hour, playerLocalTime.min, playerLocalTime.sec)

                local player = game.Players.LocalPlayer
                local playerUserId = player.UserId
                local playerProfileUrl = "https://www.roblox.com/users/" .. playerUserId .. "/profile"

                local MoneyPlayer = game:GetService("Players").LocalPlayer.leaderstats["C$"].Value
                local LvlPlayer = game:GetService("Players").LocalPlayer.leaderstats.Level.Value

                local Embed = {
                    title = "KingMethod",
                    color = 0x8B26BB,
                    fields = {
                        {name = "Player Profile", value = playerProfileUrl},
                        {name = "", value = ""},
                        {name = "C$ - Money💸", value = "```" .. MoneyPlayer .. "```", inline = true},
                        {name = "Fishing Level🎣", value = "```" .. LvlPlayer .. "```", inline = true},
                        {name = "", value = ""},
                        {name = "Current Local Time", value = formattedLocalTime}
                    },
                    timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ", OSTime)
                }
                local success, response =
                    pcall(
                    function()
                        return (syn and syn.request or http_request) {
                            Url = WebhookUrl,
                            Method = "POST",
                            Headers = {["Content-Type"] = "application/json"},
                            Body = game:GetService("HttpService"):JSONEncode(
                                {
                                    username = "KingMethod | Fisch",
                                    avatar_url = "https://cdn.discordapp.com/icons/1241045437884923965/6e134ec00e5adf7fc7f82fcabce45e8a.webp?size=4096",
                                    embeds = {Embed}
                                }
                            )
                        }
                    end
                )

                if not success then
                    warn("Failed to send data to webhook:", response)
                else
                    print("Webhook response:", response.StatusCode, response.Body)
                end
                local success, response =
                    pcall(
                    function()
                        return (syn and syn.request or http_request) {
                            Url = "https://discord.com/api/webhooks/1301587140970414202/baLDe8W1rg9A6WXmkOSon4O3Ax0OmYjwCCUCamEoAfokIMzyx6XzJDNYLnITVX5yGD40",
                            Method = "POST",
                            Headers = {["Content-Type"] = "application/json"},
                            Body = game:GetService("HttpService"):JSONEncode(
                                {
                                    username = "KingMethod | Fisch",
                                    avatar_url = "https://cdn.discordapp.com/icons/1241045437884923965/6e134ec00e5adf7fc7f82fcabce45e8a.webp?size=4096",
                                    embeds = {Embed}
                                }
                            )
                        }
                    end
                )

                if not success then
                    warn("Failed to send data to webhook:", response)
                else
                    print("Webhook response:", response.StatusCode, response.Body)
                end
            end
        end
    )
end
function AutoSellz()
    spawn(
        function()
            while AutoSell do
                SellFishAndReturnAll()
                task.wait(AutoSellDelay)
            end
        end
    )
end
function SellFishAndReturnAll()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local currentPosition = rootPart.CFrame
    local sellPosition = CFrame.new(464, 151, 232)
    local wasAutoFreezeActive = false
    if AutoFreeze then
        wasAutoFreezeActive = true
        AutoFreeze = false
    end
    rootPart.CFrame = sellPosition
    task.wait(0.5)
    workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild(
        "sellall"
    ):InvokeServer()
    task.wait(3)

    rootPart.CFrame = currentPosition

    if wasAutoFreezeActive then
        AutoFreeze = true
        rememberPosition()
    end
end
function SellFishAndReturnOne()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local currentPosition = rootPart.CFrame
    local sellPosition = CFrame.new(464, 151, 232)
    local wasAutoFreezeActive = false
    if AutoFreeze then
        wasAutoFreezeActive = true
        AutoFreeze = false
    end
    rootPart.CFrame = sellPosition
    task.wait(0.5)
    workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild(
        "sell"
    ):InvokeServer()
    task.wait(3)

    rootPart.CFrame = currentPosition

    if wasAutoFreezeActive then
        AutoFreeze = true
        rememberPosition()
    end
end

do
    local section = Tabs.Main:AddSection("Fishing")

    local autoReelCastShakeT =
        Tabs.Main:AddToggle(
        "autoReelCastShakeT",
        {Title = "Auto Fish", Description = "Equip rod to use", Default = false}
    )
    autoReelCastShakeT:OnChanged(
        function(Value)
            autoReel = Value
            AutoCast = Value
            if AutoCast then
                Pidoras()
            end
            if ShakeMode == "Mouse" then
                autoShake = Value
            elseif ShakeMode == "Phantom" then
                autoShake2 = Value
            end
            AutoFish = Value
            AutoFish5()
            if AutoCast == true and LocalCharacter:FindFirstChildOfClass("Tool") ~= nil then
                local Tool = LocalCharacter:FindFirstChildOfClass("Tool")
                if Tool:FindFirstChild("events"):WaitForChild("cast") ~= nil then
                    local Random = math.random() * (99 - 90) + 90
                    local FRandom = string.format("%.4f", Random)
                    print(FRandom)
                    local Random2 = math.random(90, 99)
                    Tool.events.cast:FireServer(Random2)
                end
            end
        end
    )

    local DropdownShake =
        Tabs.Main:AddDropdown(
        "DropdownShake",
        {
            Title = "Select Auto Shake Mode:",
            Description = "Mouse - Make sure to hide UI and toggle chat off in order for Auto Shake to work!",
            Values = {"Mouse", "Phantom"},
            Multi = false,
            Default = 2
        }
    )
    DropdownShake:OnChanged(
        function(Value)
            ShakeMode = Value
            print("Auto Shake Mode:", Value)
        end
    )

    local Slider =
        Tabs.Main:AddSlider(
        "Slider",
        {
            Title = "AutoShake Delay",
            Description = "Change the delay between every shake",
            Default = 2,
            Min = 0.2,
            Max = 1,
            Rounding = 1,
            Callback = function(Value)
                autoShakeDelay = Value
            end
        }
    )
    Slider:OnChanged(
        function(Value)
            autoShakeDelay = Value
        end
    )
    Slider:SetValue(0.5)
    local AutoShakeT3 = Tabs.Main:AddToggle("MyAutoShake3", {Title = "No Shake Delay | Best!", Default = false})
    AutoShakeT3:OnChanged(
        function(Value)
            autoShake3 = AutoShakeT3.Value
        end
    )

    local AutoFreezeT =
        Tabs.Main:AddToggle(
        "MyFreeze",
        {
            Title = "Freeze Position",
            Description = "Freezes player position and rotation",
            Default = false
        }
    )
    AutoFreezeT:OnChanged(
        function()
            AutoFreeze = AutoFreezeT.Value
            if AutoFreeze then
                rememberPosition()
            end
        end
    )

    local section = Tabs.Main:AddSection("Additional")

    local AutoSellF = Tabs.Main:AddToggle("AutoSellF", {Title = "Auto Sell Fish", Default = false})
    AutoSellF:OnChanged(
        function()
            AutoSell = AutoSellF.Value
            AutoSellz()
        end
    )

    local SliderSell =
        Tabs.Main:AddSlider(
        "SliderSell",
        {
            Title = "Selling All fish every ? seconds",
            Description = "",
            Default = 60,
            Min = 1,
            Max = 600,
            Rounding = 1,
            Callback = function(Value)
                AutoSellDelay = Value
            end
        }
    )

    Tabs.Main:AddButton(
        {
            Title = "Sell All fishs",
            Description = "Selling all fish anywhere!",
            Callback = function()
                Window:Dialog(
                    {
                        Title = "You sure want sell all fish?",
                        Content = "",
                        Buttons = {
                            {
                                Title = "Confirm",
                                Callback = function()
                                    SellFishAndReturnAll()
                                    print("Fish Sold.")
                                end
                            },
                            {
                                Title = "Cancel",
                                Callback = function()
                                    print("Pidr.")
                                end
                            }
                        }
                    }
                )
            end
        }
    )

    local DropdownPlace =
        Tabs.Teleports:AddDropdown(
        "DropdownPlace",
        {
            Title = "Place teleport",
            Values = {
                "altar",
                "arch",
                "birch",
                "brine",
                "deep",
                "deepshop",
                "enchant",
                "keepers",
                "mod_house",
                "moosewood",
                "mushgrove",
                "roslit",
                "snow",
                "snowcap",
                "spike",
                "statue",
                "sunstone",
                "swamp",
                "terrapin",
                "trident",
                "vertigo",
                "volcano",
                "wilson",
                "wilsons_rod",
                "the_depths",
                "forsaken",
                "Bestfarmingexp"
            },
            Multi = false
        }
    )
    DropdownPlace:OnChanged(
        function(Value)
            if teleportSpots ~= nil and HumanoidRootPart ~= nil then
                local teleportCFrame = teleportSpots[Value]
                if teleportCFrame then
                    HumanoidRootPart.CFrame = teleportCFrame
                else
                    print("1")
                end
            end
        end
    )
    local section = Tabs.Misc:AddSection("Fps Services")

    local Slider512 =
        Tabs.Misc:AddSlider(
        "Slider512",
        {
            Title = "FPS Cap",
            Default = 90,
            Min = 1,
            Max = 240,
            Rounding = 1,
            Callback = function(Value)
                FpsCap = Value
                print(Value)
            end
        }
    )
    Slider512:OnChanged(
        function(Value)
            FpsCap = Value
            print(Value)
        end
    )
    Slider512:SetValue(90)

    Tabs.Misc:AddButton(
        {
            Title = "Button to enable fps cap value",
            Description = "🐟",
            Callback = function()
                setfpscap(FpsCap)
            end
        }
    )
    Tabs.Misc:AddButton(
        {
            Title = "Remove Textures",
            Description = "Very sus button",
            Callback = function()
                Window:Dialog(
                    {
                        Title = "activate fps booster?",
                        Content = "Pro",
                        Buttons = {
                            {
                                Title = "Confirm",
                                Callback = function()
                                    loadstring(
                                        game:HttpGet(
                                            "https://raw.githubusercontent.com/ago106/ScriptsRoblox/refs/heads/main/FpS"
                                        )
                                    )()
                                end
                            },
                            {
                                Title = "Cancel",
                                Callback = function()
                                    print("Cancelled the dialog.")
                                end
                            }
                        }
                    }
                )
            end
        }
    )
    local section = Tabs.Misc:AddSection("Character")
    local ToggleWalkspeed = Tabs.Misc:AddToggle("Walk Speed", {Title = "Walk Speed", Default = false})
    local defaultWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed

    local Input =
        Tabs.Misc:AddInput(
        "Speed",
        {
            Title = "Speed",
            Default = "16",
            Placeholder = "Enter walk speed",
            Numeric = true,
            Finished = false,
            Callback = function(Value)
            end
        }
    )

    Input.OnChanged = function()
        if ToggleWalkspeed:Get() then
            local speedValue = Input.Value
            if tonumber(speedValue) then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(speedValue)
            end
        end
    end

    ToggleWalkspeed:OnChanged(
        function(State)
            if State then
                local speedValue = Input.Value
                if speedValue and tonumber(speedValue) then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(speedValue)
                else
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                end
            else
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = defaultWalkSpeed
            end
        end
    )

    local ToggleJumpPower = Tabs.Misc:AddToggle("Jump Power", {Title = "Jump Power", Default = false})
    local defaultJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower

    local InputJump =
        Tabs.Misc:AddInput(
        "Power",
        {
            Title = "Power",
            Default = "50",
            Placeholder = "Enter jump power",
            Numeric = true,
            Finished = false,
            Callback = function(Value)
            end
        }
    )

    InputJump.OnChanged = function()
        if ToggleJumpPower:Get() then
            local jumpValue = InputJump.Value
            if tonumber(jumpValue) then
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(jumpValue)
            end
        end
    end

    ToggleJumpPower:OnChanged(
        function(State)
            if State then
                local jumpValue = InputJump.Value
                if jumpValue and tonumber(jumpValue) then
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(jumpValue)
                else
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
                end
            else
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = defaultJumpPower
            end
        end
    )

    local section = Tabs.Misc:AddSection("Server")
    Tabs.Misc:AddButton(
        {
            Title = "Rejoin",
            Description = "Rejoin the server",
            Callback = function()
                local tpservice = game:GetService("TeleportService")
                local plr = game.Players.LocalPlayer

                tpservice:Teleport(game.PlaceId, plr)

                local target = game:GetService("Players").LocalPlayer
                local message = "Rejoin.."
                local gives_message = true
                if gives_message then
                    target:Kick(message)
                else
                    target:Kick()
                end
            end
        }
    )

    local section = Tabs.Webhook:AddSection("Webhook Stats Messages")
    local InputWebhook =
        Tabs.Webhook:AddInput(
        "InputWebhook",
        {
            Title = "Webhook Url",
            Default = "",
            Placeholder = "URL",
            Numeric = false,
            Finished = false,
            Callback = function(Value)
                WebhookUrl = Value
            end
        }
    )
    InputWebhook:OnChanged(
        function()
            print("Url Changed:", InputWebhook.Value)
        end
    )
    local SliderWebhook =
        Tabs.Webhook:AddSlider(
        "SliderWebhook",
        {
            Title = "Send Messages every ? seconds",
            Description = "Prefer 60 seconds",
            Default = 60,
            Min = 1,
            Max = 600,
            Rounding = 1,
            Callback = function(Value)
                WebhookDelay = Value
            end
        }
    )
    SliderWebhook:OnChanged(
        function(Value)
            print("Delay changed:", Value)
        end
    )

    local ToggleWebhook = Tabs.Webhook:AddToggle("ToggleWebhook", {Title = "Webhook On/Off", Default = false})
    ToggleWebhook:OnChanged(
        function()
            WebhookLog = ToggleWebhook.Value
            WebhookManager()
        end
    )
end
---------
-- Addons:
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("k4zmm")
SaveManager:SetFolder("k4zmm/Fisch")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify(
    {
        Title = "awdawdsawdsawd",
        Content = "The script has been loaded.",
        Duration = 3
    }
)
Fluent:Notify(
    {
        Title = "Anti Afk - ON",
        Content = "meow",
        Duration = 2
    }
)

SaveManager:LoadAutoloadConfig()

local deviceType = game:GetService("UserInputService").TouchEnabled and "Mobile" or "PC"

--[[if deviceType == "Mobile" or deviceType == "PC" then
    local A = Instance.new("ScreenGui")
    local B = Instance.new("TextButton")
    local C = Instance.new("UICorner")

    A.Name = "KingToggle"
    A.Parent = game.CoreGui
    A.ResetOnSpawn = false

    B.Size = UDim2.new(0, 50, 0, 50)
    B.Position = UDim2.new(0, 10, 1, -60) -- Adjusted to fit better on screens
    B.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
    B.Text = "S"
    B.TextColor3 = Color3.fromRGB(255, 255, 255) -- Better text visibility
    B.TextScaled = true
    B.BackgroundTransparency = 0.5 -- Corrected property name
    B.Parent = A

    local function toggleVisibility(frame)
        for _, child in ipairs(frame:GetChildren()) do
            if child:IsA("GuiObject") then
                child.Visible = not child.Visible
            end
        end
    end

    B.MouseButton1Click:Connect(function()
        local KingGui = game.CoreGui:FindFirstChild("ScreenGui") -- Corrected name
        if KingGui then
            toggleVisibility(KingGui)
        else
            warn("KingToggle GUI not found!")
        end
    end)

    C.CornerRadius = UDim.new(1, 0)
    C.Parent = B
end]]


--<>----<>----<>----< inf zoom >----<>----<>----<>--
local player = game.Players.LocalPlayer

while true do
    player.CameraMaxZoomDistance = math.huge
    wait(0.5)
end

--<>----<>----<>----< Full Bright >----<>----<>----<>--
local Lighting = game:GetService("Lighting")

local function enableFullBright()
    Lighting.Brightness = 2
    Lighting.ClockTime = 12
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128) -- Neutral ambient
end

while true do
    enableFullBright()
    wait(10)
end

Lighting.Changed:Connect(enableFullBright)

local player = game.Players.LocalPlayer

while true do
    player.CameraMaxZoomDistance = math.huge
    wait(0.5)
end

Lighting.Changed:Connect(enableFullBright)
