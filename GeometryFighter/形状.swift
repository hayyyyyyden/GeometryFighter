//
//  形状.swift
//  GeometryFighter
//
//  Created by fang on 16/5/3.
//  Copyright © 2016年 方一雄. All rights reserved.
//

import Foundation

public enum 形状: Int {
    
    case 立方体 = 0
    case 球体
    case 锥体
    case 圆环体
    case 胶囊体
    case 圆柱体
    case 圆锥体
    case 水管体
    
    static func 随机() -> 形状 {
        let 最大值 = 水管体.rawValue
        let 随机 = arc4random_uniform(UInt32(最大值+1))
        return 形状(rawValue: Int(随机))!
    }
}
