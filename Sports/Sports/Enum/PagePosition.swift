// ページの場所の列挙型

import SpriteKit

enum ePagePosition : Int {
    case CENTER   = 1
    case LEFT     = 2
    case RIGHT    = 3
    case UPPER    = 5
    case UNDER    = 6
    
    func distance(aXposition : SXPosition, aYposition : SYPosition) -> CGFloat {
        switch self {
        case .CENTER:
            return 0
        case .LEFT:
            return CGFloat(aXposition.gameWidth * (-1))
        case .RIGHT:
            return CGFloat(aXposition.gameWidth)
        case .UPPER:
            return CGFloat(aYposition.gameHeight)
        case .UNDER:
            return CGFloat(aYposition.gameHeight * (-1))
        }
    }
}
