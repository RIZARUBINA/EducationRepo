//
//  ViewController.swift
//  AutoLayoutTrening
//
//  Created by Margarita Zarubina on 30/08/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.title(for: .normal) == "X"{
            sender.setTitle(" A very long titile for this button", for: .normal)
        }else{
            sender.setTitle("X", for: .normal)
        }
    }
    


}

