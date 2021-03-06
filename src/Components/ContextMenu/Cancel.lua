local Modules = script.Parent.Parent.Parent.Parent
local Roact = require(Modules.Roact)
local Constants = require(Modules.Plugin.Constants)

local Item = require(script.Parent.Item)

local function Cancel(props)
	local newProps = {
		First = true,
		Last = true,

		[Roact.Event.MouseButton1Click] = function(rbx)
			if props.OnClose then
				props.OnClose()
			end
		end,
	}
	local blacklist = {
		OnClose = true,
		Text = true,
	}
	for k,v in pairs(props) do
		if not blacklist[k] then
			newProps[k] = v
		end
	end
	return Roact.createElement(Item, newProps, {
		Label = Roact.createElement("TextLabel", {
			Text = props.Text or "Cancel",
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1.0,
			TextSize = 19,
			Font = Enum.Font.SourceSansSemibold,
			TextColor3 = Constants.Black,
		})
	})
end

return Cancel
