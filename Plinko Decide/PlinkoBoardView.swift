//
//  PlinkoBoardView.swift
//  Plinko Decide
//
//  Created by Student on 4/23/21.
//

import SwiftUI
import SpriteKit

struct PlinkoBoardView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 500)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 300, height: 500)    }
}

struct PlinkoBoardView_Previews: PreviewProvider {
    static var previews: some View {
        PlinkoBoardView()
    }
}
