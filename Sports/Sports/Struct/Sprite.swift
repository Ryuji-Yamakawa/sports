// SpriteNodeを作るための構造体

import SpriteKit

struct sSprite {
    var name          : String  = ""
    var imgName       : String  = ""
    var xyPosition    : CGPoint = CGPoint(x: 0, y: 0)
    var zPosition     : CGFloat = eZPosition.BUTTON
    var alpha         : CGFloat = 1.0
    var anchorPoint   : CGPoint = CGPoint(x: 0.5, y: 0.5)
    var xScale        : CGFloat = 1.0
    var hidden        : Bool    = false
}
