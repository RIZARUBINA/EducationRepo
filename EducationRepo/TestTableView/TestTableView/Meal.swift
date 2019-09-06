//
//  Meal.swift
//  TestTableView
//
//  Created by Margarita Zarubina on 06/09/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import UIKit

class Meal{
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name:String, photo: UIImage?, rating:Int){
        
        if name.isEmpty||rating<0{
            return nil
        }
        self.name=name
        self.photo=photo
        self.rating=rating
        
        
    }

}
