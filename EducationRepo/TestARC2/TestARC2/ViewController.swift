//
//  ViewController.swift
//  TestARC2
//
//  Created by Margarita Zarubina on 11/09/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /*
    var reference1: Vihicle?
    var reference2: Vihicle?
    var reference3: Vihicle?
    var timer: Timer?
    var count=0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reference1 = Vihicle(type: "CloudCar")
        reference2=reference1
        reference3=reference1
        timer=Timer.scheduledTimer(timeInterval: 1.0,target: self, selector: #selector(self.step), userInfo: nil, repeats: true)
    }
    @objc func step(){
        if count >= 3{
            reference3 = nil
            reference2 = nil
            print("the reference remains!")
        }
        if count >= 5 {
            reference1 = nil
            print("our object is deallocated")
        }
        count=count+1
        print("\(count) Step")
        
    }*/
    
    var seatrooper: Stormtrooper?
    var submarine: Vihicle?
    var toogle = false
    let runButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submarine = Vihicle(type: "Aquatic")
        seatrooper = Stormtrooper(specialization: "Aquatic")
        
        submarine!.stormtrooper = seatrooper
        seatrooper!.vehicle = submarine
        
        seatrooper = nil
        submarine = nil
        
        runButton.frame = CGRect(x: 30, y: 30, width: 150, height: 30)
        runButton.setTitle("Run", for: UIControl.State.normal)
        runButton.backgroundColor = UIColor.blue
        runButton.addTarget(self, action: #selector(buttonTapped), for: UIControl.Event.touchUpInside)

        self.view.addSubview(runButton)
        
    }
    @objc func buttonTapped(sender: UIButton){
        print("PUSHED")
    }
    
}

class Vihicle{
    let type:String
    var stormtrooper: Stormtrooper?
    
    
    init(type:String){
        self.type=type
        print("\(type) is being init")
        
    }
    deinit {
        print("\(type) is being deinit")
    }
}

class Stormtrooper {
    let specialization: String
    var vehicle: Vihicle?
    init(specialization: String) {
        self.specialization=specialization
    }
    
    deinit {
        print("Stormtrooper \(specialization) is being deinit")
    }
}
