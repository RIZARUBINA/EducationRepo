//
//  ViewController.swift
//  PlayingCard
//
//  Created by Margarita Zarubina on 29/08/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck=PlayingCardDeck()
    
    
    
    @IBOutlet var cardViews: [PlayingCardView]!
    
    lazy var animator = UIDynamicAnimator(referenceView: view)
    
    lazy var cardBehavior = CardBehavior(in: animator)
    
    override func viewDidLoad(){
        super.viewDidLoad()
        var cards = [PlayingCard]()
        for _ in 1...((cardViews.count + 1)/2) {
            let card = deck.draw()!
            cards += [card, card]
        }
        for cardView in cardViews {
            cardView.isFaceUp = false
            let card = cards.remove(at: cards.count.arc4random)
            cardView.rank = card.rank.order
            cardView.suit = card.suit.rawValue
            cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipCard(_:))))
            cardBehavior.addItem(cardView)
            
            
            
        }
        
    }
    
//    @IBOutlet weak var playingCardView: PlayingCardView!{
//        didSet{
//            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
//            swipe.direction = [.left, .right]
//            playingCardView.addGestureRecognizer(swipe)
//
//            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy: )))
//            playingCardView.addGestureRecognizer(pinch)
//        }
//    }
    
    
//        @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
//            switch sender.state {
//            case .ended:
//                playingCardView.isFaceUp = !playingCardView.isFaceUp
//            default:
//                break
//            }
//    
//        }
    
//    @objc func nextCard(){
//        if let card = deck.draw() {
//            playingCardView.rank = card.rank.order
//            playingCardView.suit = card.suit.rawValue
//        }
//    }
    
    private var faceUpCardViewMatched: Bool{
        return faceUpCardViews.count == 2 &&
            faceUpCardViews[0].rank == faceUpCardViews[1].rank &&
            faceUpCardViews[0].suit == faceUpCardViews[1].suit
    }
    
    private var faceUpCardViews: [PlayingCardView]{
        return cardViews.filter {$0.isFaceUp && !$0.isHidden && $0.transform != CGAffineTransform.identity.scaledBy(x: 3.0, y: 3.0) && $0.alpha == 1 }
    }
    
    var lastChoosenCardView: PlayingCardView?
    
    @objc func flipCard(_ recognizer : UITapGestureRecognizer){
        switch recognizer.state {
        case .ended:
            print(faceUpCardViews.count)
            if let choosenCardView = recognizer.view as? PlayingCardView, faceUpCardViews.count < 2{
                lastChoosenCardView = choosenCardView
                cardBehavior.removeItem(choosenCardView)
                UIView.transition(with: choosenCardView,
                                  duration: 0.6,
                                  options: [.transitionFlipFromLeft],
                                  animations: {
                                    choosenCardView.isFaceUp = !choosenCardView.isFaceUp
                }, completion: {finished in
                    print("1!")
                    let cardsToAnimate = self.faceUpCardViews
                    if self.faceUpCardViewMatched {
                        print("2!")
                        UIViewPropertyAnimator.runningPropertyAnimator(
                            withDuration: 0.6,
                            delay: 0,
                            options: [],
                            animations: {
                                cardsToAnimate.forEach{
                                    $0.transform = CGAffineTransform.identity.scaledBy(x: 3.0, y: 3.0)
                                }
                        },
                            completion: { position in
                                UIViewPropertyAnimator.runningPropertyAnimator(
                                    withDuration: 0.75,
                                    delay: 0,
                                    options: [],
                                    animations: {
                                        cardsToAnimate.forEach{
                                            $0.transform = CGAffineTransform.identity.scaledBy(x: 0.1, y: 0.1)
                                            $0.alpha = 0
                                        }
                                },
                                    completion: { position in
                                        cardsToAnimate.forEach{
                                            $0.isHidden = true
                                            $0.alpha = 1
                                            $0.transform = .identity
                                        }
                                }
                                )
                        }
                        )
                    } else if cardsToAnimate.count == 2 {
                        if choosenCardView == self.lastChoosenCardView {
                            cardsToAnimate.forEach(){ cardView in
                                UIView.transition(with: cardView,
                                                  duration: 0.5,
                                                  options: [.transitionFlipFromLeft],
                                                  animations: {
                                                    cardView.isFaceUp = false
                                },
                                                  completion: { finished in
                                                    self.cardBehavior.addItem(cardView)
                                                    
                                }
                                )
                            }
                        } else {
                            if !choosenCardView.isFaceUp{
                                self.cardBehavior.addItem(choosenCardView)
                            }
                        }
                    }}
                )
            }
        default: break
        }
    }
    
    
}

