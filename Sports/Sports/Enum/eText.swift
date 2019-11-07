// テキストの列挙型

import SpriteKit

enum eText : Int {
    case SOCCER   = 1
    case BASKET   = 2
    case STRETCH1 = 3
    case STRETCH2 = 4
    case STRETCH3 = 5
    case STRETCH4 = 6
    case BACK     = 7
    
    case UNDERMAKING = 99
    
    func string() -> String {
        switch self {
        case .SOCCER:
            return "サッカー"
        case .BASKET:
            return "バスケット"
        case .STRETCH1:
            return "ストレッチ1"
        case .STRETCH2:
            return "ストレッチ2"
        case .STRETCH3:
            return "ストレッチ3"
        case .STRETCH4:
            return "ストレッチ4"
        case .BACK:
            return "もどる"
            
        case .UNDERMAKING:
            return "（作成中）"
        }
    }
}
