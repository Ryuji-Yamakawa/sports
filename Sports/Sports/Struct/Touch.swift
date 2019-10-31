// タッチの値の構造体

import Foundation

struct STouch {
    
    var stat : eTouchStatus = .NONE
    var dragDirec : eDragDirection = .NONE  // ドラッグの方向　遊びを超えたらeNoneではなくなる
    
    // 今タッチしているもの
    var nowX : Int = 0
    var nowY : Int = 0
    var nowN : String = ""
    
    // タッチを開始した座標
    var beginX : Int = 0
    var beginY : Int = 0
    var beginN : String = ""
    
    // 移動した距離
    var moveX : Int = 0
    var moveY : Int = 0
    
    // 加速度
    var beforeY : Int = 0
    var accelerationY : Int = 0
    
    // タッチを完了した座標
    var endX : Int = 0
    var endY : Int = 0
    var endN : String = ""
    
    
}
