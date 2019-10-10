//
//  Concentration.swift
//  Concentration
//
//  Created by Margarita Zarubina on 27/08/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//
//MODEL: model
import Foundation
struct Concentration{
    private(set) var cards = [Card]()
    
    private var indexOfOneAnyOnlyFaceUpCard: Int?{
        get{
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
            
            
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
        
    }
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index): choosen index not in the cards")
        if !cards[index].isMatched{
            //print("this is a indexOfOneAnyOnlyFaceUpCard \(indexOfOneAnyOnlyFaceUpCard)")
            if let matchIndex = indexOfOneAnyOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index]{
                    //print("They are the same!!!")
                    cards[matchIndex].isMatched=true
                    cards[index].isMatched=true
                }
                cards[index].isFaceUp=true
            }else{
                indexOfOneAnyOnlyFaceUpCard=index
            }
        }
    }
    
    init( numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards>0,"Concentration.init(at: \(numberOfPairsOfCards): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards{
             let card = Card()
             cards += [ card,card ]
            
            
        }
        //cards.shuffle()
        //print(cards)
       
    }
}


extension Collection{
    var oneAndOnly: Element? {
        return count==1 ? first: nil
    }
}
