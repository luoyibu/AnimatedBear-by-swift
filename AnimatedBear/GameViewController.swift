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
