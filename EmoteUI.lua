local a=game:GetService('Players')local b=game:GetService('ReplicatedStorage')local c=game:
GetService('UserInputService')local d=game:GetService('TweenService')local e=require(b:
WaitForChild('Emotes'):WaitForChild('EmotesDatabase'))local f=b:WaitForChild('Animations')local g=a
.LocalPlayer local h=g.Character or g.CharacterAdded:Wait()local i=h:FindFirstChildOfClass(
'Humanoid')local j=i:FindFirstChildOfClass('Animator')local k={Text=Color3.fromRGB(245,246,248),
White=Color3.new(1,1,1),Muted=Color3.fromRGB(135,141,151),Outline=Color3.fromRGB(46,48,55),Green=
Color3.fromRGB(87,242,135),Red=Color3.fromRGB(237,66,69),Accent=Color3.fromRGB(114,137,218)}local l
={MainTop=Color3.fromRGB(22,23,27),MainBottom=Color3.fromRGB(11,12,14),HeaderTop=Color3.fromRGB(21,
22,26),HeaderBottom=Color3.fromRGB(17,18,21),RowLeft=Color3.fromRGB(46,50,58),RowRight=Color3.
fromRGB(20,22,26),RowHoverLeft=Color3.fromRGB(68,74,86),RowHoverRight=Color3.fromRGB(34,38,45)}
local m=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(120,130,150)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(245,246,248)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(120,130,150))})local n=280 local o=44 local p=320 local q=o local r=10 local s=8 local 
function new(t,u,v)local w=Instance.new(t)for x,y in pairs(u)do w[x]=y end w.Parent=v return w end
local function corner(t,u)return new('UICorner',{CornerRadius=UDim.new(0,u)},t)end local function 
gradient(t,u,v,w)return new('UIGradient',{Color=ColorSequence.new(u,v),Rotation=w or 0},t)end local 
function tween(t,u,v,w,x)local y=d:Create(t,TweenInfo.new(u,w or Enum.EasingStyle.Quad,x or Enum.
EasingDirection.Out),v)y:Play()return y end local function lerpColor(t,u,v)return Color3.new(t.R+(u
.R-t.R)*v,t.G+(u.G-t.G)*v,t.B+(u.B-t.B)*v)end local function tweenGradientColor(t,u,v)local w=t.
Color local x=w.Keypoints local y=v.Keypoints local z=os.clock()task.spawn(function()while true do
local A=os.clock()-z local B=math.clamp(A/u,0,1)local C=1-(1-B)*(1-B)local D={}for E=1,math.min(#x,
#y)do D[E]=ColorSequenceKeypoint.new(y[E].Time,lerpColor(x[E].Value,y[E].Value,C))end t.Color=
ColorSequence.new(D)if B>=1 then break end task.wait()end end)end local t,u local function 
stopCurrent()if t then t:Stop(0.1)t=nil end if u then u:Destroy()u=nil end end local function 
playEmote(v)stopCurrent()local w=v.EmoteInstance if w:IsA('Animation')then t=j:LoadAnimation(w)t.
Looped=true t.Priority=Enum.AnimationPriority.Action4 t:Play(0.1)elseif w:IsA('Tool')then u=w:
Clone()u.Parent=h i:EquipTool(u)local x=u:GetAttribute('EquipAnimation')if x then local y=f:
FindFirstChild(x)if y then t=j:LoadAnimation(y)t.Looped=true t.Priority=Enum.AnimationPriority.
Action4 t:Play(0.1)end end end end local function getAllEmotes()local v={}for w=1,100 do local x,y=
pcall(e.GetEmoteData,'E'..w)if x and y then table.insert(v,y)elseif w>5 then break end end return v
end local v=getAllEmotes()local w=new('ScreenGui',{Name='EmoteGUI',ResetOnSpawn=false,DisplayOrder=
2147483647,IgnoreGuiInset=true,Enabled=false},g:WaitForChild('PlayerGui'))local x=new('Frame',{Name
='MainFrame',Size=UDim2.new(0,n,0,p),Position=UDim2.new(0.5,-n/2,0.5,-p/2),BackgroundColor3=k.White
,BorderSizePixel=0,ClipsDescendants=true,Active=true},w)corner(x,10)gradient(x,l.MainTop,l.
MainBottom,90)local y=new('UIStroke',{Color=k.Outline,Thickness=1.5,ApplyStrokeMode=Enum.
ApplyStrokeMode.Border},x)local z=new('Frame',{Size=UDim2.new(1,0,0,o),BackgroundColor3=k.White,
BorderSizePixel=0},x)corner(z,10)gradient(z,l.HeaderTop,l.HeaderBottom,90)new('Frame',{Position=
UDim2.new(0,0,1,-10),Size=UDim2.new(1,0,0,10),BackgroundColor3=l.HeaderBottom,BorderSizePixel=0},z)
local A=new('TextLabel',{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.new(1,-80,0,20),Position=UDim2.
new(0,16,0.5,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text='Emotes',TextColor3=k.Text,
TextSize=15,TextXAlignment=Enum.TextXAlignment.Left},z)local B=new('TextButton',{AnchorPoint=
Vector2.new(1,0.5),Size=UDim2.new(0,24,0,24),Position=UDim2.new(1,-14,0.5,0),BackgroundColor3=k.
White,BorderSizePixel=0,Text='',AutoButtonColor=false},z)corner(B,6)local C=gradient(B,l.RowLeft,l.
RowRight,0)local D=new('UIStroke',{Color=k.White,Thickness=1,Transparency=1,ApplyStrokeMode=Enum.
ApplyStrokeMode.Border},B)local E=new('UIGradient',{Color=m,Offset=Vector2.new(-1,0)},D)new(
'UIStroke',{Color=k.Outline,Thickness=1,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},B)local F=new(
'Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.new(0,10,0,2),Position=UDim2.new(0.5,0,0.5,0),
BackgroundColor3=k.Text,BorderSizePixel=0},B)corner(F,1)local G=false local H local function 
stopMinSweep()G=false if H then task.cancel(H)H=nil end E.Offset=Vector2.new(-1,0)end local 
function startMinSweep()if G then return end G=true H=task.spawn(function()while G do local I=d:
Create(E,TweenInfo.new(0.9,Enum.EasingStyle.Linear),{Offset=Vector2.new(1,0)})I:Play()I.Completed:
Wait()if not G then break end E.Offset=Vector2.new(-1,0)end end)end B.MouseEnter:Connect(function()
tweenGradientColor(C,0.15,ColorSequence.new(l.RowHoverLeft,l.RowHoverRight))tween(D,0.22,{
Transparency=0,Thickness=2})startMinSweep()end)B.MouseLeave:Connect(function()tweenGradientColor(C,
0.15,ColorSequence.new(l.RowLeft,l.RowRight))tween(D,0.22,{Transparency=1,Thickness=1})
stopMinSweep()end)local I=new('Frame',{Position=UDim2.new(0,0,0,o-1),Size=UDim2.new(1,0,0,1),
BackgroundColor3=Color3.fromRGB(60,63,71),BorderSizePixel=0},x)new('UIGradient',{Transparency=
NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0),
NumberSequenceKeypoint.new(1,1)})},I)local J=new('ScrollingFrame',{Size=UDim2.new(1,-r*2,1,-o-12),
Position=UDim2.new(0,r,0,o+6),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,
ScrollBarImageColor3=k.Outline,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize
.Y},x)new('UIListLayout',{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},J)new(
'UIPadding',{PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8),PaddingRight=UDim.new(0,s),
PaddingLeft=UDim.new(0,2)},J)for K,L in ipairs(v)do local M=new('TextButton',{Size=UDim2.new(1,0,0,
34),BackgroundColor3=k.White,BorderSizePixel=0,Text='',AutoButtonColor=false,LayoutOrder=K,
ClipsDescendants=false},J)corner(M,6)local N=new('UIGradient',{Color=ColorSequence.new(l.RowLeft,l.
RowRight),Rotation=0},M)local O=new('UIStroke',{Color=k.White,Thickness=1,Transparency=1,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border},M)local P=new('UIGradient',{Color=m,Offset=Vector2.
new(-1,0)},O)new('TextLabel',{Size=UDim2.new(0,40,1,0),Position=UDim2.new(0,12,0,0),
BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=L.Id,TextColor3=k.Accent,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left},M)new('TextLabel',{Size=UDim2.new(1,-62,1,0),Position=
UDim2.new(0,54,0,0),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text=L.Name,TextColor3=k.Text,
TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd},M)local Q
=false local R local function stopSweep()Q=false if R then task.cancel(R)R=nil end P.Offset=Vector2
.new(-1,0)end local function startSweep()if Q then return end Q=true R=task.spawn(function()while Q
do local S=d:Create(P,TweenInfo.new(0.9,Enum.EasingStyle.Linear),{Offset=Vector2.new(1,0)})S:Play()
S.Completed:Wait()if not Q then break end P.Offset=Vector2.new(-1,0)end end)end M.MouseEnter:
Connect(function()tweenGradientColor(N,0.18,ColorSequence.new(l.RowHoverLeft,l.RowHoverRight))
tween(O,0.22,{Transparency=0,Thickness=2})startSweep()end)M.MouseLeave:Connect(function()
tweenGradientColor(N,0.18,ColorSequence.new(l.RowLeft,l.RowRight))tween(O,0.22,{Transparency=1,
Thickness=1})stopSweep()end)M.MouseButton1Click:Connect(function()playEmote(L)end)end local K,L,M z
.InputBegan:Connect(function(N)if N.UserInputType==Enum.UserInputType.MouseButton1 or N.
UserInputType==Enum.UserInputType.Touch then K=true L=N.Position M=x.Position N.Changed:Connect(
function()if N.UserInputState==Enum.UserInputState.End then K=false end end)end end)c.InputChanged:
Connect(function(N)if K and(N.UserInputType==Enum.UserInputType.MouseMovement or N.UserInputType==
Enum.UserInputType.Touch)then local O=N.Position-L x.Position=UDim2.new(M.X.Scale,M.X.Offset+O.X,M.
Y.Scale,M.Y.Offset+O.Y)end end)i.Running:Connect(function(N)if N>1 then stopCurrent()end end)i.
Jumping:Connect(stopCurrent)local N=false local function setMinimized(O)if N==O then return end N=O
if O then I.Visible=false J.Visible=false local P=x.Position.Y.Offset+((x.Size.Y.Offset-q)/2)tween(
x,0.28,{Size=UDim2.new(0,n,0,q),Position=UDim2.new(x.Position.X.Scale,x.Position.X.Offset,x.
Position.Y.Scale,P)},Enum.EasingStyle.Back,Enum.EasingDirection.Out)tween(F,0.25,{Rotation=180})
else I.Visible=true J.Visible=true local P=x.Position.Y.Offset-((p-q)/2)tween(x,0.28,{Size=UDim2.
new(0,n,0,p),Position=UDim2.new(x.Position.X.Scale,x.Position.X.Offset,x.Position.Y.Scale,P)},Enum.
EasingStyle.Back,Enum.EasingDirection.Out)tween(F,0.25,{Rotation=0})end end B.MouseButton1Click:
Connect(function()setMinimized(not N)end)local O=false local function openUI()if O then return end
if w.Enabled then return end w.Enabled=true x.Size=UDim2.new(0,0,0,0)x.Position=UDim2.new(0.5,0,0.5
,0)x.BackgroundTransparency=1 y.Transparency=1 tween(x,0.4,{Size=UDim2.new(0,n,0,N and q or p),
Position=UDim2.new(0.5,-n/2,0.5,-(N and q or p)/2),BackgroundTransparency=0},Enum.EasingStyle.Back,
Enum.EasingDirection.Out)tween(y,0.3,{Transparency=0})end local function closeUI()if O then return
end O=true stopCurrent()local P=tween(x,0.28,{Size=UDim2.new(0,n,0,0),Position=UDim2.new(x.Position
.X.Scale,x.Position.X.Offset,x.Position.Y.Scale,x.Position.Y.Offset+(x.Size.Y.Offset/2)),
BackgroundTransparency=1},Enum.EasingStyle.Back,Enum.EasingDirection.In)tween(y,0.2,{Transparency=1
},Enum.EasingStyle.Quad,Enum.EasingDirection.In)P.Completed:Wait()w.Enabled=false w:Destroy()end
task.spawn(function()while w and w.Parent do local P=getgenv().EmoteUiEnabled if P and not w.
Enabled then O=false openUI()elseif not P and w.Enabled then stopCurrent()w.Enabled=false end task.
wait(0.1)end end)task.spawn(function()while task.wait(0.05)do if not w or not w.Parent then break
end local P=getgenv().EmoteUiEnabled if P then if not w.Enabled then O=false openUI()end else if w.
Enabled then stopCurrent()w.Enabled=false end end end end)openUI()
