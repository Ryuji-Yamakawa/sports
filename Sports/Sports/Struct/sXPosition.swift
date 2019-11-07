// X座標の構造体

import Foundation
import SpriteKit

struct SXPosition {
    
    var gameWidth : Int = 540
    var center : CGFloat = 270
    
    var parts : [[CGFloat]] = []
    
    var menuLeftOut  : CGFloat = 0.0
    var menuLeft     : CGFloat = 0.0
    var menuRight    : CGFloat = 0.0
    var menuRightOut : CGFloat = 0.0
    
    init() {
        for i in 0 ... 10 {
            var result : [CGFloat] = []
            for k in 0 ... i {
                if i == 0 {
                    result.append(CGFloat(gameWidth))
                }
                else {
                    let contentWidth    : CGFloat = CGFloat(gameWidth)
                    let division        : CGFloat = CGFloat(i * 2)
                    let size            : CGFloat = CGFloat(1 + (k - 1) * 2)
                    let addValue        : CGFloat = contentWidth / division * size
                    result.append(addValue)
                }
            }
            parts.append(result)
        }
        
        menuLeftOut  = parts[4][1] * (-1)
        menuLeft     = parts[4][1]
        menuRight    = parts[4][4]
        menuRightOut = parts[4][4] + parts[4][1] * 2
    }
    
    
}
