// X座標の構造体

import Foundation
import SpriteKit

struct SXPosition {
    
    var gameWidth : Int = 540
    var center : Int = 270
    
    var parts : [[CGFloat]] = []
    
    
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
    }
    
    
}
