//
//  TestView.swift
//  AutoLayoutTrening
//
//  Created by Margarita Zarubina on 03/09/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import UIKit

class TestView: UIView {
    
    @IBInspectable
    public var radius: Int = 0 {
        didSet {
            layer.cornerRadius = CGFloat(radius)
        }
    }
    @IBInspectable
    public var color: UIColor = .white {
        didSet {
            backgroundColor = color
        }
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
