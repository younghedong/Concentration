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
    
    var emjioChoices = ["👻", "🎃", "♥️", "🐷", "🐶", "🐼"]
    
    var game = Concentration(cardsNumber: 4)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    @IBAction func reset(_ sender: Any) {
        emjioChoices = ["👻", "🎃", "♥️", "🐷", "🐶", "🐼"]
        flipCount = 0
        game.reset()
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardIndex = cardButtons.index(of: sender) {
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let card = game.cards[index]
            let button = cardButtons[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = UIColor.orange
            }
        }
    }
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emjioChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emjioChoices.count - 1)))
            emoji[card.identifier] = emjioChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

