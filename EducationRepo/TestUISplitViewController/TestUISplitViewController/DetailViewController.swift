//
//  DetailViewController.swift
//  TestUISplitViewController
//
//  Created by Margarita Zarubina on 05/09/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var weaponImageView: UIImageView!
    
    var monster: Monster? {
        didSet {
            refreshUI()
        }
    }
    
    func refreshUI() {
        loadViewIfNeeded()
        nameLabel.text = monster?.name
        discriptionLabel.text = monster?.description
        iconImageView.image = monster?.icon
        weaponImageView.image = monster?.weaponImage
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetailViewController: MonsterSelectionDelegate {
    func monsterSelected(_ newMonster: Monster) {
        monster = newMonster
    }
}
