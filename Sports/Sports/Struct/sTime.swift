//  時間の構造体

import SpriteKit

struct STime {
    let frame : CGFloat = 0.01
    let cell : Int = 8
    var basicLock : TimeInterval = 0.0
    
    init() {
        for i in 0 ... cell - 1 {
            basicLock += TimeInterval(CGFloat(cell - i) * frame)
        }
    }
}
