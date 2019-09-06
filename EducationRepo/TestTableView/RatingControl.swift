//
//  RatingControl.swift
//  TestTableView
//
//  Created by Margarita Zarubina on 06/09/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    private var ratingButtons=[UIButton]()
    var rating=0{
        didSet{
            updateButtonSelectionStates()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet {
            setupButtons()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar.png", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar.png", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar.png", in: bundle, compatibleWith: self.traitCollection)
        
        for index in 0..<starCount {
            let button = UIButton()
            //button.backgroundColor = UIColor.red
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.accessibilityLabel = "Set \(index+1) star rating"
            
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            
            addArrangedSubview(button)
            
            
            ratingButtons.append(button)
        }
        updateButtonSelectionStates()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }

    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("Button isn't in the array")
        }
        let selectedRaiting = index+1
        
        if selectedRaiting==rating{
            rating=0
        }
        else{
            rating=selectedRaiting
        }
    }
    
    private func updateButtonSelectionStates() {
        for (index,button) in ratingButtons.enumerated(){
            button.isSelected=index<rating
            let hintString: String?
            if rating==index+1{
                hintString="Tap to reset to zero"
            }else{
                hintString=nil
            }
            
            let valueString:String
            switch rating{
            case 0: valueString="No rating set"
            case 1: valueString="One star set"
            default:
                valueString="\(rating) stars set"
            }
            
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}
