//
//  GameViewController.swift
//  AnimatedBear
//
//  Created by luoxuan-mac on 14/10/19.
//  Copyright (c) 2014年 luoyibu. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
    
}

class GameViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        // Configure the view.
        let skView = self.view as SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        let scene = GameScene.sceneWithSize(skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.toRaw())
        } else {
            return Int(UIInterfaceOrientationMask.All.toRaw())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
