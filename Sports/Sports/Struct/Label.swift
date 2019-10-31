// LabelNodeを作るための構造体

import SpriteKit

struct sLabel {
    var family      : String  = eFont.BUTTON.family()
    var name        : String  = ""
    var color       : UIColor = eFont.BUTTON.color()
    var size        : CGFloat = eFont.BUTTON.size()
    var xyPosition  : CGPoint = CGPoint(x: 0, y: 0)
    var zPosition   : CGFloat = eZPosition.BUTTON
    var alpha       : CGFloat = 1.0
    var hidden      : Bool    = false
    var text        : String  = ""
    var horizontalAlignmentMode : SKLabelHorizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    var verticalAlignmentMode : SKLabelVerticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    
    func node() -> SKLabelNode {
            let result = SKLabelNode( fontNamed: self.family )
            result.name         = self.name
            result.fontColor    = self.color
            result.fontSize     = self.size
            result.position     = self.xyPosition
            result.zPosition    = self.zPosition
            result.alpha        = self.alpha
            result.isHidden     = self.hidden
            result.text         = self.text
            result.horizontalAlignmentMode = self.horizontalAlignmentMode
            result.verticalAlignmentMode = self.verticalAlignmentMode
        return result
    }
}
