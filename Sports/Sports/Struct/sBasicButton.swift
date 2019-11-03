// 普通のボタン1つの構造体

import SpriteKit

struct SBasicButton {
    var name : String = ""
    var family : String  = eFont.BUTTON.family()
    var size : CGFloat = eFont.BUTTON.size()
    var color : UIColor = eFont.BUTTON.color()
    var text  : String  = ""
    var baseImg : String = ""
    var touchImg : String = ""
    var xyPosition : CGPoint = CGPoint()
    var zPosition : CGFloat = eZPosition.BUTTON
}

