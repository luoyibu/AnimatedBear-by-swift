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
        let screenSize = self.frame.size
        let bearVelocity: Float = Float(screenSize.width)/3
        let moveDifference = CGPoint(x: location!.x - self.bear.position.x, y: location!.y - self.bear.position.y)
        let distanceToMove: Float = sqrtf(Float(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y))
        let moveDuration = distanceToMove / bearVelocity
        
        if moveDifference.x < 0 {
            multiplierForDirection = 1
        } else {
            multiplierForDirection = -1
        }
        
        self.bear.xScale = fabs(self.bear.xScale) * multiplierForDirection
        
        if (self.bear.actionForKey("bearMoving") != nil) {
            self.bear.removeActionForKey("bearMoving")
        }
        
        if self.actionForKey("walkingInPlaceBear") == nil {
            self.walkingBear()
        }
        
        let moveAction = SKAction.moveTo(location!, duration: NSTimeInterval(moveDuration))
        let doneAction = SKAction.runBlock { () -> Void in
            print("Animation Completed")
            self.bearMoveEnd()
        }
        
        let moveActionWithDone = SKAction.sequence([moveAction, doneAction])
        self.bear.runAction(moveActionWithDone, withKey: "bearMoving")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {

    }
    
    func bearMoveEnd()
    {
        self.bear.removeAllActions()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
