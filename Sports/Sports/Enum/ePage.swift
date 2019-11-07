// ページいの列挙型

enum ePage : Int {
    case NONE       = 0
    case HOME       = 1
    case SOCCER     = 2
    case BASKET     = 3
    case TIMECOUNT  = 4
    
    func xPosition() -> Int {
        switch self {
        case .NONE:
            return 0
        case .HOME:
            return 1
        case .SOCCER:
            return 2
        case .BASKET:
            return 2
        case .TIMECOUNT:
            return 3
        }
    }
}
