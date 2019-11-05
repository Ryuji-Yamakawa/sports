// ストレッチゲーム

import SpriteKit

class Stretch {
    
    var stretchBg : StretchBg!
    var home : Home!
    var sStretchControl : SStretchControl = SStretchControl()
    
    init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        stretchBg   = StretchBg(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
        home        = Home(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
    }
    
    func setTouch(aTouch : STouch, aGameControl : SGameControl) -> SGameControl {
        var sGameControl = aGameControl
        
        switch sStretchControl.pageNow {
        case .NONE:
            print("Stretchエラー setTouch")
        case .HOME:
            (sGameControl, sStretchControl) = home.setTouch(aTouch: aTouch, aGameControl: sGameControl, aStretchControl: sStretchControl)
            // checkTouchEndがtrueならactionTouchEndアクション
        case .SOCCER:
        print("Stretchエラー 作成中")
        case .BASKETBALL:
        print("Stretchエラー 作成中")
        case .TIMECOUNT:
        print("Stretchエラー 作成中")
        }
        
        
        return aGameControl
    }
}
