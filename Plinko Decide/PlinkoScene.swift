//
//  PlinkoScene.swift
//  Plinko Decide
//
//  Created by Declan Smith on 4/19/21.
//

import SpriteKit
import GameplayKit
class GameScene: SKScene {
    var ball = SKShapeNode()
  override func didMove(to view: SKView) {
    let stars = SKTexture(imageNamed: "Board")
  //  for i in 0...1 {
        let boardBackground = SKSpriteNode(texture: stars)
        boardBackground.position = CGPoint(x: 150, y: 300)
        addChild(boardBackground)
       // physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
       // createBackground()
 physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
  //  }
    makeBouncer(at: CGPoint(x:150, y:300))
    makeBouncer(at: CGPoint(x:250, y:300))
    makeBouncer(at: CGPoint(x:400, y:0))
    makeBouncer(at: CGPoint(x:100, y:0))
    makeSlot(at: CGPoint(x: 100, y: 0), isGood: true)
    makeSlot(at: CGPoint(x:150, y:300), isGood: false)
    makeSlot(at: CGPoint(x: 175, y: 0), isGood: false)
    makeSlot(at: CGPoint(x: 450, y: 0), isGood: true)
    }
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return}
        let location = touch.location(in: self)
        
     // makeBall()
        ball.removeFromParent() // remove the ball (if it exists)
        ball = SKShapeNode(circleOfRadius: 10)
        //    ball.position = CGPoint(x: touch.location, y: 300)
        ball.strokeColor = .black
        ball.fillColor = .yellow
        // physics shape matches ball image
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        ball.position = location
        ball.name = "ball"
        addChild(ball)
    }
   // func makeBall(){
    
  
//}
    func makeBouncer(at postion: CGPoint){
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
      //   bouncer.position = position
        bouncer.size = CGSize(width: 20, height: 20)
         bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width/2)
         bouncer.physicsBody?.isDynamic=false
         addChild(bouncer)
    }
    func makeSlot(at Position:CGPoint, isGood:Bool) {
        var slotBase: SKSpriteNode
        if isGood {
            slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
            slotBase.name = "good"
            slotBase.size = CGSize(width: 20, height: 20)
        }
        else {
            slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
            slotBase.name = "bad"
            slotBase.size = CGSize(width: 20, height: 20)
        }
        slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
        slotBase.physicsBody?.isDynamic = false
        slotBase.position = position
        addChild(slotBase)
    }
}
