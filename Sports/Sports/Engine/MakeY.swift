//  Yポジションを作成する

import Foundation
import SpriteKit

class MakeY {
    func get() -> sYPosition {
        
        var gameHeight : Int = eGameSize.HEIGHT
        var device : eDevice = .iPhone9_16
        
        // 端末を取得する
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
            // iPhoneの場合
            // アスペクト比を計算
            let width : CGFloat = UIScreen.main.nativeBounds.width
            let height : CGFloat = UIScreen.main.nativeBounds.height
            let aspect : CGFloat = height / width
            
            // アスペクト比で分ける
            if aspect >= 1.8 {
                // iPhoneXなど縦長
                print("MakeY iPhoneX width:",width,"、height:",height,"、aspect:",aspect)
                device = .iPhoneX
                gameHeight = Int(CGFloat(eGameSize.WIDTH) * aspect)
            }
            else {
                // 9:16のiPhone
                print("MakeY iPhone9_16 width:",width,"、height:",height,"、aspect:",aspect)
                device = .iPhone9_16
            }
        }
        else if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            // iPadの場合
            print("MakeY iPad")
            device = .iPad
        }
        else {
            // 該当なしのエラー
            print("MakeY 判別エラー")
        }
        return sYPosition(aHeight : gameHeight, aDevice : device)
    }
}
