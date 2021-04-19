//
//  PlinkoScene.swift
//  Plinko Decide
//
//  Created by Declan Smith on 4/19/21.
//

import SpriteKit
import GameplayKit
class GameScene: SKScene, SKPhysicsContactDelegate {
    var ball = SKShapeNode()
    var bumbers = SKSpriteNode()
  
    override func didMove(to view: SKView) {
        // this stuff happens once (when the app opens)
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        createBackground()
 physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    func createBackground() {
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
        }
    }
    

    func resetGame() {
        // this stuff happens before each game starts
        makeBall()
     //   makeBumbers()
     
    }
    func makeBall() {
        ball.removeFromParent() // remove the ball (if it exists)
        ball = SKShapeNode(circleOfRadius: 10)
        ball.position = CGPoint(x: frame.midX, y: frame.midY)
        ball.strokeColor = .black
        ball.fillColor = .yellow
        ball.name = "ball"
        // physics shape matches ball image
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        // ignores all forces and impulses
        ball.physicsBody?.isDynamic = false
        // use precise collision detection
        ball.physicsBody?.usesPreciseCollisionDetection = true
        // no loss of energy from friction
        ball.physicsBody?.friction = 0
        // gravity is not a factor
        ball.physicsBody?.affectedByGravity = false
        // bounces fully off of other objects
        ball.physicsBody?.restitution = 1
        // does not slow down over time
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.contactTestBitMask =
            (ball.physicsBody?.collisionBitMask)!
        addChild(ball) // add ball object to the view
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return}
        let location = touch.location(in: self)
        
        let ball = SKSpriteNode(color: .red, size: CGSize(width: 40, height: 40))
        ball.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 40))
        ball.position = location
        addChild(ball)
    }
    
}
