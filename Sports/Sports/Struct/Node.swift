// Node1つの構造体

import SpriteKit

struct SNode {
    var name            : String = ""
    var labels          : [SKLabelNode]   = []
    var sprites         : [SKSpriteNode]  = []
    var touchImgSprites : [SKSpriteNode]  = []  // タッチした時に光る画像など
    var xyPosition      : [CGPoint] = []        // ノードの本来の位置
    var swipePosition   : [CGPoint] = []        // スワイプで追従しているときなどの位置
}
