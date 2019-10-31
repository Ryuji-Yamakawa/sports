// ノードを持つクラス

import SpriteKit

class NodesManager {
    var skScene : SKScene!
    var sNodes : [SNode] = []
    
    init( aScene: SKScene ) {
        skScene = aScene
    }
    
    // ノードを表示する
    func addChild(a : Int) {
        
        if sNodes[a].sprites.count > 0 {
            for i in 0 ... sNodes[a].sprites.count - 1 {
                skScene.addChild(sNodes[a].sprites[i])
            }
        }
        if sNodes[a].labels.count > 0 {
            for i in 0 ... sNodes[a].labels.count - 1 {
                skScene.addChild(sNodes[a].labels[i])
            }
        }
        if sNodes[a].touchImgSprites.count > 0 {
            for i in 0 ... sNodes[a].touchImgSprites.count - 1 {
                skScene.addChild(sNodes[a].touchImgSprites[i])
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
    
    // ノードを隠す
    func hiddenNode(aName : String, aHidden : Bool ) {
        
        let hiddenNo : Int = nameToNo(aName : aName)
            
        if sNodes[hiddenNo].sprites.count > 0 {
            for i in 0 ... sNodes[hiddenNo].sprites.count - 1 {
                sNodes[hiddenNo].sprites[i].isHidden = aHidden
            }
        }
        if sNodes[hiddenNo].labels.count > 0 {
            for i in 0 ... sNodes[hiddenNo].labels.count - 1 {
                sNodes[hiddenNo].labels[i].isHidden = aHidden
            }
        }
        if sNodes[hiddenNo].touchImgSprites.count > 0 {
            for i in 0 ... sNodes[hiddenNo].touchImgSprites.count - 1 {
                sNodes[hiddenNo].touchImgSprites[i].isHidden = aHidden
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
        return 999
    }
    
    // 全てのノードを削除する
    func deleteSNodes() {
        if sNodesExist() == true {
            for i in 0 ... sNodes.count - 1 {
                if sNodes[i].sprites.count > 0 {
                    skScene.removeChildren(in: sNodes[i].sprites)
                }
                if sNodes[i].labels.count > 0 {
                    skScene.removeChildren(in: sNodes[i].labels)
                }
                if sNodes[i].touchImgSprites.count > 0 {
                    skScene.removeChildren(in: sNodes[i].touchImgSprites)
                }
            }
        }
        sNodes = []
    }

    // 特定のノードを削除する。
    func deleteNode(aName : String) {
        
        let deleteNo : Int = nameToNo(aName : aName)
        
        skScene.removeChildren(in: sNodes[deleteNo].sprites)
        skScene.removeChildren(in: sNodes[deleteNo].labels)
        skScene.removeChildren(in: sNodes[deleteNo].touchImgSprites)
        
        sNodes.remove(at : deleteNo)
    }
    
}
