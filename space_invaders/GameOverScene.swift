//
//  GameOverScene.swift
//  space_invaders
//
//  Created by Rick Brown on 13/01/2021.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
  /// Create a restart label to be used in the game over scene
  let restartLabel = SKLabelNode(fontNamed: "theboldfont")
  
  override func didMove(to view: SKView) {
    /// Create and position a background
    let background = SKSpriteNode(imageNamed: "background")
    background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
    background.zPosition = 0
    self.addChild(background)
    /// Create, style and position a label for words 'game over'
    let gameOverLabel = SKLabelNode(fontNamed: "theboldfont")
    gameOverLabel.text = "GAME OVER"
    gameOverLabel.fontSize = 200
    gameOverLabel.color = SKColor.white
    gameOverLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.7)
    gameOverLabel.zPosition = 1
    self.addChild(gameOverLabel)
    /// Create, style and position a label for the score
    let scoreLabel = SKLabelNode(fontNamed: "theboldfont")
    scoreLabel.text = "Score: \(gameScore)"
    scoreLabel.fontSize = 125
    scoreLabel.fontColor = SKColor.white
    scoreLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.55)
    scoreLabel.zPosition = 1
    self.addChild(scoreLabel)
    
    /// Create an instance of UserDefaults (local storage)
    let defaults = UserDefaults()
    /// Set the highScoreNumber to the user default key 'highScoreSaved'
    var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
    /// Check for new high score
    if gameScore > highScoreNumber {
      highScoreNumber = gameScore
      /// Save the user default data
      defaults.set(highScoreNumber, forKey: "highScoreSaved")
    }
    /// Display the highest score
    let highScoreLabel = SKLabelNode(fontNamed: "theboldfont")
    highScoreLabel.text = "High Score: \(highScoreNumber)"
    highScoreLabel.fontSize = 125
    highScoreLabel.fontColor = SKColor.white
    highScoreLabel.zPosition = 1
    highScoreLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.45)
    self.addChild(highScoreLabel)
    
    /// Display a button
    restartLabel.text = "Restart"
    restartLabel.fontSize = 90
    restartLabel.fontColor = SKColor.white
    restartLabel.zPosition = 1
    restartLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.3)
    self.addChild(restartLabel)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    /// Loop through the touches
    for touch: AnyObject in touches {
      /// Get the initial touch
      let pointOfTouch = touch.location(in: self)
      /// This checks a touch in the restart label, effectively turning a label into a button
      if restartLabel.contains(pointOfTouch) {
        /// Create a transition
        let sceneToMoveTo = GameScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let transition = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMoveTo, transition: transition)
      }
    }
  }
}
