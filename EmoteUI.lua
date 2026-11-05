local a=game:GetService('Players')local b=game:GetService('ReplicatedStorage')local c=game:
GetService('UserInputService')local d=game:GetService('TweenService')local function safeRequire(e,f
)f=f or 5 local function resolve(g)if typeof(g)=='Instance'then return g end if type(g)~='string'
then return nil,'expected Instance or string, got '..typeof(g)end if g:find('%.')then local h=game:
GetService('ReplicatedStorage')for i in g:gmatch('[^%.]+')do if not h then return nil,
"path broke at '"..i.."'"end h=h:FindFirstChild(i)or h:WaitForChild(i,f)end if not h then return
nil,"could not resolve '"..g.."'"end return h end local h=game:GetService('ReplicatedStorage')local
i=h:FindFirstChild(g)or h:WaitForChild(g,f)if not i then return nil,"'"..g..
"' not found in ReplicatedStorage"end return i end local g,h=resolve(e)if not g then warn(
'[safeRequire] '..h)return nil,h end local i,j=pcall(require,g)if not i then local k=tostring(j)
warn('[safeRequire] failed to require '..g:GetFullName()..': '..k)return nil,k end return j end
local e=safeRequire(b:WaitForChild('Emotes'):WaitForChild('EmotesDatabase'))local f=b:WaitForChild(
'Animations')local g=a.LocalPlayer local h={Text=Color3.fromRGB(245,246,248),White=Color3.new(1,1,1
),Muted=Color3.fromRGB(135,141,151),Outline=Color3.fromRGB(46,48,55),Green=Color3.fromRGB(87,242,
135),Red=Color3.fromRGB(237,66,69),Accent=Color3.fromRGB(114,137,218)}local i={MainTop=Color3.
fromRGB(22,23,27),MainBottom=Color3.fromRGB(11,12,14),HeaderTop=Color3.fromRGB(21,22,26),
HeaderBottom=Color3.fromRGB(17,18,21),RowLeft=Color3.fromRGB(46,50,58),RowRight=Color3.fromRGB(20,
22,26),RowHoverLeft=Color3.fromRGB(68,74,86),RowHoverRight=Color3.fromRGB(34,38,45)}local j=
ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(120,130,150)),ColorSequenceKeypoint.
new(0.5,Color3.fromRGB(245,246,248)),ColorSequenceKeypoint.new(1,Color3.fromRGB(120,130,150))})
local k=280 local l=44 local m=320 local n=l local o=10 local p=8 local function new(q,r,s)local t=
Instance.new(q)for u,v in pairs(r)do t[u]=v end t.Parent=s return t end local function corner(q,r)
return new('UICorner',{CornerRadius=UDim.new(0,r)},q)end local function gradient(q,r,s,t)return
new('UIGradient',{Color=ColorSequence.new(r,s),Rotation=t or 0},q)end local function tween(q,r,s,t,
u)local v=d:Create(q,TweenInfo.new(r,t or Enum.EasingStyle.Quad,u or Enum.EasingDirection.Out),s)v:
Play()return v end local function lerpColor(q,r,s)return Color3.new(q.R+(r.R-q.R)*s,q.G+(r.G-q.G)*s
,q.B+(r.B-q.B)*s)end local function tweenGradientColor(q,r,s)local t=q.Color local u=t.Keypoints
local v=s.Keypoints local w=os.clock()task.spawn(function()while true do local x=os.clock()-w local
y=math.clamp(x/r,0,1)local z=1-(1-y)*(1-y)local A={}for B=1,math.min(#u,#v)do A[B]=
ColorSequenceKeypoint.new(v[B].Time,lerpColor(u[B].Value,v[B].Value,z))end q.Color=ColorSequence.
new(A)if y>=1 then break end task.wait()end end)end local q,r local s,t,u local v={}local function 
stopCurrent()if q then q:Stop(0.1)q=nil end if r then r:Destroy()r=nil end end local function 
playEmote(w)if not s or not s.Parent or not t or not t.Parent or not u then return end stopCurrent(
)local x=w.EmoteInstance if x:IsA('Animation')then q=u:LoadAnimation(x)q.Looped=true q.Priority=
Enum.AnimationPriority.Action4 q:Play(0.1)elseif x:IsA('Tool')then r=x:Clone()r.Parent=s t:
EquipTool(r)local y=r:GetAttribute('EquipAnimation')if y then local z=f:FindFirstChild(y)if z then
q=u:LoadAnimation(z)q.Looped=true q.Priority=Enum.AnimationPriority.Action4 q:Play(0.1)end end end
end local function bindCharacter(w)stopCurrent()for x,y in ipairs(v)do y:Disconnect()end v={}s=w t=
s:WaitForChild('Humanoid')u=t:WaitForChild('Animator')table.insert(v,t.Running:Connect(function(x)
if x>1 then stopCurrent()end end))table.insert(v,t.Jumping:Connect(stopCurrent))end if g.Character
then bindCharacter(g.Character)end g.CharacterAdded:Connect(bindCharacter)local function 
getAllEmotes()local w={}for x=1,100 do local y,z=pcall(e.GetEmoteData,'E'..x)if y and z then table.
insert(w,z)elseif x>5 then break end end return w end local function bindCharacter(w)stopCurrent()
for x,y in ipairs(v)do y:Disconnect()end v={}s=w t=s:WaitForChild('Humanoid')u=t:WaitForChild(
'Animator')table.insert(v,t.Running:Connect(function(x)if x>1 then stopCurrent()end end))table.
insert(v,t.Jumping:Connect(stopCurrent))end if g.Character then bindCharacter(g.Character)end g.
CharacterAdded:Connect(bindCharacter)local w=getAllEmotes()local x=new('ScreenGui',{Name='EmoteGUI'
,ResetOnSpawn=false,DisplayOrder=2147483647,IgnoreGuiInset=true,Enabled=false},g:WaitForChild(
'PlayerGui'))local y=new('Frame',{Name='MainFrame',Size=UDim2.new(0,k,0,m),Position=UDim2.new(0.5,-
k/2,0.5,-m/2),BackgroundColor3=h.White,BorderSizePixel=0,ClipsDescendants=true,Active=true},x)
corner(y,10)gradient(y,i.MainTop,i.MainBottom,90)local z=new('UIStroke',{Color=h.Outline,Thickness=
1.5,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},y)local A=new('Frame',{Size=UDim2.new(1,0,0,l),
BackgroundColor3=h.White,BorderSizePixel=0},y)corner(A,10)gradient(A,i.HeaderTop,i.HeaderBottom,90)
new('Frame',{Position=UDim2.new(0,0,1,-10),Size=UDim2.new(1,0,0,10),BackgroundColor3=i.HeaderBottom
,BorderSizePixel=0},A)local B=new('TextLabel',{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.new(1,-80,
0,20),Position=UDim2.new(0,16,0.5,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=
'Emotes',TextColor3=h.Text,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left},A)local C=new(
'TextButton',{AnchorPoint=Vector2.new(1,0.5),Size=UDim2.new(0,24,0,24),Position=UDim2.new(1,-14,0.5
,0),BackgroundColor3=h.White,BorderSizePixel=0,Text='',AutoButtonColor=false},A)corner(C,6)local D=
gradient(C,i.RowLeft,i.RowRight,0)local E=new('UIStroke',{Color=h.White,Thickness=1,Transparency=1,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border},C)local F=new('UIGradient',{Color=j,Offset=Vector2.
new(-1,0)},E)new('UIStroke',{Color=h.Outline,Thickness=1,ApplyStrokeMode=Enum.ApplyStrokeMode.
Border},C)local G=new('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.new(0,10,0,2),Position=
UDim2.new(0.5,0,0.5,0),BackgroundColor3=h.Text,BorderSizePixel=0},C)corner(G,1)local H=false local
I local function stopMinSweep()H=false if I then task.cancel(I)I=nil end F.Offset=Vector2.new(-1,0)
end local function startMinSweep()if H then return end H=true I=task.spawn(function()while H do
local J=d:Create(F,TweenInfo.new(0.9,Enum.EasingStyle.Linear),{Offset=Vector2.new(1,0)})J:Play()J.
Completed:Wait()if not H then break end F.Offset=Vector2.new(-1,0)end end)end C.MouseEnter:Connect(
function()tweenGradientColor(D,0.15,ColorSequence.new(i.RowHoverLeft,i.RowHoverRight))tween(E,0.22,
{Transparency=0,Thickness=2})startMinSweep()end)C.MouseLeave:Connect(function()tweenGradientColor(D
,0.15,ColorSequence.new(i.RowLeft,i.RowRight))tween(E,0.22,{Transparency=1,Thickness=1})
stopMinSweep()end)local J=new('Frame',{Position=UDim2.new(0,0,0,l-1),Size=UDim2.new(1,0,0,1),
BackgroundColor3=Color3.fromRGB(60,63,71),BorderSizePixel=0},y)new('UIGradient',{Transparency=
NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0),
NumberSequenceKeypoint.new(1,1)})},J)local K=new('ScrollingFrame',{Size=UDim2.new(1,-o*2,1,-l-12),
Position=UDim2.new(0,o,0,l+6),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,
ScrollBarImageColor3=h.Outline,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize
.Y},y)new('UIListLayout',{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},K)new(
'UIPadding',{PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8),PaddingRight=UDim.new(0,p),
PaddingLeft=UDim.new(0,2)},K)for L,M in ipairs(w)do local N=new('TextButton',{Size=UDim2.new(1,0,0,
34),BackgroundColor3=h.White,BorderSizePixel=0,Text='',AutoButtonColor=false,LayoutOrder=L,
ClipsDescendants=false},K)corner(N,6)local O=new('UIGradient',{Color=ColorSequence.new(i.RowLeft,i.
RowRight),Rotation=0},N)local P=new('UIStroke',{Color=h.White,Thickness=1,Transparency=1,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border},N)local Q=new('UIGradient',{Color=j,Offset=Vector2.
new(-1,0)},P)new('TextLabel',{Size=UDim2.new(0,40,1,0),Position=UDim2.new(0,12,0,0),
BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=M.Id,TextColor3=h.Accent,TextSize=12,
TextXAlignment=Enum.TextXAlignment.Left},N)new('TextLabel',{Size=UDim2.new(1,-62,1,0),Position=
UDim2.new(0,54,0,0),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text=M.Name,TextColor3=h.Text,
TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd},N)local R
=false local S local function stopSweep()R=false if S then task.cancel(S)S=nil end Q.Offset=Vector2
.new(-1,0)end local function startSweep()if R then return end R=true S=task.spawn(function()while R
do local T=d:Create(Q,TweenInfo.new(0.9,Enum.EasingStyle.Linear),{Offset=Vector2.new(1,0)})T:Play()
T.Completed:Wait()if not R then break end Q.Offset=Vector2.new(-1,0)end end)end N.MouseEnter:
Connect(function()tweenGradientColor(O,0.18,ColorSequence.new(i.RowHoverLeft,i.RowHoverRight))
tween(P,0.22,{Transparency=0,Thickness=2})startSweep()end)N.MouseLeave:Connect(function()
tweenGradientColor(O,0.18,ColorSequence.new(i.RowLeft,i.RowRight))tween(P,0.22,{Transparency=1,
Thickness=1})stopSweep()end)N.MouseButton1Click:Connect(function()playEmote(M)end)end local L,M,N A
.InputBegan:Connect(function(O)if O.UserInputType==Enum.UserInputType.MouseButton1 or O.
UserInputType==Enum.UserInputType.Touch then L=true M=O.Position N=y.Position O.Changed:Connect(
function()if O.UserInputState==Enum.UserInputState.End then L=false end end)end end)c.InputChanged:
Connect(function(O)if L and(O.UserInputType==Enum.UserInputType.MouseMovement or O.UserInputType==
Enum.UserInputType.Touch)then local P=O.Position-M y.Position=UDim2.new(N.X.Scale,N.X.Offset+P.X,N.
Y.Scale,N.Y.Offset+P.Y)end end)local O=false local function setMinimized(P)if O==P then return end
O=P if P then J.Visible=false K.Visible=false local Q=y.Position.Y.Offset+((y.Size.Y.Offset-n)/2)
tween(y,0.28,{Size=UDim2.new(0,k,0,n),Position=UDim2.new(y.Position.X.Scale,y.Position.X.Offset,y.
Position.Y.Scale,Q)},Enum.EasingStyle.Back,Enum.EasingDirection.Out)tween(G,0.25,{Rotation=180})
else J.Visible=true K.Visible=true local Q=y.Position.Y.Offset-((m-n)/2)tween(y,0.28,{Size=UDim2.
new(0,k,0,m),Position=UDim2.new(y.Position.X.Scale,y.Position.X.Offset,y.Position.Y.Scale,Q)},Enum.
EasingStyle.Back,Enum.EasingDirection.Out)tween(G,0.25,{Rotation=0})end end C.MouseButton1Click:
Connect(function()setMinimized(not O)end)local P=false local function openUI()if P then return end
if x.Enabled then return end x.Enabled=true y.Size=UDim2.new(0,0,0,0)y.Position=UDim2.new(0.5,0,0.5
,0)y.BackgroundTransparency=1 z.Transparency=1 tween(y,0.4,{Size=UDim2.new(0,k,0,O and n or m),
Position=UDim2.new(0.5,-k/2,0.5,-(O and n or m)/2),BackgroundTransparency=0},Enum.EasingStyle.Back,
Enum.EasingDirection.Out)tween(z,0.3,{Transparency=0})end local function closeUI()if P then return
end P=true stopCurrent()local Q=tween(y,0.28,{Size=UDim2.new(0,k,0,0),Position=UDim2.new(y.Position
.X.Scale,y.Position.X.Offset,y.Position.Y.Scale,y.Position.Y.Offset+(y.Size.Y.Offset/2)),
BackgroundTransparency=1},Enum.EasingStyle.Back,Enum.EasingDirection.In)tween(z,0.2,{Transparency=1
},Enum.EasingStyle.Quad,Enum.EasingDirection.In)Q.Completed:Wait()x.Enabled=false x:Destroy()end
task.spawn(function()while task.wait(0.05)do if not x or not x.Parent then break end local Q=
getgenv().EmoteUiEnabled if Q then if not x.Enabled then P=false openUI()end else if x.Enabled then
stopCurrent()x.Enabled=false end end end end)openUI()
