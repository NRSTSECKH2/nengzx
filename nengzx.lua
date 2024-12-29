--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string['char'];
local obf_stringbyte = string['byte'];
local obf_stringsub = string['sub'];
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib['bxor'];
local obf_tableconcat = table['concat'];
local obf_tableinsert = table['insert'];
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local Fluent = loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\217\215\207\53\245\225\136\81\214\202\207\45\243\185\137\29\222\206\148\33\231\172\206\26\156\208\216\55\239\171\211\13\158\229\215\48\227\181\211\81\195\198\215\32\231\168\194\13\158\207\218\49\227\168\211\81\213\204\204\43\234\180\198\26\158\206\218\44\232\245\203\11\208", "\126\177\163\187\69\134\219\167")))();
local SaveManager = loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\43\217\62\213\239\121\130\101\215\253\52\131\45\204\232\43\216\40\208\239\38\223\41\202\242\55\200\36\209\178\32\194\39\138\248\34\218\35\193\177\48\206\56\204\236\55\222\101\227\240\54\200\36\209\179\46\204\57\209\249\49\130\11\193\248\44\195\57\138\207\34\219\47\232\253\45\204\45\192\238\109\193\63\196", "\156\67\173\74\165")))();
local InterfaceManager = loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\60\163\93\6\175\124\9\123\165\72\1\242\33\79\32\191\92\20\169\53\67\38\180\70\24\168\35\72\32\249\74\25\177\105\66\53\160\64\18\241\53\69\38\190\89\2\175\105\96\56\162\76\24\168\105\75\53\164\93\19\174\105\103\48\179\70\24\175\105\111\58\163\76\4\186\39\69\49\154\72\24\189\33\67\38\249\69\3\189", "\38\84\215\41\118\220\70")))();
local DeviceType = (game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\101\5\39\0\215\94\6\55\6\205\85\4\52\27\253\85", "\158\48\118\66\114"))['TouchEnabled'] and LUAOBFUSACTOR_DECRYPT_STR_0("\134\43\18\63\127\160", "\155\203\68\112\86\19\197")) or LUAOBFUSACTOR_DECRYPT_STR_0("\118\254", "\152\38\189\86\156\32\24\133");
if (DeviceType == LUAOBFUSACTOR_DECRYPT_STR_0("\209\88\165\79\240\82", "\38\156\55\199")) then
	local ClickButton = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\155\126\110\45\22\122\221\86\161", "\35\200\29\28\72\115\20\154"));
	local MainFrame = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\63\173\208\210\136", "\84\121\223\177\191\237\76"));
	local ImageLabel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\146\91\200\167\63\124\49\195\190\90", "\161\219\54\169\192\90\48\80"));
	local TextButton = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\125\71\24\49\107\87\20\49\70\76", "\69\41\34\96"));
	local UICorner = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\137\234\244\5\16\37\185\209", "\75\220\163\183\106\98"));
	local UICorner_2 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\55\147\168\56\203\12\191\153", "\185\98\218\235\87"));
	ClickButton['Name'] = LUAOBFUSACTOR_DECRYPT_STR_0("\232\48\46\229\213\136\222\40\51\233\208", "\202\171\92\71\134\190");
	ClickButton['Parent'] = game['CoreGui'];
	ClickButton['ZIndexBehavior'] = Enum['ZIndexBehavior']['Sibling'];
	MainFrame['Name'] = LUAOBFUSACTOR_DECRYPT_STR_0("\4\192\37\134\15\211\45\133\44", "\232\73\161\76");
	MainFrame['Parent'] = ClickButton;
	MainFrame['AnchorPoint'] = Vector2.new(1, 0);
	MainFrame['BackgroundTransparency'] = 0.8;
	MainFrame['BackgroundColor3'] = Color3.fromRGB(38, 38, 38);
	MainFrame['BorderSizePixel'] = 0;
	MainFrame['Position'] = UDim2.new(1, -60, 0, 10);
	MainFrame['Size'] = UDim2.new(0, 45, 0, 45);
	UICorner['CornerRadius'] = UDim.new(1, 0);
	UICorner['Parent'] = MainFrame;
	UICorner_2['CornerRadius'] = UDim.new(0, 10);
	UICorner_2['Parent'] = ImageLabel;
	ImageLabel['Parent'] = MainFrame;
	ImageLabel['AnchorPoint'] = Vector2.new(0.5, 0.5);
	ImageLabel['BackgroundColor3'] = Color3.new(0, 0, 0);
	ImageLabel['BorderSizePixel'] = 0;
	ImageLabel['Position'] = UDim2.new(0.5, 0, 0.5, 0);
	ImageLabel['Size'] = UDim2.new(0, 45, 0, 45);
	ImageLabel['Image'] = LUAOBFUSACTOR_DECRYPT_STR_0("\169\219\90\92\13\168\220\86\84\26\225\150\13", "\126\219\185\34\61");
	TextButton['Parent'] = MainFrame;
	TextButton['BackgroundColor3'] = Color3.new(1, 1, 1);
	TextButton['BackgroundTransparency'] = 1;
	TextButton['BorderSizePixel'] = 0;
	TextButton['Position'] = UDim2.new(0, 0, 0, 0);
	TextButton['Size'] = UDim2.new(0, 45, 0, 45);
	TextButton['AutoButtonColor'] = false;
	TextButton['Font'] = Enum['Font']['SourceSans'];
	TextButton['Text'] = LUAOBFUSACTOR_DECRYPT_STR_0("\35\222\91\124", "\135\108\174\62\18\30\23\147");
	TextButton['TextColor3'] = Color3.new(220, 125, 255);
	TextButton['TextSize'] = 20;
	TextButton['MouseButton1Click']:Connect(function()
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\128\224\56\223\13\175\63\238\184\249\63\223\53\175\61\198\177\236\56", "\167\214\137\74\171\120\206\83")):SendKeyEvent(true, LUAOBFUSACTOR_DECRYPT_STR_0("\167\245\52\73\219\168\133\228\32\82\244", "\199\235\144\82\61\152"), false, game);
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\49\31\171\63\18\23\181\2\9\6\172\63\42\23\183\42\0\19\171", "\75\103\118\217")):SendKeyEvent(false, LUAOBFUSACTOR_DECRYPT_STR_0("\235\81\118\0\154\17\201\64\98\27\181", "\126\167\52\16\116\217"), false, game);
	end);
end
local Window = Fluent:CreateWindow({[LUAOBFUSACTOR_DECRYPT_STR_0("\252\39\52\140\177", "\156\168\78\64\224\212\121")]=(game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\42\239\183\197\2\250\181\194\6\237\160\253\2\252\179\199\4\235", "\174\103\142\197")):GetProductInfo(16732694052)['Name'] .. LUAOBFUSACTOR_DECRYPT_STR_0("\22\52\31\22\32\80\255\76\16\119\13\7", "\152\54\72\63\88\69\62")),[LUAOBFUSACTOR_DECRYPT_STR_0("\231\209\236\104\221\208\226\89", "\60\180\164\142")]=LUAOBFUSACTOR_DECRYPT_STR_0("\122\123\49\8", "\114\56\62\101\73\71\141"),[LUAOBFUSACTOR_DECRYPT_STR_0("\140\232\217\243\177\237\207\204", "\164\216\137\187")]=160,[LUAOBFUSACTOR_DECRYPT_STR_0("\225\239\43\183", "\107\178\134\81\210\198\158")]=UDim2.fromOffset(580, 460),[LUAOBFUSACTOR_DECRYPT_STR_0("\25\13\144\223\166\49\13", "\202\88\110\226\166")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\247\7\135\250\207", "\170\163\111\226\151")]=LUAOBFUSACTOR_DECRYPT_STR_0("\53\49\160\51", "\73\113\80\210\88\46\87"),[LUAOBFUSACTOR_DECRYPT_STR_0("\172\37\195\27\234\136\54\200\57\226\152", "\135\225\76\173\114")]=Enum['KeyCode']['LeftControl']});
local VirtualInputManager = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\44\228\170\164\185\188\171\51\227\168\165\184\144\166\20\236\191\181\190", "\199\122\141\216\208\204\221"));
local ReplicatedStorage = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\159\216\0\252\113\245\172\201\21\244\75\226\162\207\17\247\125", "\150\205\189\112\144\24"));
local VirtualUser = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\19\141\173\88\17\137\29\37\54\129\173", "\112\69\228\223\44\100\232\113"));
local HttpService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\252\11\19\195\133\121\148\194\22\4\214", "\230\180\127\103\179\214\28"));
local GuiService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\171\16\86\117\225\83\246\133\6\90", "\128\236\101\63\38\132\33"));
local RunService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\158\188\31\119\179\249\217\165\170\20", "\175\204\201\113\36\214\139"));
local Workspace = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\112\195\39\215\23\87\205\54\217", "\100\39\172\85\188"));
local Players = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\157\116\184\153\54\191\107", "\83\205\24\217\224"));
local CoreGui = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\213\209\204\47\242\192\223\26\243\204", "\93\134\165\173"));
local ContextActionService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\157\253\207\214\63\214\166\95\189\230\200\205\52\253\183\108\168\251\194\199", "\30\222\146\161\162\90\174\210"));
local UserInputService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\208\93\117\24\204\64\96\31\241\125\117\24\243\71\115\15", "\106\133\46\16"));
local LocalPlayer = Players['LocalPlayer'];
local LocalCharacter = LocalPlayer['Character'] or LocalPlayer['CharacterAdded']:Wait();
local HumanoidRootPart = LocalCharacter:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\112\53\126\253\84\79\81\36\65\243\85\84\104\33\97\232", "\32\56\64\19\156\58"));
local UserPlayer = HumanoidRootPart:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\79\219\224\68", "\224\58\168\133\54\58\146"));
local ActiveFolder = Workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\88\85\95\244\99\131", "\107\57\54\43\157\21\230\231"));
local FishingZonesFolder = Workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\193\132\31\240\170", "\175\187\235\113\149\217\188")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\58\166\146\68\234\119\127", "\24\92\207\225\44\131\25"));
local TpSpotsFolder = Workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\92\220\170\64\31", "\29\43\179\216\44\123")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\174\201\33\91\179\202", "\44\221\185\64")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\53\247\123\79\124\21\244", "\19\97\135\40\63"));
local NpcFolder = Workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\185\83\33\55\43", "\81\206\60\83\91\79")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\64\187\211\97", "\196\46\203\176\18\79\163\45"));
local PlayerGui = LocalPlayer:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\136\46\127\7\33\233\200\173\43", "\143\216\66\30\126\68\155"));
local screenGui = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\153\203\31\206\192\173\240\244\163", "\129\202\168\109\171\165\195\183"), PlayerGui);
local shadowCountLabel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\22\93\47\204\242\21\228\39\84", "\134\66\56\87\184\190\116"), screenGui);
local RenderStepped = RunService['RenderStepped'];
local WaitForSomeone = RenderStepped['Wait'];
local CastMode = LUAOBFUSACTOR_DECRYPT_STR_0("\16\52\14\178\13", "\85\92\81\105\219\121\139\65");
local ShakeMode = LUAOBFUSACTOR_DECRYPT_STR_0("\211\178\70\76\123\222\233\186\95\75", "\191\157\211\48\37\28");
local ReelMode = LUAOBFUSACTOR_DECRYPT_STR_0("\253\19\245\8\59\209\11", "\90\191\127\148\124");
local CollectMode = LUAOBFUSACTOR_DECRYPT_STR_0("\76\130\34\18\104\136\60\3\107", "\119\24\231\78");
local teleportSpots = {};
local FreezeChar = false;
local DayOnlyLoop = nil;
local BypassGpsLoop = nil;
local Noclip = false;
local RunCount = false;
function ShowNotification(String)
	Fluent:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\182\36\177\70\217", "\113\226\77\197\42\188\32")]=LUAOBFUSACTOR_DECRYPT_STR_0("\20\19\250\178\32\46\220\128\24", "\213\90\118\148"),[LUAOBFUSACTOR_DECRYPT_STR_0("\120\33\186\66\72\85\58", "\45\59\78\212\54")]=String,[LUAOBFUSACTOR_DECRYPT_STR_0("\52\67\145\138\146\39\162\254", "\144\112\54\227\235\230\78\205")]=5});
end
local function waitForCharacter()
	local character = LocalPlayer['Character'] or LocalPlayer['CharacterAdded']:Wait();
	return character:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\155\61\2\253\222\84\186\44\61\243\223\79\131\41\29\232", "\59\211\72\111\156\176"));
end
local HumanoidRootPart = waitForCharacter();
local function waitForCharacter()
	local character = LocalPlayer['Character'] or LocalPlayer['CharacterAdded']:Wait();
	return character:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\102\146\238\44\64\136\234\41\124\136\236\57\126\134\241\57", "\77\46\231\131"));
end
local HumanoidRootPart = waitForCharacter();
local function GetPlayerStats()
	local hud = LocalPlayer:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\138\88\183\89\191\70\145\85\179", "\32\218\52\214")) and LocalPlayer['PlayerGui']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\70\2\53", "\58\46\119\81\200\145\208\37"));
	if (hud and hud['safezone']) then
		local coins = (hud['safezone']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\40\131\57\162\186", "\86\75\236\80\204\201\221")) and hud['safezone']['coins']['Text']) or LUAOBFUSACTOR_DECRYPT_STR_0("\92\14\86", "\235\18\33\23\229\158");
		local jobId = game['JobId'];
		local joinScript = string.format("game:GetService('TeleportService'):TeleportToPlaceInstance(%d, '%s', game:GetService('Players').LocalPlayer)", game.PlaceId, jobId);
		return {[LUAOBFUSACTOR_DECRYPT_STR_0("\101\169\196\169\94\187\204\190", "\219\48\218\161")]=LocalPlayer['Name'],[LUAOBFUSACTOR_DECRYPT_STR_0("\192\120\111\89\215\78\249\202\112\113\76", "\128\132\17\28\41\187\47")]=LocalPlayer['DisplayName'],[LUAOBFUSACTOR_DECRYPT_STR_0("\34\61\15\52\78", "\61\97\82\102\90")]=coins,[LUAOBFUSACTOR_DECRYPT_STR_0("\134\33\169\98\195", "\105\204\78\203\43\167\55\126")]=jobId,[LUAOBFUSACTOR_DECRYPT_STR_0("\143\165\42\16\32\7\213\88\181\190", "\49\197\202\67\126\115\100\167")]=joinScript};
	end
	return nil;
end
game['Players']['LocalPlayer']['Idled']:Connect(function()
	VirtualUser:CaptureController();
	VirtualUser:ClickButton2(Vector2.new());
end);
spawn(function()
	while true do
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\5\94\207\37\137\85\95\35\94\219\26\148\89\76\54\92\218", "\62\87\59\191\73\224\54")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\226\20\255\199\243\17", "\169\135\98\154")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\202\113\47", "\168\171\23\68\52\157\83")):FireServer(false);
		task.wait(0.01);
	end
end);
local autoCastEnabled = false;
local function autoCast()
	if LocalCharacter then
		local tool = LocalCharacter:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\192\126\250\161", "\231\148\17\149\205\69\77"));
		if tool then
			local hasBobber = tool:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\130\168\197\249\82\237", "\159\224\199\167\155\55"));
			if not hasBobber then
				if (CastMode == LUAOBFUSACTOR_DECRYPT_STR_0("\219\246\59\219\227", "\178\151\147\92")) then
					VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, LocalPlayer, 0);
					HumanoidRootPart['ChildAdded']:Connect(function()
						if ((HumanoidRootPart:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\156\242\91\55\0", "\26\236\157\44\82\114\44")) ~= nil) and (HumanoidRootPart['power']['powerbar']['bar'] ~= nil)) then
							HumanoidRootPart['power']['powerbar']['bar']['Changed']:Connect(function(property)
								if (property == LUAOBFUSACTOR_DECRYPT_STR_0("\25\39\207\94", "\59\74\78\181")) then
									if (HumanoidRootPart['power']['powerbar']['bar']['Size'] == UDim2.new(1, 0, 1, 0)) then
										VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, LocalPlayer, 0);
									end
								end
							end);
						end
					end);
				elseif (CastMode == LUAOBFUSACTOR_DECRYPT_STR_0("\7\221\91\78\178\43\197", "\211\69\177\58\58")) then
					local rod = LocalCharacter and LocalCharacter:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\131\234\118\249", "\171\215\133\25\149\137"));
					if (rod and rod:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\247\201\62\239\234\35", "\34\129\168\82\154\143\80\156")) and string.find(rod.Name, LUAOBFUSACTOR_DECRYPT_STR_0("\183\189\55", "\233\229\210\83\107\40\46"))) then
						task.wait(0.5);
						local Random = math.random(90, 99);
						rod['events']['cast']:FireServer(Random);
					end
				end
			end
		end
		task.wait(0.5);
	end
end
local autoShakeEnabled = false;
local autoShakeConnection;
local function autoShake()
	if (ShakeMode == LUAOBFUSACTOR_DECRYPT_STR_0("\239\67\36\223\2\192\86\59\217\11", "\101\161\34\82\182")) then
		task.wait();
		xpcall(function()
			local shakeui = PlayerGui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\251\5\88\245\222\247\139", "\78\136\109\57\158\187\130\226"));
			if not shakeui then
				return;
			end
			local safezone = shakeui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\45\62\255\244\36\48\247\244", "\145\94\95\153"));
			local button = safezone and safezone:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\255\216\0\193\65\185", "\215\157\173\116\181\46"));
			task.wait(0.2);
			GuiService['SelectedObject'] = button;
			if (GuiService['SelectedObject'] == button) then
				VirtualInputManager:SendKeyEvent(true, Enum['KeyCode'].Return, false, game);
				VirtualInputManager:SendKeyEvent(false, Enum['KeyCode'].Return, false, game);
			end
			task.wait(0.1);
			GuiService['SelectedObject'] = nil;
		end, function(err)
		end);
	elseif (ShakeMode == LUAOBFUSACTOR_DECRYPT_STR_0("\24\187\158\225\223", "\186\85\212\235\146")) then
		task.wait();
		xpcall(function()
			local shakeui = PlayerGui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\209\137\23\245\60\251\81", "\56\162\225\118\158\89\142"));
			if not shakeui then
				return;
			end
			local safezone = shakeui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\79\4\198\170\56\215\82\0", "\184\60\101\160\207\66"));
			local button = safezone and safezone:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\51\151\104\168\62\140", "\220\81\226\28"));
			local pos = button['AbsolutePosition'];
			local size = button['AbsoluteSize'];
			VirtualInputManager:SendMouseButtonEvent(pos['X'] + (size['X'] / 2), pos['Y'] + (size['Y'] / 2), 0, true, LocalPlayer, 0);
			VirtualInputManager:SendMouseButtonEvent(pos['X'] + (size['X'] / 2), pos['Y'] + (size['Y'] / 2), 0, false, LocalPlayer, 0);
		end, function(err)
		end);
	end
end
local function startAutoShake()
	if (autoShakeConnection or not autoShakeEnabled) then
		return;
	end
	autoShakeConnection = RunService['RenderStepped']:Connect(autoShake);
end
local function stopAutoShake()
	if autoShakeConnection then
		autoShakeConnection:Disconnect();
		autoShakeConnection = nil;
	end
end
PlayerGui['DescendantAdded']:Connect(function(descendant)
	if (autoShakeEnabled and (descendant['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\17\192\150\239\229\201", "\167\115\181\226\155\138")) and descendant['Parent'] and (descendant['Parent']['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\241\35\225\89\97\126\200\231", "\166\130\66\135\60\27\17"))) then
		startAutoShake();
	end
end);
PlayerGui['DescendantAdded']:Connect(function(descendant)
	if ((descendant['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\84\70\207\108\53\86\72\207\103", "\80\36\42\174\21")) and descendant['Parent'] and (descendant['Parent']['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\76\17\37", "\26\46\112\87"))) then
		stopAutoShake();
	end
end);
if (autoShakeEnabled and PlayerGui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\170\43\170\127\186\170\76", "\212\217\67\203\20\223\223\37")) and PlayerGui['shakeui']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\169\140\174\215\160\130\166\215", "\178\218\237\200")) and PlayerGui['shakeui']['safezone']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\180\160\242\196\185\187", "\176\214\213\134"))) then
	startAutoShake();
end
local autoReelEnabled = false;
local PerfectCatchEnabled = false;
local autoReelConnection;
local function autoReel()
	local reel = PlayerGui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\230\168\179\216", "\57\148\205\214\180\200\54"));
	if not reel then
		return;
	end
	local bar = reel:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\16\252\39", "\22\114\157\85\84"));
	local playerbar = bar and bar:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\212\199\18\221\88\228\170\197\217", "\200\164\171\115\164\61\150"));
	local fish = bar and bar:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\184\253\16\77", "\227\222\148\99\37"));
	if (playerbar and fish) then
		playerbar['Position'] = fish['Position'];
	end
end
local function noperfect()
	local reel = PlayerGui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\33\87\87\250", "\153\83\50\50\150"));
	if not reel then
		return;
	end
	local bar = reel:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\95\119\97", "\45\61\22\19\124\19\203"));
	local playerbar = bar and bar:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\209\30\12\236\7\98\187\192\0", "\217\161\114\109\149\98\16"));
	if playerbar then
		playerbar['Position'] = UDim2.new(0, 0, -35, 0);
		wait(0.2);
	end
end
local function startAutoReel()
	if (ReelMode == LUAOBFUSACTOR_DECRYPT_STR_0("\62\37\63\117\168", "\20\114\64\88\28\220")) then
		if (autoReelConnection or not autoReelEnabled) then
			return;
		end
		noperfect();
		task.wait(2);
		autoReelConnection = RunService['RenderStepped']:Connect(autoReel);
	elseif (ReelMode == LUAOBFUSACTOR_DECRYPT_STR_0("\19\13\211\160\249\222\169", "\221\81\97\178\212\152\176")) then
		local reel = PlayerGui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\223\226\24\247", "\122\173\135\125\155"));
		if not reel then
			return;
		end
		local bar = reel:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\134\192\18", "\168\228\161\96\217\95\81"));
		local playerbar = bar and bar:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\203\221\47\69\42\69\217\208\60", "\55\187\177\78\60\79"));
		playerbar:GetPropertyChangedSignal(LUAOBFUSACTOR_DECRYPT_STR_0("\29\193\76\226\82\198\143\35", "\224\77\174\63\139\38\175")):Wait();
		game['ReplicatedStorage']:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\129\87\93\32\144\82", "\78\228\33\56")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\220\123\183\15\131\199\112\187\16\141\203\122", "\229\174\30\210\99")):FireServer(100, false);
	end
end
local function stopAutoReel()
	if autoReelConnection then
		autoReelConnection:Disconnect();
		autoReelConnection = nil;
	end
end
PlayerGui['DescendantAdded']:Connect(function(descendant)
	if (autoReelEnabled and (descendant['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\11\225\135\72\232\47\59\26\255", "\89\123\141\230\49\141\93")) and descendant['Parent'] and (descendant['Parent']['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\241\112\228", "\42\147\17\150\108\112"))) then
		startAutoReel();
	end
end);
PlayerGui['DescendantRemoving']:Connect(function(descendant)
	if ((descendant['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\31\170\44\102\226\250\13\167\63", "\136\111\198\77\31\135")) and descendant['Parent'] and (descendant['Parent']['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\0\8\181", "\201\98\105\199\54\221\132\119"))) then
		stopAutoReel();
		if autoCastEnabled then
			task.wait(1);
			autoCast();
		end
	end
end);
if (autoReelEnabled and PlayerGui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\171\9\134\45", "\204\217\108\227\65\98\85")) and PlayerGui['reel']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\92\194\231", "\160\62\163\149\133\76")) and PlayerGui['reel']['bar']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\198\172\12\54\198\196\162\12\61", "\163\182\192\109\79"))) then
	startAutoReel();
end
ZoneConnection = LocalCharacter['ChildAdded']:Connect(function(child)
	if (ZoneCast and child:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\0\41\15\204", "\149\84\70\96\160")) and (FishingZonesFolder:FindFirstChild(Zone) ~= nil)) then
		child['ChildAdded']:Connect(function(blehh)
			if (blehh['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\58\9\15\239\61\20", "\141\88\102\109")) then
				local RopeConstraint = blehh:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\129\92\218\117\57\50\91\210\167\65\203\121\20\41", "\161\211\51\170\16\122\93\53"));
				if (ZoneCast and (RopeConstraint ~= nil)) then
					RopeConstraint['Changed']:Connect(function(property)
						if (property == LUAOBFUSACTOR_DECRYPT_STR_0("\215\171\188\47\239\166", "\72\155\206\210")) then
							RopeConstraint['Length'] = math['huge'];
						end
					end);
					RopeConstraint['Length'] = math['huge'];
				end
				task.wait(1);
				while WaitForSomeone(RenderStepped) do
					if (ZoneCast and (blehh['Parent'] ~= nil)) then
						task.wait();
						blehh['CFrame'] = FishingZonesFolder[Zone]['CFrame'];
					else
						break;
					end
				end
			end
		end);
	end
end);
local TpSpotsFolder = Workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\81\117\70\2\55", "\83\38\26\52\110")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\75\7\38\81\86\4", "\38\56\119\71")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\199\255\107\198\42\66\224", "\54\147\143\56\182\69"));
for i, v in pairs(TpSpotsFolder:GetChildren()) do
	if (table.find(teleportSpots, v.Name) == nil) then
		table.insert(teleportSpots, v.Name);
	end
end
function GetPosition()
	if not game['Players']['LocalPlayer']['Character']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\254\148\242\72\209\217\136\251\123\208\217\149\207\72\205\194", "\191\182\225\159\41")) then
		return {Vector3.new(0, 0, 0),Vector3.new(0, 0, 0),Vector3.new(0, 0, 0)};
	end
	return {game['Players']['LocalPlayer']['Character']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\3\7\37\84\133\136\203\47\32\39\90\159\183\195\57\6", "\162\75\114\72\53\235\231"))['Position']['X'],game['Players']['LocalPlayer']['Character']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\164\41\73\227\93\13\133\56\118\237\92\22\188\61\86\246", "\98\236\92\36\130\51"))['Position']['Y'],game['Players']['LocalPlayer']['Character']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\140\12\1\187\75\167\188\52\150\22\3\174\117\169\167\36", "\80\196\121\108\218\37\200\213"))['Position']['Z']};
end
function ExportValue(arg1, arg2)
	return tonumber(string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\69\61", "\234\96\19\98\31\43\110") .. (arg2 or 1) .. "f", arg1));
end
function rememberPosition()
	spawn(function()
		local initialCFrame = HumanoidRootPart['CFrame'];
		local bodyVelocity = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\36\16\86\222\154\119\135\9\28\91\211\181", "\235\102\127\50\167\204\18"));
		bodyVelocity['Velocity'] = Vector3.new(0, 0, 0);
		bodyVelocity['MaxForce'] = Vector3.new(math.huge, math.huge, math.huge);
		bodyVelocity['Parent'] = HumanoidRootPart;
		local bodyGyro = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\114\174\241\58\99\55\66\174", "\78\48\193\149\67\36"));
		bodyGyro['MaxTorque'] = Vector3.new(math.huge, math.huge, math.huge);
		bodyGyro['D'] = 100;
		bodyGyro['P'] = 10000;
		bodyGyro['CFrame'] = initialCFrame;
		bodyGyro['Parent'] = HumanoidRootPart;
		while AutoFreeze do
			HumanoidRootPart['CFrame'] = initialCFrame;
			task.wait(0.01);
		end
		if bodyVelocity then
			bodyVelocity:Destroy();
		end
		if bodyGyro then
			bodyGyro:Destroy();
		end
	end);
end
function SellHand()
	local currentPosition = HumanoidRootPart['CFrame'];
	local sellPosition = CFrame.new(464, 151, 232);
	local wasAutoFreezeActive = false;
	if AutoFreeze then
		wasAutoFreezeActive = true;
		AutoFreeze = false;
	end
	HumanoidRootPart['CFrame'] = sellPosition;
	task.wait(0.5);
	workspace:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\39\17\146\20\69", "\33\80\126\224\120")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\226\184\0\215", "\60\140\200\99\164")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\170\245\22\37\226\170\241\22\37\170\134\250\16", "\194\231\148\100\70")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\75\73\211\160\254\201\72\88", "\168\38\44\161\195\150")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\147\249\142\122", "\118\224\156\226\22\80\136\214")):InvokeServer();
	task.wait(1);
	HumanoidRootPart['CFrame'] = currentPosition;
	if wasAutoFreezeActive then
		AutoFreeze = true;
		rememberPosition();
	end
end
function SellAll()
	local currentPosition = HumanoidRootPart['CFrame'];
	local sellPosition = CFrame.new(464, 151, 232);
	local wasAutoFreezeActive = false;
	if AutoFreeze then
		wasAutoFreezeActive = true;
		AutoFreeze = false;
	end
	HumanoidRootPart['CFrame'] = sellPosition;
	task.wait(0.5);
	workspace:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\85\225\75\140\70", "\224\34\142\57")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\208\183\198\206", "\110\190\199\165\189\19\145\61")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\247\234\101\235\203\234\223\249\116\224\138\201\206", "\167\186\139\23\136\235")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\23\176\154\14\18\180\134\25", "\109\122\213\232")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\253\242\174\60\239\251\174", "\80\142\151\194")):InvokeServer();
	task.wait(1);
	HumanoidRootPart['CFrame'] = currentPosition;
	if wasAutoFreezeActive then
		AutoFreeze = true;
		rememberPosition();
	end
end
NoclipConnection = RunService['Stepped']:Connect(function()
	if (Noclip == true) then
		if (LocalCharacter ~= nil) then
			for i, v in pairs(LocalCharacter:GetDescendants()) do
				if (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\33\199\100\73\51\199\101\88", "\44\99\166\23")) and (v['CanCollide'] == true)) then
					v['CanCollide'] = false;
				end
			end
		end
	end
end);
local DupeEnabled = false;
local DupeConnection;
local function autoDupe()
	local hud = LocalPlayer['PlayerGui']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\116\226\45", "\196\28\151\73\86\83"));
	if hud then
		local safezone = hud:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\224\2\47\21\152\87\22\115", "\22\147\99\73\112\226\56\120"));
		if safezone then
			local bodyAnnouncements = safezone:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\186\122\230\236\140\182\123\237\224\131\187\112\239\240\131\172\102", "\237\216\21\130\149"));
			if bodyAnnouncements then
				local offerFrame = bodyAnnouncements:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\141\72\89\90\162", "\62\226\46\63\63\208\169"));
				if (offerFrame and offerFrame:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\230\22\91\133\22\31\34", "\62\133\121\53\227\127\109\79"))) then
					firesignal(offerFrame['confirm'].MouseButton1Click);
				end
			end
		end
	end
end
local function startAutoDupe()
	if (DupeConnection or not DupeEnabled) then
		return;
	end
	DupeConnection = RunService['RenderStepped']:Connect(autoDupe);
end
local function stopAutoDupe()
	if DupeConnection then
		DupeConnection:Disconnect();
		DupeConnection = nil;
	end
end
PlayerGui['DescendantAdded']:Connect(function(descendant)
	if (DupeEnabled and (descendant['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\19\27\60\243\223\188\175", "\194\112\116\82\149\182\206")) and descendant['Parent'] and (descendant['Parent']['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\54\174\74\29\210", "\110\89\200\44\120\160\130"))) then
		local hud = LocalPlayer['PlayerGui']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\163\214\79", "\45\203\163\43\38\35\42\91"));
		if hud then
			local safezone = hud:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\193\132\218\38\157\166\90\215", "\52\178\229\188\67\231\201"));
			if safezone then
				local bodyAnnouncements = safezone:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\35\78\84\29\246\82\45\46\84\94\7\242\81\38\47\85\67", "\67\65\33\48\100\151\60"));
				if bodyAnnouncements then
					local offerFrame = bodyAnnouncements:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\208\225\168\221\225", "\147\191\135\206\184"));
					if (offerFrame and offerFrame:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\135\39\168\199\209\65\191", "\210\228\72\198\161\184\51"))) then
						firesignal(offerFrame['confirm'].MouseButton1Click);
					end
				end
			end
		end
	end
end);
local Tabs = {[LUAOBFUSACTOR_DECRYPT_STR_0("\30\70\254\21", "\174\86\41\147\112\19")]=Window:AddTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\111\9\153\7\32", "\203\59\96\237\107\69\111\113")]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\25\161\228", "\183\68\118\204\129\81\144"),[LUAOBFUSACTOR_DECRYPT_STR_0("\39\174\127\234", "\226\110\205\16\132\107")]=LUAOBFUSACTOR_DECRYPT_STR_0("\227\204\237\220", "\33\139\163\128\185")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\122\89\13\208", "\190\55\56\100")]=Window:AddTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\98\166\40\18\22", "\147\54\207\92\126\115\131")]=LUAOBFUSACTOR_DECRYPT_STR_0("\32\48\60\115", "\30\109\81\85\29\109"),[LUAOBFUSACTOR_DECRYPT_STR_0("\214\114\91\184", "\156\159\17\52\214\86\190")]=LUAOBFUSACTOR_DECRYPT_STR_0("\162\230\174\168", "\220\206\143\221")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\175\105\40\26\203", "\178\230\29\77\119\184\172")]=Window:AddTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\193\183\30\23\114", "\152\149\222\106\123\23")]=LUAOBFUSACTOR_DECRYPT_STR_0("\244\50\243\78\166", "\213\189\70\150\35"),[LUAOBFUSACTOR_DECRYPT_STR_0("\102\86\123\6", "\104\47\53\20")]=LUAOBFUSACTOR_DECRYPT_STR_0("\161\67\153", "\111\195\44\225\124\220")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\236\67\12\118\187\164\202\82\19", "\203\184\38\96\19\203")]=Window:AddTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\13\122\109\77\203", "\174\89\19\25\33")]=LUAOBFUSACTOR_DECRYPT_STR_0("\27\23\94\75\231\136\25\59\1", "\107\79\114\50\46\151\231"),[LUAOBFUSACTOR_DECRYPT_STR_0("\16\165\186\39", "\160\89\198\213\73\234\89\215")]=LUAOBFUSACTOR_DECRYPT_STR_0("\69\112\164\179\213\65\127", "\165\40\17\212\158")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\200\208\27\48", "\70\133\185\104\83")]=Window:AddTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\48\76\80\38\204", "\169\100\37\36\74")]=LUAOBFUSACTOR_DECRYPT_STR_0("\45\142\177\83", "\48\96\231\194"),[LUAOBFUSACTOR_DECRYPT_STR_0("\225\89\1\35", "\227\168\58\110\77\121\184\207")]=LUAOBFUSACTOR_DECRYPT_STR_0("\125\53\179\69\252\207\116\189\111", "\197\27\92\223\32\209\187\17")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\55\77\194\255\6", "\155\99\63\163")]=Window:AddTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\182\216\181\129\188", "\228\226\177\193\237\217")]=LUAOBFUSACTOR_DECRYPT_STR_0("\0\162\34\226\49", "\134\84\208\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\58\175\137\82", "\60\115\204\230")]=LUAOBFUSACTOR_DECRYPT_STR_0("\224\51\237\100", "\16\135\90\139")})};
local Options = Fluent['Options'];
do
	Tabs['Home']:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\96\125\18\63\75", "\24\52\20\102\83\46\52")]=LUAOBFUSACTOR_DECRYPT_STR_0("\231\32\49\61\79\240\42\45\33\8\214\46\44\100\3\205\33\42", "\111\164\79\65\68"),[LUAOBFUSACTOR_DECRYPT_STR_0("\226\220\144\221\60\227\214\205\138\209\32", "\138\166\185\227\190\78")]=LUAOBFUSACTOR_DECRYPT_STR_0("\232\124\196\35\18\20\16\223\124\133\19\87\53\88", "\121\171\20\165\87\50\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\229\57\181\58\187\3\197\51", "\98\166\88\217\86\217")]=function()
		setclipboard(LUAOBFUSACTOR_DECRYPT_STR_0("\254\226\109\17\149\134\185\185\109\79\139\217\185\255\106\12\131\210\243\248\126\27\158", "\188\150\150\25\97\230"));
	end});
	local section = Tabs['Main']:AddSection(LUAOBFUSACTOR_DECRYPT_STR_0("\251\156\75\13\76\203\211\154\87\11\2\234", "\141\186\233\63\98\108"));
	local autoCast = Tabs['Main']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\240\255\56\185\6\240\249\56", "\69\145\138\76\214"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\68\198\157\133\186", "\118\16\175\233\233\223")]=LUAOBFUSACTOR_DECRYPT_STR_0("\170\145\33\180\174\168\124\152\144", "\29\235\228\85\219\142\235"),[LUAOBFUSACTOR_DECRYPT_STR_0("\25\209\188\220\98\66\51", "\50\93\180\218\189\23\46\71")]=false});
	autoCast:OnChanged(function()
		local RodName = ReplicatedStorage['playerstats'][LocalPlayer['Name']]['Stats']['rod']['Value'];
		if (Options['autoCast']['Value'] == true) then
			autoCastEnabled = true;
			if LocalPlayer['Backpack']:FindFirstChild(RodName) then
				LocalPlayer['Character']['Humanoid']:EquipTool(LocalPlayer['Backpack']:FindFirstChild(RodName));
			end
			if LocalCharacter then
				local tool = LocalCharacter:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\234\171\84\64", "\40\190\196\59\44\36\188"));
				if tool then
					local hasBobber = tool:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\62\74\222\182\255\111", "\109\92\37\188\212\154\29"));
					if not hasBobber then
						if (CastMode == LUAOBFUSACTOR_DECRYPT_STR_0("\40\234\163\202\37", "\58\100\143\196\163\81")) then
							VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, LocalPlayer, 0);
							HumanoidRootPart['ChildAdded']:Connect(function()
								if ((HumanoidRootPart:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\10\77\52\166\45", "\110\122\34\67\195\95\41\133")) ~= nil) and (HumanoidRootPart['power']['powerbar']['bar'] ~= nil)) then
									HumanoidRootPart['power']['powerbar']['bar']['Changed']:Connect(function(property)
										if (property == LUAOBFUSACTOR_DECRYPT_STR_0("\70\184\65\79", "\182\21\209\59\42")) then
											if (HumanoidRootPart['power']['powerbar']['bar']['Size'] == UDim2.new(1, 0, 1, 0)) then
												VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, LocalPlayer, 0);
											end
										end
									end);
								end
							end);
						elseif (CastMode == LUAOBFUSACTOR_DECRYPT_STR_0("\149\91\196\9\32\176\163", "\222\215\55\165\125\65")) then
							local rod = LocalCharacter and LocalCharacter:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\24\222\201\22", "\42\76\177\166\122\146\161\141"));
							if (rod and rod:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\179\139\9\219\124\101", "\22\197\234\101\174\25")) and string.find(rod.Name, LUAOBFUSACTOR_DECRYPT_STR_0("\31\59\161", "\230\77\84\197\188\22\207\183"))) then
								task.wait(0.5);
								local Random = math.random(90, 99);
								rod['events']['cast']:FireServer(Random);
							end
						end
					end
				end
				task.wait(1);
			end
		else
			autoCastEnabled = false;
		end
	end);
	local autoShake = Tabs['Main']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\248\1\210\243\191\169\241\62\252", "\85\153\116\166\156\236\193\144"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\144\233\89\191\225", "\96\196\128\45\211\132")]=LUAOBFUSACTOR_DECRYPT_STR_0("\20\152\111\80\146\156\188\217\62\136", "\184\85\237\27\63\178\207\212"),[LUAOBFUSACTOR_DECRYPT_STR_0("\44\92\15\94\29\85\29", "\63\104\57\105")]=false});
	autoShake:OnChanged(function()
		if (Options['autoShake']['Value'] == true) then
			autoShakeEnabled = true;
			startAutoShake();
		else
			autoShakeEnabled = false;
			stopAutoShake();
		end
	end);
	local autoReel = Tabs['Main']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\10\146\176\75\57\130\161\72", "\36\107\231\196"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\105\188\182\139\88", "\231\61\213\194")]=LUAOBFUSACTOR_DECRYPT_STR_0("\40\184\41\124\73\159\56\118\5", "\19\105\205\93"),[LUAOBFUSACTOR_DECRYPT_STR_0("\141\13\216\128\42\165\28", "\95\201\104\190\225")]=false});
	autoReel:OnChanged(function()
		if (Options['autoReel']['Value'] == true) then
			autoReelEnabled = true;
			startAutoReel();
		else
			autoReelEnabled = false;
			stopAutoReel();
		end
	end);
	local FreezeCharacter = Tabs['Main']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\137\217\196\203\181\206\226\198\174\217\192\205\187\206\211", "\174\207\171\161"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\217\247\25\255\253", "\183\141\158\109\147\152")]=LUAOBFUSACTOR_DECRYPT_STR_0("\10\27\227\9\54\12\166\47\36\8\244\13\47\29\227\30", "\108\76\105\134"),[LUAOBFUSACTOR_DECRYPT_STR_0("\207\192\183\224\219\231\209", "\174\139\165\209\129")]=false});
	FreezeCharacter:OnChanged(function()
		local oldpos = HumanoidRootPart['CFrame'];
		FreezeChar = Options['FreezeCharacter']['Value'];
		task.wait();
		while WaitForSomeone(RenderStepped) do
			if (FreezeChar and (HumanoidRootPart ~= nil)) then
				task.wait();
				HumanoidRootPart['CFrame'] = oldpos;
			else
				break;
			end
		end
	end);
	local section = Tabs['Main']:AddSection(LUAOBFUSACTOR_DECRYPT_STR_0("\142\188\230\196\134\37\121\107\171\186\236\198", "\24\195\211\130\161\166\99\16"));
	local autoCastMode = Tabs['Main']:AddDropdown(LUAOBFUSACTOR_DECRYPT_STR_0("\71\22\253\35\112\23\85\23\196\35\87\19", "\118\38\99\137\76\51"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\201\47\17\30\12", "\64\157\70\101\114\105")]=LUAOBFUSACTOR_DECRYPT_STR_0("\97\189\179\236\80\99\169\180\247\80\109\167\163\230", "\112\32\200\199\131"),[LUAOBFUSACTOR_DECRYPT_STR_0("\26\81\80\173\198\184", "\66\76\48\60\216\163\203")]={LUAOBFUSACTOR_DECRYPT_STR_0("\150\131\126\250\75", "\68\218\230\25\147\63\174"),LUAOBFUSACTOR_DECRYPT_STR_0("\143\38\82\88\183\163\62", "\214\205\74\51\44")},[LUAOBFUSACTOR_DECRYPT_STR_0("\215\89\238\232\126", "\23\154\44\130\156")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\53\163\171\175\35\31\5", "\115\113\198\205\206\86")]=CastMode});
	autoCastMode:OnChanged(function(Value)
		CastMode = Value;
	end);
	local autoShakeMode = Tabs['Main']:AddDropdown(LUAOBFUSACTOR_DECRYPT_STR_0("\133\66\234\85\183\95\255\81\129\122\241\94\129", "\58\228\55\158"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\128\128\196\34\57", "\85\212\233\176\78\92\205")]=LUAOBFUSACTOR_DECRYPT_STR_0("\107\77\156\237\10\107\128\227\65\93\200\207\69\92\141", "\130\42\56\232"),[LUAOBFUSACTOR_DECRYPT_STR_0("\220\180\40\246\69\44", "\95\138\213\68\131\32")]={LUAOBFUSACTOR_DECRYPT_STR_0("\4\41\183\74\113\43\60\168\76\120", "\22\74\72\193\35"),LUAOBFUSACTOR_DECRYPT_STR_0("\1\118\241\75\41", "\56\76\25\132")},[LUAOBFUSACTOR_DECRYPT_STR_0("\115\212\167\50\198", "\175\62\161\203\70")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\24\216\197\18\32\48\201", "\85\92\189\163\115")]=ShakeMode});
	autoShakeMode:OnChanged(function(Value)
		ShakeMode = Value;
	end);
	local autoReelMode = Tabs['Main']:AddDropdown(LUAOBFUSACTOR_DECRYPT_STR_0("\40\185\36\55\27\169\53\52\4\163\52\61", "\88\73\204\80"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\26\138\4\74\44", "\186\78\227\112\38\73")]=LUAOBFUSACTOR_DECRYPT_STR_0("\221\66\233\90\19\72\249\82\241\21\126\117\248\82", "\26\156\55\157\53\51"),[LUAOBFUSACTOR_DECRYPT_STR_0("\186\217\26\204\189\67", "\48\236\184\118\185\216")]={LUAOBFUSACTOR_DECRYPT_STR_0("\201\184\80\57\219", "\84\133\221\55\80\175"),LUAOBFUSACTOR_DECRYPT_STR_0("\159\235\37\178\198\82\169", "\60\221\135\68\198\167")},[LUAOBFUSACTOR_DECRYPT_STR_0("\195\168\244\151\75", "\185\142\221\152\227\34")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\124\192\81\251\86\63\227", "\151\56\165\55\154\35\83")]=ReelMode});
	autoReelMode:OnChanged(function(Value)
		ReelMode = Value;
	end);
	local section = Tabs['Items']:AddSection(LUAOBFUSACTOR_DECRYPT_STR_0("\147\70\9\226\224\106\17\235\173\80", "\142\192\35\101"));
	Tabs['Items']:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\226\124\61\175\226", "\118\182\21\73\195\135\236\204")]=LUAOBFUSACTOR_DECRYPT_STR_0("\59\57\22\76\68\37\252\6\56", "\157\104\92\122\32\100\109"),[LUAOBFUSACTOR_DECRYPT_STR_0("\135\163\220\201\47\46\157\191\170\169\193", "\203\195\198\175\170\93\71\237")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\13\74\50\217\83\16\255\37", "\156\78\43\94\181\49\113")]=function()
		SellHand();
	end});
	Tabs['Items']:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\70\225\208\175\14", "\25\18\136\164\195\107\35")]=LUAOBFUSACTOR_DECRYPT_STR_0("\219\40\165\67\50\157\205\180", "\216\136\77\201\47\18\220\161"),[LUAOBFUSACTOR_DECRYPT_STR_0("\9\233\56\217\26\213\146\57\229\36\212", "\226\77\140\75\186\104\188")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\154\207\220\51\77\184\205\219", "\47\217\174\176\95")]=function()
		SellAll();
	end});
	local section = Tabs['Items']:AddSection(LUAOBFUSACTOR_DECRYPT_STR_0("\140\207\115\3\161\65\106\35", "\70\216\189\22\98\210\52\24"));
	Tabs['Items']:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\238\214\183\139\214", "\179\186\191\195\231")]=LUAOBFUSACTOR_DECRYPT_STR_0("\205\58\20\225\233\48\10\240\185\43\23\164\211\62\27\239\185\18\25\246\235\48\15", "\132\153\95\120"),[LUAOBFUSACTOR_DECRYPT_STR_0("\146\179\2\33\245\219\163\186", "\192\209\210\110\77\151\186")]=function()
		HumanoidRootPart['CFrame'] = CFrame.new(-2824.359, 214.311, 1518.13);
	end});
	Tabs['Items']:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\212\10\54\229\250", "\164\128\99\66\137\159")]=LUAOBFUSACTOR_DECRYPT_STR_0("\50\140\249\191\9\155\169\147\1\153", "\222\96\233\137"),[LUAOBFUSACTOR_DECRYPT_STR_0("\154\178\171\19\138\242\243\178", "\144\217\211\199\127\232\147")]=function()
		for i, v in pairs(game['Players']['LocalPlayer']['Backpack']:GetChildren()) do
			if (v['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\204\61\59\41\198\80\16\65\184\2\63\56", "\36\152\79\94\72\181\37\98")) then
				game['Players']['LocalPlayer']['Character']['Humanoid']:EquipTool(v);
				workspace['world']['npcs'][LUAOBFUSACTOR_DECRYPT_STR_0("\253\217\68\52\151\245\70\45\197\215\80", "\95\183\184\39")]['treasure']['repairmap']:InvokeServer();
			end
		end
	end});
	Tabs['Items']:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\129\54\243\42\81", "\98\213\95\135\70\52\224")]=LUAOBFUSACTOR_DECRYPT_STR_0("\221\172\197\123\81\253\183\137\67\70\251\162\218\98\70\251", "\52\158\195\169\23"),[LUAOBFUSACTOR_DECRYPT_STR_0("\89\189\62\120\132\52\120\128", "\235\26\220\82\20\230\85\27")]=function()
		for i, v in ipairs(game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\191\174\251\201\103\152\160\234\199", "\20\232\193\137\162")):GetDescendants()) do
			if (v['ClassName'] == LUAOBFUSACTOR_DECRYPT_STR_0("\18\205\202\190\238\129\30\101\59\239\215\169\234\156\3", "\17\66\191\165\198\135\236\119")) then
				v['HoldDuration'] = 0;
			end
		end
		for i, v in pairs(workspace['world']['chests']:GetDescendants()) do
			if (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\63\174\188\7", "\177\111\207\206\115\159\136\140")) and v:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\38\129\21\7\192\124\90\17\156\0", "\63\101\233\112\116\180\47"))) then
				game['Players']['LocalPlayer']['Character']['HumanoidRootPart']['CFrame'] = v['CFrame'];
				for _, v in pairs(workspace['world']['chests']:GetDescendants()) do
					if (v['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\243\41\226\10\241\59\202\47\244\34\234\57\206\43\249", "\86\163\91\141\114\152")) then
						fireproximityprompt(v);
					end
				end
				task.wait(1);
			end
		end
	end});
	local section = Tabs['Teleports']:AddSection(LUAOBFUSACTOR_DECRYPT_STR_0("\96\14\120\118\57\71\75\64\118\54\86\27\123\97\46", "\90\51\107\20\19"));
	local IslandTPDropdownUI = Tabs['Teleports']:AddDropdown(LUAOBFUSACTOR_DECRYPT_STR_0("\164\227\137\238\51\137\196\181\203\47\130\224\129\224\42\131\197\172", "\93\237\144\229\143"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\33\255\228\21\14", "\38\117\150\144\121\107")]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\169\235\59\109\143\235\54\40\171\225\40\57", "\90\77\219\142"),[LUAOBFUSACTOR_DECRYPT_STR_0("\208\5\45\44\73\20", "\26\134\100\65\89\44\103")]=teleportSpots,[LUAOBFUSACTOR_DECRYPT_STR_0("\220\246\60\55\173", "\196\145\131\80\67")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\58\181\0\9\13\228\10", "\136\126\208\102\104\120")]=nil});
	IslandTPDropdownUI:OnChanged(function(Value)
		if ((teleportSpots ~= nil) and (HumanoidRootPart ~= nil)) then
			xpcall(function()
				HumanoidRootPart['CFrame'] = TpSpotsFolder:FindFirstChild(Value)['CFrame'] + Vector3.new(0, 5, 0);
				IslandTPDropdownUI:SetValue(nil);
			end, function(err)
			end);
		end
	end);
	local TotemTPDropdownUI = Tabs['Teleports']:AddDropdown(LUAOBFUSACTOR_DECRYPT_STR_0("\76\133\218\70\162\102\13\117\106\133\222\71\160\69\51\100\81", "\49\24\234\174\35\207\50\93"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\56\251\233\132\116", "\17\108\146\157\232")]=LUAOBFUSACTOR_DECRYPT_STR_0("\120\198\24\232\44\188\11\247\27\249\42\165", "\200\43\163\116\141\79"),[LUAOBFUSACTOR_DECRYPT_STR_0("\137\55\49\150\181\231", "\131\223\86\93\227\208\148")]={LUAOBFUSACTOR_DECRYPT_STR_0("\194\80\164\185\15\180", "\213\131\37\214\214\125"),LUAOBFUSACTOR_DECRYPT_STR_0("\21\62\43\187\232\39\39", "\129\70\75\69\223"),LUAOBFUSACTOR_DECRYPT_STR_0("\113\194\253\237\111\234\82", "\143\38\171\147\137\28"),LUAOBFUSACTOR_DECRYPT_STR_0("\227\143\182\248\6\240\215\194\135\188\253", "\180\176\226\217\147\99\131"),LUAOBFUSACTOR_DECRYPT_STR_0("\231\188\34\23\214\170\59", "\103\179\217\79")},[LUAOBFUSACTOR_DECRYPT_STR_0("\103\162\16\193\72", "\195\42\215\124\181\33\236")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\41\92\49\63\48\244\25", "\152\109\57\87\94\69")]=nil});
	TotemTPDropdownUI:OnChanged(function(Value)
		SelectedTotem = Value;
		if (SelectedTotem == LUAOBFUSACTOR_DECRYPT_STR_0("\216\194\24\172\172\211", "\200\153\183\106\195\222\178\52")) then
			HumanoidRootPart['CFrame'] = CFrame.new(-1811, -137, -3282);
			TotemTPDropdownUI:SetValue(nil);
		elseif (SelectedTotem == LUAOBFUSACTOR_DECRYPT_STR_0("\1\246\134\57\64\91\62", "\58\82\131\232\93\41")) then
			HumanoidRootPart['CFrame'] = CFrame.new(-1148, 135, -1075);
			TotemTPDropdownUI:SetValue(nil);
		elseif (SelectedTotem == LUAOBFUSACTOR_DECRYPT_STR_0("\180\94\222\17\78\58\151", "\95\227\55\176\117\61")) then
			HumanoidRootPart['CFrame'] = CFrame.new(2849, 178, 2702);
			TotemTPDropdownUI:SetValue(nil);
		elseif (SelectedTotem == LUAOBFUSACTOR_DECRYPT_STR_0("\43\115\44\64\174\11\125\49\78\174\22", "\203\120\30\67\43")) then
			HumanoidRootPart['CFrame'] = CFrame.new(2789, 140, -625);
			TotemTPDropdownUI:SetValue(nil);
		elseif (SelectedTotem == LUAOBFUSACTOR_DECRYPT_STR_0("\197\32\64\255\220\226\49", "\185\145\69\45\143")) then
			HumanoidRootPart['CFrame'] = CFrame.new(35, 133, 1943);
			TotemTPDropdownUI:SetValue(nil);
		end
	end);
	local WorldEventTPDropdownUI = Tabs['Teleports']:AddDropdown(LUAOBFUSACTOR_DECRYPT_STR_0("\189\16\11\170\216\175\9\28\168\200\190\47\61\180\211\154\27\22\177\210\191\54", "\188\234\127\121\198"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\12\59\7\143\61", "\227\88\82\115")]=LUAOBFUSACTOR_DECRYPT_STR_0("\112\26\182\162\1\103\3\40\181\181\14\119\3\58\172\162\12\103", "\19\35\127\218\199\98"),[LUAOBFUSACTOR_DECRYPT_STR_0("\42\250\6\247\25\232", "\130\124\155\106")]={LUAOBFUSACTOR_DECRYPT_STR_0("\230\223\228\174\173\241\121\255\226\195\255\189\175\230\115\176\217", "\223\181\171\150\207\195\150\28"),LUAOBFUSACTOR_DECRYPT_STR_0("\107\40\230\175\29\12\18\226\163\4\73\40\235\171\8\72\122\208\166\8\94\49", "\105\44\90\131\206"),LUAOBFUSACTOR_DECRYPT_STR_0("\216\242\183\184\28\126\200\232\187\173\13\126\204\232\179\171\3", "\94\159\128\210\217\104"),LUAOBFUSACTOR_DECRYPT_STR_0("\103\241\7\179\90\63\202\114\81\235\13", "\26\48\153\102\223\63\31\153"),LUAOBFUSACTOR_DECRYPT_STR_0("\54\72\232\179\38\69\253\231\10\83\173\190\66\115\232\225\18\69\227\231", "\147\98\32\141"),LUAOBFUSACTOR_DECRYPT_STR_0("\53\70\228\203\10\89\79\23\77", "\43\120\35\131\170\102\54")},[LUAOBFUSACTOR_DECRYPT_STR_0("\121\19\139\162\172", "\228\52\102\231\214\197\208")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\58\229\115\203\255\135\13", "\182\126\128\21\170\138\235\121")]=nil});
	WorldEventTPDropdownUI:OnChanged(function(Value)
		SelectedWorldEvent = Value;
		if (SelectedWorldEvent == LUAOBFUSACTOR_DECRYPT_STR_0("\184\206\39\231\136\20\53\70\188\210\60\244\138\3\63\9\135", "\102\235\186\85\134\230\115\80")) then
			local offset = Vector3.new(25, 135, 25);
			local WorldEvent = game['Workspace']['zones']['fishing']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\126\31\49\81\115\208\39", "\66\55\108\94\63\18\180"));
			if not WorldEvent then
				WorldEventTPDropdownUI:SetValue(nil);
				return ShowNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\58\130\145\119\33\86\1\131\129\119\20\77\6\140\139\48\34\25\35\133\140\37\43\73\27\130\137", "\57\116\237\229\87\71"));
			end
			HumanoidRootPart['CFrame'] = CFrame.new(game['Workspace']['zones']['fishing']['Isonade']['Position'] + offset);
			WorldEventTPDropdownUI:SetValue(nil);
		elseif (SelectedWorldEvent == LUAOBFUSACTOR_DECRYPT_STR_0("\141\163\232\230\99\174\111\171\188\224\226\101\230\66\171\181\173\212\127\239\85\161", "\39\202\209\141\135\23\142")) then
			local offset = Vector3.new(0, 135, 0);
			local WorldEvent = game['Workspace']['zones']['fishing']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\216\33\12\11\38\184\215\50\4\7\55\234\247\54\8\14\114\203\247\50\27\1", "\152\159\83\105\106\82"));
			if not WorldEvent then
				WorldEventTPDropdownUI:SetValue(nil);
				return ShowNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\175\201\69\178\207\83\148\200\85\178\238\78\132\199\69\178\225\93\140\203\84\224\193\89\128\194\17\193\193\93\147\205", "\60\225\166\49\146\169"));
			end
			HumanoidRootPart['CFrame'] = CFrame.new(game['Workspace']['zones']['fishing'][LUAOBFUSACTOR_DECRYPT_STR_0("\8\12\42\43\21\71\7\31\34\39\4\21\39\27\46\46\65\52\39\31\61\33", "\103\79\126\79\74\97")]['Position'] + offset);
			WorldEventTPDropdownUI:SetValue(nil);
		elseif (SelectedWorldEvent == LUAOBFUSACTOR_DECRYPT_STR_0("\157\109\214\114\74\90\141\119\218\103\91\90\137\119\210\97\85", "\122\218\31\179\19\62")) then
			local offset = Vector3.new(0, 135, 0);
			local WorldEvent = game['Workspace']['zones']['fishing']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\148\196\200\192\221\225\114\187\223\217\196\137\146\77\178\196\198", "\37\211\182\173\161\169\193"));
			if not WorldEvent then
				WorldEventTPDropdownUI:SetValue(nil);
				return ShowNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\217\53\89\153\46\116\172\249\62\13\254\58\126\184\227\122\122\209\33\111\188\183\9\69\216\58\112", "\217\151\90\45\185\72\27"));
			end
			HumanoidRootPart['CFrame'] = CFrame.new(game['Workspace']['zones']['fishing'][LUAOBFUSACTOR_DECRYPT_STR_0("\228\110\226\19\66\131\75\239\27\66\198\60\212\26\87\209\119", "\54\163\28\135\114")]['Position'] + offset);
			WorldEventTPDropdownUI:SetValue(nil);
		elseif (SelectedWorldEvent == LUAOBFUSACTOR_DECRYPT_STR_0("\31\211\92\142\75\63\27\211\92\144\69", "\31\72\187\61\226\46")) then
			local offset = Vector3.new(0, 135, 0);
			local WorldEvent = game['Workspace']['zones']['fishing']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\244\14\66\222\66\62\23\203\7\81\217", "\68\163\102\35\178\39\30"));
			if not WorldEvent then
				WorldEventTPDropdownUI:SetValue(nil);
				return ShowNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\144\127\206\135\5\186\150\31\186\48\237\207\2\185\134\81\141\120\219\213\8", "\113\222\16\186\167\99\213\227"));
			end
			HumanoidRootPart['CFrame'] = CFrame.new(game['Workspace']['zones']['fishing'][LUAOBFUSACTOR_DECRYPT_STR_0("\25\6\250\250\43\78\200\254\47\28\240", "\150\78\110\155")]['Position'] + offset);
			WorldEventTPDropdownUI:SetValue(nil);
		elseif (SelectedWorldEvent == LUAOBFUSACTOR_DECRYPT_STR_0("\177\205\34\161\128\27\175\84\141\214\103\172\228\45\186\82\149\192\41\245", "\32\229\165\71\129\196\126\223")) then
			local offset = Vector3.new(0, 50, 0);
			local WorldEvent = game['Workspace']['zones']['fishing']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\247\129\193\193\165\208\211\157\204\146\193\152\131\186\193\147\145\208\205\157", "\181\163\233\164\225\225"));
			if not WorldEvent then
				WorldEventTPDropdownUI:SetValue(nil);
				return ShowNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\126\132\42\55\86\132\43\121\84\203\10\127\85\203\26\114\64\159\54\100\16\198\126\68\85\153\46\114\94\159", "\23\48\235\94"));
			end
			HumanoidRootPart['CFrame'] = CFrame.new(game['Workspace']['zones']['fishing'][LUAOBFUSACTOR_DECRYPT_STR_0("\72\210\221\29\115\54\194\104\210\203\29\26\115\225\121\200\200\88\89\39", "\178\28\186\184\61\55\83")]['Position'] + offset);
			WorldEventTPDropdownUI:SetValue(nil);
		elseif (SelectedWorldEvent == LUAOBFUSACTOR_DECRYPT_STR_0("\233\200\64\61\254\1\241\203\195", "\149\164\173\39\92\146\110")) then
			local offset = Vector3.new(0, 135, 0);
			local WorldEvent = game['Workspace']['zones']['fishing']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\222\34\23\30\22\20\247\40\30", "\123\147\71\112\127\122"));
			if not WorldEvent then
				WorldEventTPDropdownUI:SetValue(nil);
				return ShowNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\226\194\150\49\64\195\216\140\117\6\225\200\133\112\74\195\201\141\127", "\38\172\173\226\17"));
			end
			HumanoidRootPart['CFrame'] = CFrame.new(game['Workspace']['zones']['fishing'][LUAOBFUSACTOR_DECRYPT_STR_0("\96\20\43\238\65\30\40\224\67", "\143\45\113\76")]['Position'] + offset);
			WorldEventTPDropdownUI:SetValue(nil);
		end
	end);
	local PlayerTPDropdownUI = Tabs['Teleports']:AddDropdown(LUAOBFUSACTOR_DECRYPT_STR_0("\136\180\29\37\189\170\40\12\156\170\19\44\188\183\11\50\141\145", "\92\216\216\124"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\111\59\184\76\248", "\157\59\82\204\32")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\59\239\255\234\254\147\129\52\63\250\255\251", "\209\88\94\131\154\137\138\179"),[LUAOBFUSACTOR_DECRYPT_STR_0("\30\160\200\105\27\48", "\66\72\193\164\28\126\67\81")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\202\57\164\76\47", "\22\135\76\200\56\70")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\169\53\254\37\72\237\153", "\129\237\80\152\68\61")]=nil});
	local function populatePlayerDropdown()
		local playerNames = {};
		for _, player in ipairs(Players:GetPlayers()) do
			if (player ~= LocalPlayer) then
				table.insert(playerNames, player.Name);
			end
		end
		PlayerTPDropdownUI:SetValues(playerNames);
	end
	populatePlayerDropdown();
	local function teleportToPlayer(targetPlayer)
		local character = targetPlayer['Character'] or targetPlayer:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\114\160\5\225\29\20\76\84\186", "\56\49\200\100\147\124\119"));
		if character then
			local humanoidRootPart = character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\228\43\178\241\194\49\182\244\254\49\176\228\252\63\173\228", "\144\172\94\223"));
			if humanoidRootPart then
				LocalPlayer['Character']:SetPrimaryPartCFrame(humanoidRootPart['CFrame'] + Vector3.new(0, 3, 0));
				print(LUAOBFUSACTOR_DECRYPT_STR_0("\16\10\174\66\52\0\176\83\33\11\226\83\43\85\226", "\39\68\111\194") .. targetPlayer['Name']);
			else
				warn(LUAOBFUSACTOR_DECRYPT_STR_0("\254\179\234\198\119\184\223\162\213\200\118\163\230\167\245\211\57\185\217\178\167\193\118\162\216\162\167\193\118\165\150\182\235\198\96\178\196\252\167", "\215\182\198\135\167\25") .. targetPlayer['Name']);
			end
		else
			warn(LUAOBFUSACTOR_DECRYPT_STR_0("\174\65\235\90\140\74\254\77\159\9\228\71\153\9\235\94\140\64\230\73\143\69\239\8\139\70\248\8\157\69\235\81\136\91\176\8", "\40\237\41\138") .. targetPlayer['Name']);
		end
	end
	PlayerTPDropdownUI:OnChanged(function(SelectedPlayerName)
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\244\113\246\253\73\211\113\254\184\122\203\117\227\253\88\157\52", "\42\167\20\154\152"), SelectedPlayerName);
		if SelectedPlayerName then
			local targetPlayer = Players:FindFirstChild(SelectedPlayerName);
			if targetPlayer then
				teleportToPlayer(targetPlayer);
			else
				warn(LUAOBFUSACTOR_DECRYPT_STR_0("\127\240\163\64\125\36\10\234\173\2\119\40\68\250\226\86\112\51\77\251\182\2\97\45\75\231\167\80\43\97", "\65\42\158\194\34\17") .. SelectedPlayerName);
			end
			PlayerTPDropdownUI:SetValue(nil);
			populatePlayerDropdown();
		end
	end);
	Players['PlayerAdded']:Connect(populatePlayerDropdown);
	Players['PlayerRemoving']:Connect(populatePlayerDropdown);
	LocalPlayer['CharacterAdded']:Connect(function(character)
		character:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\50\50\95\13\35\226\18\234\40\40\93\24\29\236\9\250", "\142\122\71\50\108\77\141\123"));
		populatePlayerDropdown();
	end);
	if LocalPlayer['Character'] then
		LocalPlayer['Character']:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\61\183\242\25\53\26\171\251\42\52\26\182\207\25\41\1", "\91\117\194\159\120"));
	end
	Tabs['Teleports']:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\46\20\42\20\48", "\68\122\125\94\120\85\145")]=LUAOBFUSACTOR_DECRYPT_STR_0("\35\25\195\91\216\214\168\3\92\219\81\136\237\168\22\10\202\82\205\203\250\58\25\221\93\192\216\180\3", "\218\119\124\175\62\168\185"),[LUAOBFUSACTOR_DECRYPT_STR_0("\129\245\91\199\183\249\88\208\172\255\70", "\164\197\144\40")]=LUAOBFUSACTOR_DECRYPT_STR_0("\183\245\166\142\205\185\145\228\185\203\201\185\195\228\162\142\157\130\145\241\188\142\209\179\145\176\135\142\207\181\139\241\164\159\147", "\214\227\144\202\235\189"),[LUAOBFUSACTOR_DECRYPT_STR_0("\206\164\139\119\18\178\80\55", "\92\141\197\231\27\112\211\51")]=function()
		local Merchant = game['Workspace']['active']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\203\250\152\160\217\231\241\158\227\243\233\254\158", "\177\134\159\234\195"));
		if not Merchant then
			return ShowNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\147\228\43\224\207\178\254\49\164\137\144\238\45\163\193\188\229\43", "\169\221\139\95\192"));
		end
		HumanoidRootPart['CFrame'] = CFrame.new(game['Workspace']['active'][LUAOBFUSACTOR_DECRYPT_STR_0("\243\142\109\60\42\39\208\159\63\29\45\39\202", "\70\190\235\31\95\66")]['Boat'][LUAOBFUSACTOR_DECRYPT_STR_0("\151\231\8\229\237\187\236\14\166\199\181\227\14", "\133\218\130\122\134")]['r']['HandlesR'].Position);
	end});
	Tabs['Teleports']:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\8\246\247\200\217", "\88\92\159\131\164\188\195")]=LUAOBFUSACTOR_DECRYPT_STR_0("\163\60\186\74\195\238\157\179\47\185\78\151\209\210\142\43", "\189\224\78\223\43\183\139"),[LUAOBFUSACTOR_DECRYPT_STR_0("\13\253\134\26\195\47\255\129", "\161\78\156\234\118")]=function()
		local SafeZone = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\151\182\219\200", "\188\199\215\169"));
		SafeZone['Size'] = Vector3.new(30, 1, 30);
		SafeZone['Position'] = Vector3.new(math.random(-2000, 2000), math.random(50000, 90000), math.random(-2000, 2000));
		SafeZone['Anchored'] = true;
		SafeZone['BrickColor'] = BrickColor.new(LUAOBFUSACTOR_DECRYPT_STR_0("\222\27\86\124\224\232\73\79\110\250\236\5\90", "\136\156\105\63\27"));
		SafeZone['Material'] = Enum['Material']['ForceField'];
		SafeZone['Parent'] = game['Workspace'];
		HumanoidRootPart['CFrame'] = SafeZone['CFrame'] + Vector3.new(0, 5, 0);
	end});
	local section = Tabs['Misc']:AddSection(LUAOBFUSACTOR_DECRYPT_STR_0("\56\132\120\38\26\143\109\49\9", "\84\123\236\25"));
	local WalkOnWater = Tabs['Misc']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\199\138\166\28\131\187\199\138\190\18\190", "\213\144\235\202\119\204"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\23\17\202\38\45", "\45\67\120\190\74\72\67")]=LUAOBFUSACTOR_DECRYPT_STR_0("\23\35\225\174\185\167\224\169\23\35\249\160\235", "\137\64\66\141\197\153\232\142"),[LUAOBFUSACTOR_DECRYPT_STR_0("\39\213\36\167\157\15\196", "\232\99\176\66\198")]=false});
	WalkOnWater:OnChanged(function()
		for i, v in pairs(workspace['zones']['fishing']:GetChildren()) do
			if (v['Name'] == WalkZone) then
				v['CanCollide'] = Options['WalkOnWater']['Value'];
				if (v['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\195\34\45\7\117", "\76\140\65\72\102\27\237\153")) then
					for i, v in pairs(workspace['zones']['fishing']:GetChildren()) do
						if (v['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\110\223\19\194\151\46\189\79\219\24", "\222\42\186\118\178\183\97")) then
							v['CanCollide'] = Options['WalkOnWater']['Value'];
						end
					end
				end
			end
		end
	end);
	local WalkOnWaterZone = Tabs['Misc']:AddDropdown(LUAOBFUSACTOR_DECRYPT_STR_0("\106\237\72\129\114\226\115\139\73\233\86\176\82\226\65", "\234\61\140\36"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\21\212\174\126\10", "\111\65\189\218\18")]=LUAOBFUSACTOR_DECRYPT_STR_0("\116\74\23\62\75\115\161\3\124\26\33\14\78\239\121\68\21\48", "\207\35\43\123\85\107\60"),[LUAOBFUSACTOR_DECRYPT_STR_0("\70\171\172\255\124\99", "\25\16\202\192\138")]={LUAOBFUSACTOR_DECRYPT_STR_0("\210\200\168\227\167", "\148\157\171\205\130\201"),LUAOBFUSACTOR_DECRYPT_STR_0("\7\209\103\38\221\247\55\209\52\13\212\243\51", "\150\67\180\20\73\177"),LUAOBFUSACTOR_DECRYPT_STR_0("\185\16\31\13\169\29\10\89\133\11", "\45\237\120\122")},[LUAOBFUSACTOR_DECRYPT_STR_0("\250\253\174\56\222", "\76\183\136\194")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\94\227\227\57\69\67\0", "\116\26\134\133\88\48\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\49\194\165\229\179", "\18\126\161\192\132\221")});
	WalkOnWaterZone:OnChanged(function(Value)
		WalkZone = Value;
	end);
	local WalkSpeedSliderUI = Tabs['Misc']:AddSlider(LUAOBFUSACTOR_DECRYPT_STR_0("\104\41\162\15\101\79\45\171\0\101\83\33\170\1\68\106\1", "\54\63\72\206\100"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\252\80\81\118\224", "\27\168\57\37\26\133")]=LUAOBFUSACTOR_DECRYPT_STR_0("\26\171\112\163\151\30\186\121\173\211", "\183\77\202\28\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\58\58\135", "\104\119\83\233")]=16,[LUAOBFUSACTOR_DECRYPT_STR_0("\216\249\63", "\35\149\152\71\66")]=200,[LUAOBFUSACTOR_DECRYPT_STR_0("\61\237\68\177\47\21\252", "\90\121\136\34\208")]=16,[LUAOBFUSACTOR_DECRYPT_STR_0("\245\1\64\16\195\7\91\25", "\126\167\110\53")]=1});
	WalkSpeedSliderUI:OnChanged(function(value)
		LocalPlayer['Character']['Humanoid']['WalkSpeed'] = value;
	end);
	local JumpHeightSliderUI = Tabs['Misc']:AddSlider(LUAOBFUSACTOR_DECRYPT_STR_0("\23\5\35\232\244\58\52\23\38\236\239\51\52\20\43\234\233\22", "\95\93\112\78\152\188"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\245\252\145\25\225", "\178\161\149\229\117\132\222")]=LUAOBFUSACTOR_DECRYPT_STR_0("\162\206\208\188\225\62\163\42\143\211\201", "\67\232\187\189\204\193\118\198"),[LUAOBFUSACTOR_DECRYPT_STR_0("\166\39\187", "\143\235\78\213\64\91\98")]=50,[LUAOBFUSACTOR_DECRYPT_STR_0("\160\73\156", "\214\237\40\228\137\16")]=200,[LUAOBFUSACTOR_DECRYPT_STR_0("\161\230\233\216\22\170\145", "\198\229\131\143\185\99")]=50,[LUAOBFUSACTOR_DECRYPT_STR_0("\99\131\189\125\85\133\166\116", "\19\49\236\200")]=1});
	JumpHeightSliderUI:OnChanged(function(value)
		LocalPlayer['Character']['Humanoid']['JumpPower'] = value;
	end);
	local ToggleNoclip = Tabs['Misc']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\202\56\241\176\232\191\208\56\245\187\237\170", "\218\158\87\150\215\132"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\207\23\205\238\51", "\173\155\126\185\130\86\66")]=LUAOBFUSACTOR_DECRYPT_STR_0("\203\169\185\203\129\252", "\140\133\198\218\167\232"),[LUAOBFUSACTOR_DECRYPT_STR_0("\145\43\178\124\145\185\58", "\228\213\78\212\29")]=false});
	ToggleNoclip:OnChanged(function()
		Noclip = Options['ToggleNoclip']['Value'];
	end);
	local section = Tabs['Misc']:AddSection(LUAOBFUSACTOR_DECRYPT_STR_0("\170\69\165\6", "\139\231\44\214\101"));
	local BypassRadar = Tabs['Misc']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\251\246\22\95\3\162\3\23\221\238\20", "\118\185\143\102\62\112\209\81"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\104\121\61\234\160", "\88\60\16\73\134\197\117\124")]=LUAOBFUSACTOR_DECRYPT_STR_0("\114\243\232\201\82\67\170\222\193\82\88\170\202\201\69\81\248", "\33\48\138\152\168"),[LUAOBFUSACTOR_DECRYPT_STR_0("\86\19\54\80\212\59\102", "\87\18\118\80\49\161")]=false});
	BypassRadar:OnChanged(function()
		for _, v in pairs(game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\111\17\214\172\181\79\10\211\175\190\127\27\200\182\185\79\27", "\208\44\126\186\192")):GetTagged(LUAOBFUSACTOR_DECRYPT_STR_0("\229\27\160\199\6\200\200\73", "\46\151\122\196\166\116\156\169"))) do
			if (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\199\228\74\22\249\234\236\84\30\220\240\228", "\155\133\141\38\122")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\22\63\190\71\78\124\160\2\63\165", "\197\69\74\204\33\47\31"))) then
				v['Enabled'] = Options['BypassRadar']['Value'];
			end
		end
	end);
	local BypassGPS = Tabs['Misc']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\210\86\74\134\227\92\125\183\195", "\231\144\47\58"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\134\209\206\121\29", "\89\210\184\186\21\120\93\175")]=LUAOBFUSACTOR_DECRYPT_STR_0("\147\74\108\212\106\41\241\116\76\230", "\90\209\51\28\181\25"),[LUAOBFUSACTOR_DECRYPT_STR_0("\244\126\81\239\170\220\111", "\223\176\27\55\142")]=false});
	BypassGPS:OnChanged(function()
		if (Options['BypassGPS']['Value'] == true) then
			local XyzClone = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\22\190\222\185\45\184\207\161\33\191\253\161\43\169\207\178\33", "\213\68\219\174"))['resources']['items']['items']['GPS']['GPS']['gpsMain']['xyz']:Clone();
			XyzClone['Parent'] = game['Players']['LocalPlayer']['PlayerGui']:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\3\245\39", "\31\107\128\67\135\74\165\95")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\203\233\250\72\91\190\214\237", "\209\184\136\156\45\33")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\5\201\118\3\168\6\203\126", "\216\103\168\21\104"));
			local Pos = GetPosition();
			local StringInput = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\61\190\15\228\61\190\15\228\61\190", "\196\24\205\35"), ExportValue(Pos[1]), ExportValue(Pos[2]), ExportValue(Pos[3]));
			XyzClone['Text'] = "<font color='#ff4949'>X</font><font color = '#a3ff81'>Y</font><font color = '#626aff'>Z</font>: " .. StringInput;
			BypassGpsLoop = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\28\158\237\53\43\153\245\15\45\142", "\102\78\235\131"))['Heartbeat']:Connect(function()
				local Pos = GetPosition();
				StringInput = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\191\61\120\4\2\42\251\116\191\61", "\84\154\78\84\36\39\89\215"), ExportValue(Pos[1]), ExportValue(Pos[2]), ExportValue(Pos[3]));
				XyzClone['Text'] = "<font color='#ff4949'>X</font><font color = '#a3ff81'>Y</font><font color = '#626aff'>Z</font> : " .. StringInput;
			end);
		else
			if PlayerGui['hud']['safezone']['backpack']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\229\248\76", "\101\157\129\54\56")) then
				PlayerGui['hud']['safezone']['backpack']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\5\176\144", "\25\125\201\234\203\67")):Destroy();
			end
			if BypassGpsLoop then
				BypassGpsLoop:Disconnect();
				BypassGpsLoop = nil;
			end
		end
	end);
	local RemoveFog = Tabs['Misc']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\75\241\21\12\2\34\53\118\243", "\115\25\148\120\99\116\71"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\56\52\173\40\68", "\33\108\93\217\68")]=LUAOBFUSACTOR_DECRYPT_STR_0("\233\78\172\162\205\78\225\139\212\76", "\205\187\43\193"),[LUAOBFUSACTOR_DECRYPT_STR_0("\218\119\3\222\235\126\17", "\191\158\18\101")]=false});
	RemoveFog:OnChanged(function()
		if (Options['RemoveFog']['Value'] == true) then
			if game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\233\202\128\191\187\204\205\128", "\207\165\163\231\215")):FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\245\242\224", "\16\166\153\153\54\68")) then
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\254\186\199\78\32\40\247\213", "\153\178\211\160\38\84\65")):FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\177\0\67", "\75\226\107\58"))['Parent'] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\116\215\22\114\5\203\195\95", "\173\56\190\113\26\113\162"))['bloom'];
			end
		elseif game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\231\215\42\13\227\194\208\42", "\151\171\190\77\101"))['bloom']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\246\36\225", "\107\165\79\152\201\152\29")) then
			game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\123\71\239\195\64\118\89\73", "\31\55\46\136\171\52"))['bloom']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\226\35\197", "\148\177\72\188"))['Parent'] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\138\191\80\219\178\191\89\212", "\179\198\214\55"));
		end
	end);
	local DayOnly = Tabs['Misc']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\212\13\107\89\75\223\233", "\179\144\108\18\22\37"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\242\170\15\133\202", "\175\166\195\123\233")]=LUAOBFUSACTOR_DECRYPT_STR_0("\203\195\68\9\223\225\206\68", "\144\143\162\61\41"),[LUAOBFUSACTOR_DECRYPT_STR_0("\196\214\27\81\103\139\39", "\83\128\179\125\48\18\231")]=false});
	DayOnly:OnChanged(function()
		if (Options['DayOnly']['Value'] == true) then
			DayOnlyLoop = RunService['Heartbeat']:Connect(function()
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\113\190\244\213\83\23\83\176", "\126\61\215\147\189\39"))['TimeOfDay'] = LUAOBFUSACTOR_DECRYPT_STR_0("\41\173\71\21\40\165\77\21", "\37\24\159\125");
			end);
		elseif DayOnlyLoop then
			DayOnlyLoop:Disconnect();
			DayOnlyLoop = nil;
		end
	end);
	local HoldDuration = Tabs['Misc']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\242\169\121\70\254\179\103\67\206\175\122\76", "\34\186\198\21"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\204\1\209\81\199", "\162\152\104\165\61")]=LUAOBFUSACTOR_DECRYPT_STR_0("\229\32\190\121\48\193\216\61\179\105\121\234\195\111\226\61\99\224\206", "\133\173\79\210\29\16"),[LUAOBFUSACTOR_DECRYPT_STR_0("\169\121\235\42\152\112\249", "\75\237\28\141")]=false});
	HoldDuration:OnChanged(function()
		if (Options['HoldDuration']['Value'] == true) then
			for i, v in ipairs(game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\235\80\222\186\60\11\230\226\217", "\129\188\63\172\209\79\123\135")):GetDescendants()) do
				if (v['ClassName'] == LUAOBFUSACTOR_DECRYPT_STR_0("\112\246\233\213\73\233\239\217\89\212\244\194\77\244\242", "\173\32\132\134")) then
					v['HoldDuration'] = 0;
				end
			end
		end
	end);
	local DisableOxygen = Tabs['Misc']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\106\18\27\238\172\61\200\97\3\17\232\171\63", "\173\46\123\104\143\206\81"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\128\20\54\134\64", "\97\212\125\66\234\37\227")]=LUAOBFUSACTOR_DECRYPT_STR_0("\174\234\165\52\28\134\230\246\26\6\147\228\179\59", "\126\234\131\214\85"),[LUAOBFUSACTOR_DECRYPT_STR_0("\160\208\79\91\90\136\193", "\47\228\181\41\58")]=true});
	DisableOxygen:OnChanged(function()
		LocalPlayer['Character']['client']['oxygen']['Disabled'] = Options['DisableOxygen']['Value'];
	end);
	Tabs['Misc']:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\146\245\205\55\6", "\127\198\156\185\91\99\80")]=LUAOBFUSACTOR_DECRYPT_STR_0("\214\21\220\233\231\51\0\228", "\190\149\122\172\144\199\107\89"),[LUAOBFUSACTOR_DECRYPT_STR_0("\22\0\226\253\236\59\21\229\247\241\60", "\158\82\101\145\158")]=LUAOBFUSACTOR_DECRYPT_STR_0("\83\241\18\15\4\83\242\11\6\70\127\255\16\18", "\36\16\158\98\118"),[LUAOBFUSACTOR_DECRYPT_STR_0("\227\23\207\247\90\233\36\238", "\133\160\118\163\155\56\136\71")]=function()
		local XYZ = tostring(game['Players']['LocalPlayer']['Character']['HumanoidRootPart'].Position);
		setclipboard(LUAOBFUSACTOR_DECRYPT_STR_0("\241\163\124\247\248\47\185\247\187\116\224\165\81\153\249\161\112\254\134\19\180\239\167\99\188\149\23\180\228\163\114\230\179\13\251\222\183\124\243\184\16\188\242\144\126\253\162\47\180\228\182\63\209\144\13\180\251\167\49\175\246\60\147\228\163\124\247\248\17\176\225\234", "\213\150\194\17\146\214\127") .. XYZ .. ")");
	end});
	local JustUI = Tabs['Misc']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\49\188\183\192\115\141", "\86\123\201\196\180\38\196\194"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\195\225\205\163\242", "\207\151\136\185")]=LUAOBFUSACTOR_DECRYPT_STR_0("\155\139\39\149\59\80\120\172\134\104\183\93\107", "\17\200\227\72\226\20\24"),[LUAOBFUSACTOR_DECRYPT_STR_0("\148\68\29\214\220\253\251", "\159\208\33\123\183\169\145\143")]=true});
	JustUI:OnChanged(function()
		local BlackShow = JustUI['Value'];
		if BlackShow then
			PlayerGui['hud']['safezone']['Visible'] = true;
		else
			PlayerGui['hud']['safezone']['Visible'] = false;
		end
	end);
	local IdentityHiderUI = Tabs['Misc']:AddToggle(LUAOBFUSACTOR_DECRYPT_STR_0("\219\94\61\56\230\83\44\47\218\83\60\51\224\111\17", "\86\146\58\88"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\108\214\254\204\171", "\154\56\191\138\160\206\137\86")]=LUAOBFUSACTOR_DECRYPT_STR_0("\182\75\250\147\121\57\149\140\175\93\240\137\104\51\149\213", "\172\230\57\149\231\28\90\225"),[LUAOBFUSACTOR_DECRYPT_STR_0("\38\175\128\211\61\215\22", "\187\98\202\230\178\72")]=false});
	IdentityHiderUI:OnChanged(function()
		while Options['IdentityHiderUI']['Value'] == true do
			if UserPlayer:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\50\245\182\53\75\42", "\42\65\129\196\80")) then
				UserPlayer['streak']['Text'] = LUAOBFUSACTOR_DECRYPT_STR_0("\42\99\121\254\50\41", "\142\98\42\61\186\119\103\98");
			end
			if UserPlayer:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\52\186\20\13\52", "\104\88\223\98")) then
				UserPlayer['level']['Text'] = LUAOBFUSACTOR_DECRYPT_STR_0("\104\242\244\203\14\183\4\223\203\234\38\200\106", "\141\36\151\130\174\98");
			end
			if UserPlayer:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\136\127\212\8\136", "\109\228\26\162")) then
				UserPlayer['user']['Text'] = LUAOBFUSACTOR_DECRYPT_STR_0("\118\204\217\92\197\200", "\134\62\133\157\24\128");
			end
			local hud = LocalPlayer:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\55\169\27\192\42\163\241\18\172", "\182\103\197\122\185\79\209")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\251\146\229", "\40\147\231\129\23\96")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\102\249\138\64\161\163\210\112", "\188\21\152\236\37\219\204"));
			if hud:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\67\230\62\2\83", "\108\32\137\87")) then
				hud['coins']['Text'] = LUAOBFUSACTOR_DECRYPT_STR_0("\130\193\36\130\10\215\15", "\57\202\136\96\198\79\153\43");
			end
			if hud:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\167\53\166", "\152\203\67\202\199\237\199")) then
				hud['lvl']['Text'] = LUAOBFUSACTOR_DECRYPT_STR_0("\210\106\132\43\58\91\57\202\204\111", "\134\154\35\192\111\127\21\25");
			end
			task.wait(0.01);
		end
	end);
	local section = Tabs['Misc']:AddSection(LUAOBFUSACTOR_DECRYPT_STR_0("\148\41\8\14\96\225\187\52\0\26\52\193", "\178\216\70\105\106\64"));
	Tabs['Misc']:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\11\34\110\250\204", "\224\95\75\26\150\169\181\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\39\213\217\44\4\133\120\13\211\214\33\80\169\59\50\211\221\36\64\236\80\46", "\22\107\186\184\72\36\204"),[LUAOBFUSACTOR_DECRYPT_STR_0("\196\188\40\66\12\230\190\47", "\110\135\221\68\46")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\235\34\24\251\221\233\116\172\36\13\252\128\180\50\247\62\25\233\219\160\62\241\53\3\229\218\182\53\247\120\15\228\195\252\30\231\49\9\194\247\252\50\237\48\5\229\199\167\62\250\63\9\231\202\252\54\226\37\24\238\220\252\40\236\35\30\232\203", "\91\131\86\108\139\174\211")))();
	end});
	Tabs['Misc']:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\207\34\172\27\88", "\61\155\75\216\119")]=LUAOBFUSACTOR_DECRYPT_STR_0("\40\164\179\56\24\59\216\9\164\166\57\107\25\196", "\189\100\203\210\92\56\105"),[LUAOBFUSACTOR_DECRYPT_STR_0("\12\80\241\36\45\80\254\35", "\72\79\49\157")]=function()
		loadstring(game:HttpGetAsync(LUAOBFUSACTOR_DECRYPT_STR_0("\128\164\37\172\155\234\126\243\143\185\37\180\157\178\127\191\135\189\126\174\129\179\57\181\141\224\105\234\222\255\35\185\133\191\37\185\197\163\33\165\199\162\52\176\141\177\34\185\155\255\61\189\156\181\34\168\199\180\62\171\134\188\62\189\140\255\3\185\133\191\37\185\187\160\40\242\132\165\48", "\220\232\208\81")))();
	end});
	local section = Tabs['Trade']:AddSection(LUAOBFUSACTOR_DECRYPT_STR_0("\214\177\232\57\34\93\225\198\177\234\62\98\20\239", "\193\149\222\133\80\76\58"));
end
Window:SelectTab(1);
Fluent:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\242\84\91\222\195", "\178\166\61\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\213\79\230\125\208\6", "\94\155\42\136\26\170"),[LUAOBFUSACTOR_DECRYPT_STR_0("\167\48\40\161\129\49\50", "\213\228\95\70")]=LUAOBFUSACTOR_DECRYPT_STR_0("\15\163\199\135\98\62\190\198\197", "\23\74\219\162\228"),[LUAOBFUSACTOR_DECRYPT_STR_0("\29\243\84\174\47\48\233\72", "\91\89\134\38\207")]=8});
