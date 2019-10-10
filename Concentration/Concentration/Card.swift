//
//  Card.swift
//  Concentration
//
//  Created by Margarita Zarubina on 27/08/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import Foundation

struct Card:Hashable {
    var isFaceUp=false
    var isMatched=false
    private var identifier: Int
    
    static func ==(lhs:Card, rhs:Card)->Bool{
        return lhs.identifier==rhs.identifier
    }
    
    
    private static var identifierFactory=0
    private static func getUniqueIdentifiere()->Int{
        identifierFactory+=1
        return identifierFactory
    }
    
    init(){
        self.identifier=Card.getUniqueIdentifiere()
    }
}
