//
//  GameScene.swift
//  PingPong
//
//  Created by Darko Stojanov on 9/26/18.
//  Copyright © 2018 Darko Stojanov. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    

    var ball=SKSpriteNode()
    var enemy=SKSpriteNode()
    var main=SKSpriteNode()
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 50  , dy: 50))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            main.run(SKAction.moveTo(x: location.x, duration: 0))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            main.run(SKAction.moveTo(x: location.x, duration: 0))
        }
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        // Mrdanje na Neprijatelot
        
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
        
        
    }
}
