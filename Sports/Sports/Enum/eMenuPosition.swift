// メニューボタンの場所の列挙型

import SpriteKit

enum eMenuPosition : Int {
    case LEFTOUT  = 1
    case LEFT     = 2
    case CENTER   = 3
    case RIGHT    = 4
    case RIGHTOUT = 5
    
    func position(aXposition : SXPosition) -> CGFloat {
        switch self {
        case .LEFTOUT   : return aXposition.menuLeftOut
        case .LEFT      : return aXposition.menuLeft
        case .CENTER    : return aXposition.center
        case .RIGHT     : return aXposition.menuRight
        case .RIGHTOUT  : return aXposition.menuRightOut
        }
    }
}
