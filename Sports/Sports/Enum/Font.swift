// 文字に関する定数

import Foundation
import SpriteKit

enum eFont : Int {
    case BUTTON = 1
    case MENU = 2
    
    func family() -> String {
        switch self {
            case .BUTTON: return "ArialMT"
            case .MENU:   return "ArialMT"
        }
    }
    
    func size() -> CGFloat {
        switch self {
            case .BUTTON: return CGFloat(eGameSize.WIDTH / 30)
            case .MENU:   return CGFloat(eGameSize.WIDTH / 30)
        }
    }
    
    func color() -> UIColor {
        switch self {
            case .BUTTON: return UIColor(red: 0.200, green: 0.200, blue: 0.200, alpha: 1.0)
            case .MENU:   return UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.0)
        }
    }
}
