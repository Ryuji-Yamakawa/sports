// Y座標の構造体

import Foundation
import SpriteKit

struct SYPosition {
    
    var gameHeight : Int = 960
    var upperAdSpace : Int = 0
    var center : Int = 480
    
    var parts : [[CGFloat]] = []
    
    
    // デバイスの有効高さからY座標を設定
    init(aHeight : Int, aDevice : eDevice) {
        gameHeight = aHeight
        center = gameHeight / 2
        
        switch aDevice {
        case .iPhone9_16:
            upperAdSpace = 0
        case .iPhoneX:
            upperAdSpace = eGameSize.WIDTH / 4  // 要調整 
        case .iPad:
            upperAdSpace = eGameSize.WIDTH / 8  // 要調整
        }
        
        for i in 0 ... 14 {
            var result : [CGFloat] = []
            for k in 0 ... i {
                if i == 0 {
                    result.append(CGFloat(gameHeight - upperAdSpace))
                }
                else {
                    result.append(CGFloat((gameHeight - upperAdSpace) / (i * 2) * (1 + (k - 1) * 2)))
                }
            }
            parts.append(result)
        }
    }
}
