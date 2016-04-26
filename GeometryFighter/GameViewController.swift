//
//  GameViewController.swift
//  GeometryFighter
//
//  Created by fang on 16/4/26.
//  Copyright (c) 2016年 方一雄. All rights reserved.
//

import UIKit
import SceneKit

class GameViewController: UIViewController {
    
    var scn视图: SCNView!
    var scn场景: SCNScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        配置视图()
        配置场景()
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func 配置视图() {
        scn视图 = self.view as! SCNView
    }
    
    func 配置场景() {
        scn场景 = SCNScene()
        scn视图.scene = scn场景
    }

}
