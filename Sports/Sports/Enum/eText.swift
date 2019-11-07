// テキストの列挙型

import SpriteKit

enum eText : Int {
    case HOME     = 0
    case SOCCER   = 1
    case BASKET   = 2
    case TIMECOUNT = 3
    case STRETCH1 = 10
    case STRETCH2 = 11
    case STRETCH3 = 12
    case STRETCH4 = 13
    case BACK     = 7
    
    case UNDERMAKING = 99
    
    func string() -> String {
        switch self {
            case .HOME:
                return "ホーム"
            case .SOCCER:
                return "サッカー"
            case .BASKET:
                return "バスケット"
            case .TIMECOUNT:
                return "ストレッチ"
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
