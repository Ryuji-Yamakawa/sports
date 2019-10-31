// LabelNodeを作るための構造体

import SpriteKit

struct sLabel {
    var name        : String  = ""
    var family      : String  = eFont.BUTTON.family()
    var color       : UIColor = eFont.BUTTON.color()
    var size        : CGFloat = eFont.BUTTON.size()
    var xyPosition  : CGPoint = CGPoint(x: 0, y: 0)
    var zPosition   : CGFloat = eZPosition.BUTTON
    var alpha       : CGFloat = 1.0
    var hidden      : Bool    = false
    var horizontalAlignmentMode : SKLabelHorizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    var verticalAlignmentMode : SKLabelVerticalAlignmentMode = SKLabelVerticalAlignmentMode.center
}
