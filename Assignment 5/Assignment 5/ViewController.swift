//
//  ViewController.swift
//  Assignment 5
//
//  Created by user287375 on 11/23/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choiceButton1: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!
    
    
    private let game = AdventureGame()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        choiceButton1.setTitleColor(.black, for: .normal)
        choiceButton2.setTitleColor(.black, for: .normal)
        
        updateUI()
    }
    
    
    
    
    
    @IBAction func choiceButton1Tapped(_ sender: UIButton) {
        let node = game.currentNode
              
              if node.outcome == .ongoing {
                  // Choose option 0
                  game.chooseOption(at: 0)
              } else {
                  // If adventure has ended, use button 1 as "Play again"
                  game.reset()
              }
              
              updateUI()    }
    
    
    
    

    
    @IBAction func choiceButton2Tapped(_ sender: UIButton) {
        let node = game.currentNode
        
        // Only works during ongoing adventure
        if node.outcome == .ongoing {
            game.chooseOption(at: 1)
            updateUI()
        }    }
    
    private func updateUI() {
        let node = game.currentNode
        
        storyLabel.text = node.text
        
        switch node.outcome {
        case .ongoing:
            // Show buttons with current choices
            choiceButton1.isHidden = false
            choiceButton2.isHidden = node.choices.count < 2
            
            if node.choices.indices.contains(0) {
                choiceButton1.setTitle(node.choices[0].title, for: .normal)
            }
            if node.choices.indices.contains(1) {
                choiceButton2.setTitle(node.choices[1].title, for: .normal)
            }
            
        case .success:
            // Show ending and turn button1 into "Play again"
            storyLabel.text = node.text + "\n\nYou succeeded! Tap below to play again."
            choiceButton1.isHidden = false
            choiceButton1.setTitle("Play again", for: .normal)
            choiceButton2.isHidden = true
            
        case .failure:
            storyLabel.text = node.text + "\n\nYou failed! Tap below to try again."
            choiceButton1.isHidden = false
            choiceButton1.setTitle("Try again", for: .normal)
            choiceButton2.isHidden = true
        }
    }
}

