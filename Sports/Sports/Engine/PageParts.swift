// ページの背景やボタンの移動処理など

import SpriteKit

class PageParts : NodesManager {
    
    var pagePosition : ePagePosition = .CENTER
    
    // ボタンのタッチ画像を表示
    func shine(aTouch : STouch) {
        
        if sNodesExist() == false { return }
        
        hiddenAll(aHidden: true)
        
        if aTouch.stat == .END  { return }
        
        if aTouch.dragDirec != .NONE { return }
        
        let touchedNo : Int = nameToNo(aName: aTouch.nowN)
        
        if touchedNo == NAME_ERROR_NO { return }
        
        hiddenNode(aName: aTouch.nowN, aHidden: false)
    }
    
    // ページ移動する
    func pageChange(aDestination : ePagePosition, aXFlag : Bool, aInitFlag : Bool) {
        
        pagePosition = aDestination
        
        if sNodesExist() == false { return }
        for i in 0 ... sNodes.count - 1 {
            
            for k in 0 ... sNodes[i].nodes.count - 1 {
                
                var action = Array<SKAction>()
                var goal : CGFloat = 0.0
                var distance : Double = 0.0
                
                if aXFlag == true {
                    goal = sNodes[i].initPosition[k].x + aDestination.distance(aXposition: sXPosition, aYposition: sYPosition)
                    distance = Double(sNodes[i].nowPosition[k].x - goal) / 1.5
                    sNodes[i].nowPosition[k].x = goal
                }
                else {
                    goal = sNodes[i].initPosition[k].y + aDestination.distance(aXposition: sXPosition, aYposition: sYPosition)
                    distance = Double(sNodes[i].nowPosition[k].y - goal) / 1.5
                    sNodes[i].nowPosition[k].y = goal
                }
                
                // 初期化ではないなら滑らかになる
                if aInitFlag == false {
                    for k in 0 ... eTime.CELL - 1 {
                        action.append(SKAction.moveTo(x: goal + CGFloat(distance / pow(2, Double(k + 1) ) ),
                                                      duration: (TimeInterval(eTime.FRAME * (CGFloat(eTime.CELL) - CGFloat(k) ) ) ) ) )
                    }
                }
                action.append(SKAction.moveTo(x: goal, duration: 0.0))
                sNodes[i].nodes[k].run(SKAction.sequence(action))
            }
        }
    }
}
