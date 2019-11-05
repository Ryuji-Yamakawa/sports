// ノードを持つクラス

import SpriteKit

class NodesManager {
    
    var skScene : SKScene!
    var sNodes : [SNode] = []
    
    let sXPosition : SXPosition!
    let sYPosition : SYPosition!
    
    let NAME_ERROR_NO : Int = 999
    
    init( aSKScene: SKScene, aXPosition : SXPosition, aYPosition : SYPosition ) {
        skScene = aSKScene
        sXPosition = aXPosition
        sYPosition = aYPosition
    }
    
    // ノードを表示する
    func addChild(a : Int) {
        
        if sNodes[a].nodes.count > 0 {
            for i in 0 ... sNodes[a].nodes.count - 1 {
                skScene.addChild(sNodes[a].nodes[i])
            }
        }
    }
    
    // ノード配列に値が存在するならtrue
    func sNodesExist() -> Bool {
        if sNodes.count > 0 {
            return true
        }
        return false
    }
    
    // 全てのノードのHiddenを変更
    func hiddenAll(aHidden : Bool ) {
        if sNodesExist() == true {
            for i in 0 ... sNodes.count - 1 {
                if sNodes[i].nodes.count > 0 {
                    for k in 0 ... sNodes[i].nodes.count - 1 {
                        sNodes[i].nodes[k].isHidden = aHidden
                    }
                }
            }
        }
    }
    
    // 特定のノードのHiddenを変更
    func hiddenNode(aName : String, aHidden : Bool ) {
        
        let hiddenNo : Int = nameToNo(aName : aName)
            
        if sNodes[hiddenNo].nodes.count > 0 {
            for i in 0 ... sNodes[hiddenNo].nodes.count - 1 {
                sNodes[hiddenNo].nodes[i].isHidden = aHidden
            }
        }
    }
    
    // 名前に該当するボタン番号を返す
    func nameToNo(aName : String) -> Int {
        if sNodesExist() == true {
            
            for i in 0 ... sNodes.count - 1 {
                if sNodes[i].name == aName {
                    return i
                }
            }
        }
        print("NodesManager nameToNoでエラー")
        return NAME_ERROR_NO
    }
    
    // 全てのノードを削除する
    func deleteAll() {
        if sNodesExist() == true {
            for i in 0 ... sNodes.count - 1 {
                if sNodes[i].nodes.count > 0 {
                    skScene.removeChildren(in: sNodes[i].nodes)
                }
            }
        }
        sNodes = []
    }

    // 特定のノードを削除する。
    func deleteNode(aName : String) {
        
        let deleteNo : Int = nameToNo(aName : aName)
        
        skScene.removeChildren(in: sNodes[deleteNo].nodes)
        
        sNodes.remove(at : deleteNo)
    }
    
    // ノードが含まれているかを判断する
    func getNodeExist(aName : String) -> Bool {
        if sNodesExist() == true {
            for i in 0 ... sNodes.count - 1 {
                if sNodes[i].name == aName { return true }
            }
        }
        return false
    }
    
}
