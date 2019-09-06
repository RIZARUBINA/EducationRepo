//
//  ViewController.swift
//  TestTableView
//
//  Created by Margarita Zarubina on 05/09/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }

  
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        
        mealNameLabel.text = "Default Text"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
        
    }
    func textFieldDidEndEditing(_ textField: UITextField){
        
        mealNameLabel.text = textField.text
    }
    
}

