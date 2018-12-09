//
//  Concentration.swift
//  Concentration
//
//  Created by hedong on 28/11/2018.
//  Copyright © 2018 hedong. All rights reserved.
//

import Foundation

class Concentration {
    var cards = Array<Card>()
    var isChoosed : Int?
    
    init(cardsNumber: Int) {
        for _ in 0...cardsNumber {
            let card = Card()
            self.cards.append(card)
            self.cards.append(card)
        }
    }
    
    func chooseCard(at index: Int) {
        if isChoosed == nil {
            cards[index].isFaceUp = true
            self.isChoosed = 1
        } else {
            for i in self.cards.indices {
                if self.cards[i].isFaceUp == true && self.cards[i].isMatched == false {
                    if cards[i].identifier == self.cards[index].identifier {
                        cards[index].isFaceUp = true
                        cards[index].isMatched = true
                        cards[i].isMatched = true
                        self.isChoosed = nil
                    } else {
                        self.cards[i].isFaceUp = false
                        self.isChoosed = nil
                    }
                }
            }
        }
    }
    
    func reset() {
        for index in cards.indices {
            cards[index].isMatched = false
            cards[index].isFaceUp = false
        }
        isChoosed = nil
    }
}
