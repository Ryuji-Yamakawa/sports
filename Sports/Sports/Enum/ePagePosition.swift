// ページの場所の列挙型

import SpriteKit

enum ePagePosition : Int {
    case CENTER   = 1
    case LEFT     = 2
    case RIGHT    = 3
    case UPPER    = 5
    case UNDER    = 6
    
    func distanceX(aXposition : SXPosition) -> CGFloat {
        switch self {
        case .CENTER:
            return 0
        case .LEFT:
            return CGFloat(aXposition.gameWidth * (-1))
        case .RIGHT:
            return CGFloat(aXposition.gameWidth)
        case .UPPER:
            return 0
        case .UNDER:
            return 0
        }
    }
    
    func distanceY(aYposition : SYPosition) -> CGFloat {
        switch self {
        case .CENTER:
            return 0
        case .LEFT:
            return 0
        case .RIGHT:
            return 0
        case .UPPER:
            return CGFloat(aYposition.gameHeight)
        case .UNDER:
            return CGFloat(aYposition.gameHeight * (-1))
        }
    }
}
