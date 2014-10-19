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
        for i in 1...numImages/2 {
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
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        let location = touches.anyObject()?.locationInNode(self)
        var multiplierForDirection: CGFloat = 0;
        if location?.x <= CGRectGetMidX(self.frame) {
            multiplierForDirection = 1
        } else {
            multiplierForDirection = -1
        }
        self.bear.xScale = fabs(self.bear.xScale) * multiplierForDirection
        self.walkingBear()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
