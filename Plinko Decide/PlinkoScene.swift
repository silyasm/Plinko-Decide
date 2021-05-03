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
        winnerLabel.text = ""
        winnerLabel.fontName = "Arial"
        winnerLabel.fontSize = 25
        winnerLabel.color = .black
        winnerLabel.position = CGPoint(x: 150, y: 450)
        winnerLabel.alpha = 0
        addChild(winnerLabel)
    }
    
    func makeEvenRow(height: Int) {
        makeBouncer(position: CGPoint(x: 15, y: height))
        makeBouncer(position: CGPoint(x: 45, y: height))
        makeBouncer(position: CGPoint(x: 75, y: height))
        makeBouncer(position: CGPoint(x: 105, y: height))
        makeBouncer(position: CGPoint(x: 135, y: height))
        makeBouncer(position: CGPoint(x: 165, y: height))
        makeBouncer(position: CGPoint(x: 195, y: height))
        makeBouncer(position: CGPoint(x: 225, y: height))
        makeBouncer(position: CGPoint(x: 255, y: height))
        makeBouncer(position: CGPoint(x: 285, y: height))
    }
    
    func makeOddRow(height: Int) {
        makeBouncer(position: CGPoint(x: 30, y: height))
        makeBouncer(position: CGPoint(x: 60, y: height))
        makeBouncer(position: CGPoint(x: 90, y: height))
        makeBouncer(position: CGPoint(x: 120, y: height))
        makeBouncer(position: CGPoint(x: 150, y: height))
        makeBouncer(position: CGPoint(x: 180, y: height))
        makeBouncer(position: CGPoint(x: 210, y: height))
        makeBouncer(position: CGPoint(x: 240, y: height))
        makeBouncer(position: CGPoint(x: 270, y: height))
    }
    
    func makeBouncersAppear() {
        makeEvenRow(height: 400)
        makeOddRow(height: 350)
        makeEvenRow(height: 300)
        makeOddRow(height: 250)
        makeEvenRow(height: 200)
        makeOddRow(height: 150)
        makeEvenRow(height: 100)
        makeOddRow(height: 50)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if ballDropped {
            if abs(ball.physicsBody!.velocity.dx) == 0 {
                if abs(ball.physicsBody!.velocity.dy) == 0 {
                    ball.physicsBody?.applyImpulse(CGVector(dx: Int.random(in: 5...10), dy: Int.random(in: 5...10)))
                }
            }
        }
    }
}
