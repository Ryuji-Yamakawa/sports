// ページの背景やボタンの移動処理など

import SpriteKit

class PageParts : NodesManager {
    
    var pagePosition : ePagePosition = .CENTER
    
    // タッチされたときの画像を表示/非表示
    func touchImgHidden(aTouch : STouch) {
        if sNodesExist() == false { return }
        
        // 全てのタッチ画像を隠す
        for i in 0 ... sNodes.count - 1 {
            if sNodes[i].touchImgExist == true {
                sNodes[i].nodes[sNodes[i].nodes.count - 1].isHidden = true
            }
        }
        
        if aTouch.stat == .END  { return }
        
        if aTouch.dragDirec != .NONE { return }
        
        if getNodeExist(aName: aTouch.nowN) == false { return }
        
        let touchedNo : Int = nameToNo(aName: aTouch.nowN)
        
        if touchedNo == NAME_ERROR_NO { return }
        
        // 一致したタッチ画像を表示する
        for i in 0 ... sNodes.count - 1 {
            if sNodes[i].touchImgExist == true {
                if touchedNo == i {
                    sNodes[i].nodes[sNodes[i].nodes.count - 1].isHidden = false
                }
            }
        }
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
                    goal = sNodes[i].initPosition[k].x + aDestination.distanceX(aXposition: sXPosition)
                    distance = Double(sNodes[i].nowPosition[k].x - goal) / 1.5
                    sNodes[i].nowPosition[k].x = goal

                    // 初期化ではないなら滑らかになる
                    if aInitFlag == false {
                        for k in 0 ... STime().cell - 1 {
                            action.append(SKAction.moveTo(x: goal + CGFloat(distance / pow(2, Double(k + 1) ) ),
                                                          duration: (TimeInterval(STime().frame * (CGFloat(STime().cell) - CGFloat(k) ) ) ) ) )
                        }
                    }
                    action.append(SKAction.moveTo(x: goal, duration: 0.0))
                }
                else {
                    goal = sNodes[i].initPosition[k].y + aDestination.distanceY(aYposition: sYPosition)
                    distance = Double(sNodes[i].nowPosition[k].y - goal) / 1.5
                    sNodes[i].nowPosition[k].y = goal

                    // 初期化ではないなら滑らかになる
                    if aInitFlag == false {
                        for k in 0 ... STime().cell - 1 {
                            action.append(SKAction.moveTo(y: goal + CGFloat(distance / pow(2, Double(k + 1) ) ),
                                                          duration: (TimeInterval(STime().frame * (CGFloat(STime().cell) - CGFloat(k) ) ) ) ) )
                        }
                    }
                    action.append(SKAction.moveTo(y: goal, duration: 0.0))
                }
                
                sNodes[i].nodes[k].run(SKAction.sequence(action))
            }
        }
    }
    
    // スワイプ追従
    func swipe(aTouch : STouch) {
        
        if sNodesExist() == false { return }
        
        for i in 0 ... sNodes.count - 1 {
            
            var action : SKAction = SKAction()
            
            if aTouch.dragDirec == .HORIZONTAL || aTouch.dragDirec == .RIGHT || aTouch.dragDirec == .LEFT {
                
                if sNodes[i].nodes.count > 0 {
                    
                    for k in 0 ... sNodes[i].nodes.count - 1 {
                        action = SKAction.moveTo(x: sNodes[i].nowPosition[k].x + CGFloat(aTouch.moveX), duration: 0.0)
                        sNodes[i].nodes[k].run(action)
                        
                        if aTouch.stat == .END {
                            sNodes[i].nowPosition[k].x += CGFloat(aTouch.moveX)
                        }
                    }
                }
            }
            else if aTouch.dragDirec == .VERTICAL || aTouch.dragDirec == .UPPER || aTouch.dragDirec == .UNDER  {
                
                if sNodes[i].nodes.count > 0 {
                    for k in 0 ... sNodes[i].nodes.count - 1 {
                        action = SKAction.moveTo(y: sNodes[i].nowPosition[k].y + CGFloat(aTouch.moveY), duration: 0.0)
                        sNodes[i].nodes[k].run(action)
                        
                        if aTouch.stat == .END {
                            sNodes[i].nowPosition[k].y += CGFloat(aTouch.moveY)
                        }
                    }
                }
            }
        }
    }
    
    // スワイプキャンセル
    func swipeCancel(aTouch : STouch) {
        
        if aTouch.stat == .END {
            if aTouch.dragDirec == .UNDER || aTouch.dragDirec == .UPPER || aTouch.dragDirec == .VERTICAL {
                pageChange(aDestination: pagePosition, aXFlag: false, aInitFlag: false)
            }
            else if aTouch.dragDirec == .LEFT || aTouch.dragDirec == .RIGHT || aTouch.dragDirec == .HORIZONTAL {
                pageChange(aDestination: pagePosition, aXFlag: true, aInitFlag: false)
            }
        }
    }
}
