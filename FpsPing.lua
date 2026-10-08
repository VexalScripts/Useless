if not IB_OBFUSCATED then IB_NO_VIRTUALIZE=function(a)return a end IB_ENCSTR=function(a)return a
end IB_INLINE=function(a)return a end IB_CRASH=function()print('ib_crash() called')end IB_LINE=1
end local a,b,c,d=game:GetService('Players'),game:GetService('RunService'),game:GetService(
'TweenService'),game:GetService('UserInputService')local e=a.LocalPlayer getgenv().FpsPingFrame=
true local f if gethui then f=gethui()elseif syn and syn.protect_gui then f=Instance.new('Folder')
syn.protect_gui(f)f.Parent=game:GetService('CoreGui')else f=e:WaitForChild('PlayerGui')end local g=
Instance.new('ScreenGui')g.Name='StatsGui'g.ResetOnSpawn=false g.Enabled=getgenv().FpsPingFrame g.
Parent=f local h=Instance.new('Frame')h.Name='StatsFrame'h.Size=UDim2.new(0,180,0,42)h.Position=
UDim2.new(0.05,0,0.05,0)h.BackgroundColor3=Color3.fromRGB(43,45,49)h.BorderSizePixel=0 h.Active=
true h.Parent=g local i=Instance.new('UICorner')i.CornerRadius=UDim.new(0,8)i.Parent=h local j=
Instance.new('UIStroke')j.Color=Color3.fromRGB(30,31,34)j.Thickness=1.5 j.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border j.Parent=h local k=Instance.new('UIShadow')k.BlurRadius=UDim.new(0,10)k.
Color=Color3.fromRGB(0,0,0)k.Transparency=0.55 k.Offset=UDim2.new(0,0,0,3)k.Parent=h local l=
Instance.new('TextLabel')l.Size=UDim2.new(1,0,1,0)l.BackgroundTransparency=1 l.Font=Enum.Font.
GothamBold l.TextSize=13 l.TextColor3=Color3.fromRGB(242,243,245)l.Text='FPS: -- | Ping: -- ms'l.
RichText=true l.Parent=h local m,n,o=false local p=h.Position h.InputBegan:Connect(function(q)
IB_NO_VIRTUALIZE(function()if q.UserInputType==Enum.UserInputType.MouseButton1 or q.UserInputType==
Enum.UserInputType.Touch then m=true n=q.Position o=h.Position q.Changed:Connect(function()if q.
UserInputState==Enum.UserInputState.End then m=false end end)end end)()end)d.InputChanged:Connect(
function(q)IB_NO_VIRTUALIZE(function()if m and(q.UserInputType==Enum.UserInputType.MouseMovement or
q.UserInputType==Enum.UserInputType.Touch)then local r=q.Position-n p=UDim2.new(o.X.Scale,o.X.
Offset+r.X,o.Y.Scale,o.Y.Offset+r.Y)end end)()end)local q,r=0,os.clock()b.RenderStepped:Connect(
function(s)IB_NO_VIRTUALIZE(function()g.Enabled=not not getgenv().FpsPingFrame if not g.Enabled
then return end h.Position=h.Position:Lerp(p,s*14)q=q+1 local t=os.clock()if t-r>=0.5 then local u=
math.floor(q/(t-r)+0.5)local v=math.floor(e:GetNetworkPing()*2000+0.5)l.Text=string.format(
[[FPS: <font color="#57F287">%d</font>  |  Ping: <font color="#00A8FC">%d ms</font>]],u,v)q=0 r=t
end end)()end)
