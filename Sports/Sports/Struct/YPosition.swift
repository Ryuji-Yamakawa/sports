//
//  sYPosition.swift
//  Sports
//
//  Created by Ryuji Yamakawa on 2019/10/29.
//  Copyright © 2019 Project'97. All rights reserved.
//
// Y座標の構造体

import Foundation

struct sYPosition {
    
    var gameHeight : Int = 960
    var upperAdSpace : Int = 0
    
    // デバイスの有効高さからY座標を設定
    init(aHeight : Int, aDevice : eDevice) {
        gameHeight = aHeight
        
        switch aDevice {
        case .iPhone9_16:
            upperAdSpace = 0
        case .iPhoneX:
            upperAdSpace = eGameSize.WIDTH / 4  // 要調整
        case .iPad:
            upperAdSpace = eGameSize.WIDTH / 8  // 要調整
        }
    }
}
