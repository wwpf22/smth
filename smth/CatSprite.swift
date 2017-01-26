//
//  CatSprite.swift
//  smth
//
//  Created by citizenfour on 25.01.17.
//  Copyright © 2017 wwpf. All rights reserved.
//

import SpriteKit

public class CatSprite : SKSpriteNode {
    
    private let walkingActionKey = "action_walking"
    
    
    private var timeSinceLastHit : TimeInterval = 2
    private let maxFlailTime : TimeInterval = 2
    private let movementSpeed : CGFloat = 100
    
    private let walkFrames = [
        SKTexture(imageNamed: "cat-1"),
        SKTexture(imageNamed: "cat-2")
    ]
    
        public static func newInstance() -> CatSprite {
        let catSprite = CatSprite(imageNamed: "cat-1")
        
        
        catSprite.physicsBody = SKPhysicsBody(circleOfRadius: catSprite.size.width/2)
        catSprite.zPosition = 4
            
        catSprite.physicsBody?.categoryBitMask = CatCategory
        catSprite.physicsBody?.contactTestBitMask = RainDropCategory | WorldCategory
        
        return catSprite
    }
    
    public func hitByRain() {
        timeSinceLastHit = 0
        removeAction(forKey: walkingActionKey)
    }
    
    public func update(deltaTime : TimeInterval, foodLocation: CGPoint) {
        timeSinceLastHit += deltaTime
        
        if timeSinceLastHit >= maxFlailTime {
            if action(forKey: walkingActionKey) == nil {
                let walkingAction = SKAction.repeatForever(
                    SKAction.animate(with: walkFrames,
                                     timePerFrame: 0.1,
                                     resize: false,
                                     restore: true))
                
                run(walkingAction, withKey:walkingActionKey)
            }
            
            if zRotation != 0 && action(forKey: "action_rotate") == nil {
                run(SKAction.rotate(toAngle: 0, duration: 0.25), withKey: "action_rotate")
            }
            
            //Stand still if the food is above the cat.
            if foodLocation.y > position.y && abs(foodLocation.x - position.x) < 2 {
                physicsBody?.velocity.dx = 0
                removeAction(forKey: walkingActionKey)
                texture = walkFrames[1]
            } else if foodLocation.x < position.x {
                //Food is left
                physicsBody?.velocity.dx = -movementSpeed
                xScale = -1
            } else {
                //Food is right
                physicsBody?.velocity.dx = movementSpeed
                xScale = 1
            }
            
            physicsBody?.angularVelocity = 0
        }
    }
}
