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
    var 摄像头节点: SCNNode!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        配置视图()
        配置场景()
        配置摄像头()
        生成几何体()
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func 配置视图() {
        scn视图 = self.view as! SCNView
        scn视图.showsStatistics = true
        scn视图.allowsCameraControl = true
        scn视图.autoenablesDefaultLighting = true
    }
    
    func 配置场景() {
        scn场景 = SCNScene()
        scn视图.scene = scn场景
        scn场景.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.png"
    }
    
    func 配置摄像头() {
        摄像头节点 = SCNNode()
        摄像头节点.camera = SCNCamera()
        摄像头节点.position = SCNVector3(x: 0, y: 5, z: 10)
        scn场景.rootNode.addChildNode(摄像头节点)
    }
    
    func 生成几何体() {
        var 几何体: SCNGeometry
        switch 形状.随机() {
        case .立方体:
            几何体 = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        case .球体:
            几何体 = SCNSphere(radius: 0.5)
        case .锥体:
            几何体 = SCNPyramid(width: 1.0, height: 1.0, length: 1.0)
        case .圆环体:
            几何体 = SCNTorus(ringRadius: 0.5, pipeRadius: 0.25)
        case .胶囊体:
            几何体 = SCNCapsule(capRadius: 0.3, height: 2.5)
        case .圆柱体:
            几何体 = SCNCylinder(radius: 0.3, height: 2.5)
        case .圆锥体:
            几何体 = SCNCone(topRadius: 0.25, bottomRadius: 0.5, height: 1.0)
        case .水管体:
            几何体 = SCNTube(innerRadius: 0.25, outerRadius: 0.5, height: 1.0)
        }
        几何体.materials.first?.diffuse.contents = UIColor.random()

        let 几何体节点 = SCNNode(geometry: 几何体)
        几何体节点.physicsBody = SCNPhysicsBody(type: .Dynamic, shape: nil)
        
        let 随机X = Float.random(min: -2, max: 2)
        let 随机Y = Float.random(min: 10, max: 18)
        let 力 = SCNVector3(x: 随机X, y:随机Y, z:0)
        let 位置 = SCNVector3(x: 0.05, y: 0.05, z: 0.05)
        几何体节点.physicsBody?.applyForce(力, atPosition: 位置, impulse: true)
        
        scn场景.rootNode.addChildNode(几何体节点)
    }
    
}
