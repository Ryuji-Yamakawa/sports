// アプリのホーム画面

import SpriteKit

class Home {
    
    var homeButton : HomeButton!
    
    var pageParts : [PageParts] = []
    
    var skScene : SKScene!
    var sXPosition : SXPosition!
    var sYPosition : SYPosition!
    
    init (aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        skScene = aSKScene
        sXPosition = aXPosition
        sYPosition = aYPosition
        
        pageParts.append(HomeButton(aSKScene: skScene, aXPosition: sXPosition, aYPosition: sYPosition))
    }
    
    // スワイプ
    func swipe(aTouch : STouch ){
        if pageParts.count == 0 { return }
        // 上下左右にスワイプしているとき
        if aTouch.dragDirec != .NONE {
            // 追従する
            for i in 0 ... pageParts.count - 1 {
                pageParts[i].swipe(aTouch: aTouch)
            }
        }
    }
}
