// 文字に関する列挙型

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
            case .MENU:   return CGFloat(eGameSize.WIDTH / 23)
        }
    }
    
    func color() -> UIColor {
        switch self {
            case .BUTTON: return UIColor(red: 0.200, green: 0.200, blue: 0.200, alpha: 1.0)
            case .MENU:   return UIColor(red: 0.900, green: 0.900, blue: 0.900, alpha: 1.0)
        }
    }
}
