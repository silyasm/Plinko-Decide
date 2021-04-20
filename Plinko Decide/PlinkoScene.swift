//
//  PlinkoScene.swift
//  Plinko Decide
//
//  Created by Declan Smith on 4/19/21.
//

import SpriteKit
import GameplayKit
class GameScene: SKScene {
  override func didMove(to view: SKView) {
    let stars = SKTexture(imageNamed: "Board")
    for i in 0...1 {
        let boardBackground = SKSpriteNode(texture: stars)
        boardBackground.zPosition = -1
        boardBackground.position = CGPoint(x: 0, y: boardBackground.size.height * CGFloat(i))
        addChild(boardBackground)
        let moveDown = SKAction.moveBy(x: 0, y: -boardBackground.size.height, duration: 20)
        let moveReset = SKAction.moveBy(x: 0, y: boardBackground.size.height, duration: 0)
        let moveLoop = SKAction.sequence([moveDown, moveReset])
        let moveForever = SKAction.repeatForever(moveLoop)
        boardBackground.run(moveForever)
       // physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
       // createBackground()
 physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    makeBouncer(at: CGPoint(x:0, y:0))
    makeBouncer(at: CGPoint(x:250, y:0))
    makeBouncer(at: CGPoint(x:400, y:0))
    makeBouncer(at: CGPoint(x:150, y:0))
    }
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return}
        let location = touch.location(in: self)
        
        let ball = SKSpriteNode(imageNamed: "redBall")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
        ball.physicsBody?.restitution = 0.4
        ball.position = location
        addChild(ball)
    }
    func makeBouncer(at postion: CGPoint){
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
         bouncer.position = position
         bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width/2)
         bouncer.physicsBody?.isDynamic=false
         addChild(bouncer)
    }
}
