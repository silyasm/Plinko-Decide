//
//  PlinkoScene.swift
//  Plinko Decide
//
//  Created by Declan Smith on 4/19/21.
//
//just got back
import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var optionsList = OptionsList()
    var ball = SKShapeNode()
    var optionZone = SKSpriteNode()
    var winnerLabel = SKLabelNode()
    var bouncer = SKShapeNode()
    var ballDropped = false
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        makeBouncersAppear()
        makeOptionZone()
        makeWinnerLabel()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return}
        ballDropped = true
        let location = touch.location(in: self)
        makeBall(location: location)
        winnerLabel.alpha = 0
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "optionZone" ||
            contact.bodyB.node?.name == "optionZone" {
            ball.removeFromParent()
            ballDropped = false
            let winner = optionsList.options.randomElement()
            winnerLabel.alpha = 1
            winnerLabel.text = "The winner is \(winner!.name)!"
        }
    }
    
    func makeBall(location: CGPoint) {
        ball.removeFromParent() // remove the ball (if it exists)
        ball = SKShapeNode(circleOfRadius: 10)
        ball.strokeColor = .black
        ball.fillColor = .yellow
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        ball.physicsBody?.usesPreciseCollisionDetection = true
        ball.physicsBody?.contactTestBitMask = (ball.physicsBody?.collisionBitMask)!
        ball.position = location
        ball.name = "ball"
        addChild(ball)
    }
    
    func makeBouncer(position: CGPoint) {
        bouncer = SKShapeNode(circleOfRadius: 5)
        bouncer.strokeColor = .black
        bouncer.fillColor = .green
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: 5)
        bouncer.position = position
        bouncer.physicsBody?.isDynamic = false
        addChild(bouncer)
    }
    
    func makeOptionZone() {
        optionZone = SKSpriteNode(color: .red, size: CGSize(width: 300, height: 40))
        optionZone.position = CGPoint(x: 150, y: 0)
        optionZone.name = "optionZone"
        optionZone.physicsBody = SKPhysicsBody(rectangleOf: optionZone.size)
        optionZone.physicsBody?.isDynamic = false
        addChild(optionZone)
    }
    
    func makeWinnerLabel() {
        winnerLabel.name = "winnerLabel"
        winnerLabel.text = "Tap here to drop a ball"
        winnerLabel.fontName = "Arial"
        winnerLabel.fontSize = 25
        winnerLabel.color = .black
        winnerLabel.position = CGPoint(x: 150, y: 450)
        addChild(winnerLabel)
    }
    
    func makeEvenRow(height: Int) {
        for i in 0...9 {
            makeBouncer(position: CGPoint(x: (15 + (30 * i)), y: height))
        }
    }
    
    func makeOddRow(height: Int) {
        for i in 0...8 {
            makeBouncer(position: CGPoint(x: (30 + (30 * i)), y: height))
        }
    }
    
    func makeBouncersAppear() {
        for i in 1...4 {
            makeEvenRow(height: (100 * i))
        }
        
        for i in 1...3 {
            makeOddRow(height: (50 + (100 * i)))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if ballDropped {
            if abs(ball.physicsBody!.velocity.dx) == 0 {
                if abs(ball.physicsBody!.velocity.dy) == 0 {
                    ball.physicsBody?.applyImpulse(CGVector(dx: Int.random(in: -3...3), dy: Int.random(in: 1...3)))
                }
            }
        }
    }
}
