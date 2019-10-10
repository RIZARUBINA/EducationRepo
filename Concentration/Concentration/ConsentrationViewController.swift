//
//  ViewController.swift
//  Concentration
//
//  Created by Margarita Zarubina on 27/08/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import UIKit

class ConsentrationViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards:Int {
            return ((cardButtons.count + 1) / 2)
    }
    
    private(set) var flipCount = 0 {
        didSet{
           updateFlipCountLabel()
        }
    }
    private func updateFlipCountLabel(){
        let attributes: [NSAttributedString.Key: Any]=[
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        ]
        let attributedString=NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet{
            updateFlipCountLabel()
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber=cardButtons.firstIndex(of: sender){
            //print("\n")
            //print("\n this is all emoji \(emoji)")
            //print("\n this is a card number \(cardNumber)")
            
           game.chooseCard(at: cardNumber)
           updateViewFromModel()
        }else{
            print("doesn't found")
        }
        
        
    }
    func updateViewFromModel(){
        if cardButtons != nil {
            for index in cardButtons.indices{
                let button=cardButtons[index]
                let card=game.cards[index]
                if card.isFaceUp{
                    //print("Card is faced up \(index)")
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }else{
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 0) : #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
                }
            }
        }
    }

    
    var theme : String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
//    private var emojiChoices = ["👻","🎃","🧙🏻‍♀️","🧟‍♂️","👽","👹","💀","🕷","🌙"]
    private var emojiChoices = "👻🎃🧙🏻‍♀️🧟‍♂️👽👹💀🕷🌙"
    private var emoji =  [Card:String]()
    
    
//something wrong there
    private func emoji(for card: Card)->String{
        //print("The  emoji of the card is a \(emoji[card])")
        if emoji[card] == nil, emojiChoices.count > 0 {
            print("Function emoji run")
            
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            
            emoji[card]=String(emojiChoices.remove(at: randomStringIndex))
            print(emoji[card] ?? "non")
        }
        print(emoji)
        return emoji[card] ?? "?"
       
    }
    
}


extension Int{
    var arc4random: Int {
        print("Random function run")
        if self>0{
            let cur=Int(arc4random_uniform(UInt32(self)))
            //print("!rand \(cur)")
            return cur
        }else if self<0{
            let cur = -Int(arc4random_uniform(UInt32(self)))
            //print("!rand \(cur)")
            return cur
        }else{
            return 0
        }
       
    }
}
