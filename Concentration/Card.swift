//
//  Card.swift
//  Concentration
//
//  Created by hedong on 28/11/2018.
//  Copyright © 2018 hedong. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierCount = 0
    
    static func genIdentifier() -> Int{
        self.identifierCount += 1
        return self.identifierCount
    }
    
    init() {
        self.identifier = Card.genIdentifier()
    }
}
