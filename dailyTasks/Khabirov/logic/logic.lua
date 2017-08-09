function requireModule(path)
  return require('logic.' .. path)
end

class = requireModule('Libs.middleclass')
CONSTANTS = requireModule('constants')
requireModule('Libs.accessory')

Description = requireModule('Types.Description')
Sprite = requireModule('Types.Sprite')
Object = requireModule('Types.Object')

Connector = requireModule('Types.Connector.Connector')
Input = requireModule('Types.Connector.Input')
Output = requireModule('Types.Connector.Output')
VirtualOutput = requireModule('Types.Connector.VirtualOutput')

Element = requireModule('Types.Element.Element')
And = requireModule('Types.Element.And')
Or = requireModule('Types.Element.Or')
Generator = requireModule('Types.Element.Generator')
Action = requireModule('Types.Element.Action')

Scheme = requireModule('Types.Scheme.Scheme')
Point = requireModule('Types.Editor.Point')
Editor = requireModule('Types.Editor.Editor')