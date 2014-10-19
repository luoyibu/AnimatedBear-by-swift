//
//  GameScene.swift
//  AnimatedBear
//
//  Created by luoxuan-mac on 14/10/19.
//  Copyright (c) 2014年 luoyibu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var bear: SKSpriteNode
    var bearWorkingFrames: NSArray
    
    func walkingBear()
    {
        let walkAction = SKAction.animateWithTextures(self.bearWorkingFrames, timePerFrame: 0.1, resize: false, restore: true)
        self.bear .runAction(SKAction.repeatActionForever(walkAction), withKey: "walkingInPlaceBear")
    }
    
    override init(size: CGSize) {

        let walkFrames = NSMutableArray()
        let bearAnimatedAtlas = SKTextureAtlas(named: "BearImages")
        let numImages = bearAnimatedAtlas.textureNames.count
        for i in 0..<numImages/2 {
            let textureName = String(format: "bear%i", i)
            let temp = bearAnimatedAtlas.textureNamed(textureName)
            walkFrames.addObject(temp)
        }
        self.bearWorkingFrames = walkFrames
        
        let temp: AnyObject = self.bearWorkingFrames[0];
        self.bear = SKSpriteNode(texture: temp as SKTexture)
        super.init(size: size)
        
        self.bear.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        self.addChild(self.bear)
        self.walkingBear()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
