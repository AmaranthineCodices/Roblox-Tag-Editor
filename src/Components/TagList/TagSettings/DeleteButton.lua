local Modules = script.Parent.Parent.Parent.Parent.Parent
local Roact = require(Modules.Roact)
local e = Roact.createElement

local Button = require(Modules.Plugin.Components.Button)

local DeleteButton = Roact.PureComponent:extend("DeleteButton")

function DeleteButton:init()
    self.state = {
        confirming = false
    }
end

function DeleteButton:render()
    return e(Button, {
        Text = self.state.confirming and "Confirm?" or "Delete",
        Size = self.props.Size,
        Position = self.props.Position,
        LayoutOrder = self.props.LayoutOrder,
        BorderColor3 = Color3.new(1, 0, 0),

        leftClick = function()
            if self.state.confirming then
                self.props.leftClick()
            else
                self:setState({
                    confirming = true
                })
            end
        end,
    })
end

return DeleteButton