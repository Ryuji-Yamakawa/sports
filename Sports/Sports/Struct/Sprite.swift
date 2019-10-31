// SpriteNodeを作るための構造体

import SpriteKit

struct SSprite {
    var imgName       : String  = ""
    var name          : String  = ""
    var xyPosition    : CGPoint = CGPoint(x: 0, y: 0)
    var zPosition     : CGFloat = eZPosition.BUTTON
    var alpha         : CGFloat = 1.0
    var hidden        : Bool    = false
    var anchorPoint   : CGPoint = CGPoint(x: 0.5, y: 0.5)
    var xScale        : CGFloat = 1.0
    
    func node() -> SKSpriteNode {
        let result          = SKSpriteNode( imageNamed: self.imgName )
        result.name         = self.name
        result.position     = self.xyPosition
        result.zPosition    = self.zPosition
        result.alpha        = self.alpha
        result.isHidden     = self.hidden
        result.anchorPoint  = self.anchorPoint
        result.xScale       = self.xScale
        return result
    }
}
