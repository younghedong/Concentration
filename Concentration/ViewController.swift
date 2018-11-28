//
//  ViewController.swift
//  Concentration
//
//  Created by hedong on 24/11/2018.
//  Copyright © 2018 hedong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emjioChoices = ["👻", "🎃", "🎃", "👻"]
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardIndex = cardButtons.index(of: sender) {
            flipCard(withEmoji: emjioChoices[cardIndex], on: sender)
        }
        
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if (button.currentTitle == emoji) {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.orange;
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = UIColor.white
        }
    }
}

