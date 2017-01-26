//
//  FoodSprite.swift
//  smth
//
//  Created by citizenfour on 25.01.17.
//  Copyright © 2017 wwpf. All rights reserved.
//

import SpriteKit

public class FoodSprite : SKSpriteNode {
    
    public static func newInstance() -> FoodSprite {
        let foodd = FoodSprite(imageNamed: "food")
        
        foodd.physicsBody = SKPhysicsBody(rectangleOf: foodd.size)
        foodd.zPosition = 5
        
        foodd.physicsBody?.categoryBitMask = FoodCategory
        foodd.physicsBody?.contactTestBitMask = RainDropCategory | WorldCategory | CatCategory
        
        
        return foodd
    }
}
