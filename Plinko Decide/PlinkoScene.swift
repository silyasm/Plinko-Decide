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
  override func didMove(to view: SKView) {
    physicsWorld.contactDelegate = self
    self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

   // let stars = SKTexture(imageNamed: "Board")
  //  for i in 0...1 {
      //  let boardBackground = SKSpriteNode(texture: stars)
    //    boardBackground.position = CGPoint(x: 150, y: 300)
   //     addChild(boardBackground)
       // physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
       // createBackground()
 physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
  //  }
    makeBouncer(at: CGPoint(x:150, y:300))
    makeBouncer(at: CGPoint(x:250, y:300))
    makeBouncer(at: CGPoint(x:400, y:0))
    makeBouncer(at: CGPoint(x:100, y:0))
    makeOptionZone()
    makeWinnerLabel()
    }
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return}
        let location = touch.location(in: self)
        makeBall(location: location)
    }

    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "optionZone" ||
            contact.bodyB.node?.name == "optionZone" {
            ball.removeFromParent()
            let winner = optionsList.options.randomElement()
            winnerLabel.alpha = 1
            winnerLabel.text = "The winner is \(winner!.name)"
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
    
    func makeBouncer(at postion: CGPoint){
        bouncer = SKShapeNode(circleOfRadius: 10)
                //    ball.position = CGPoint(x: touch.location, y: 300)
                bouncer.strokeColor = .black
                bouncer.fillColor = .green
                // physics shape matches ball image
                bouncer.physicsBody = SKPhysicsBody(circleOfRadius: 30)
               // bounce.position = location

                bouncer.position =  CGPoint(x:100, y:300)
        
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
        winnerLabel.fontName = "Helvetica"
        winnerLabel.fontSize = 25
        winnerLabel.color = .black
        winnerLabel.position = CGPoint(x: 150, y: 300)
        winnerLabel.alpha = 0
        addChild(winnerLabel)
    }
}
