//
//  ConsentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Margarita Zarubina on 03/10/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import UIKit

class ConsentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {
    
    private var themes = [
        "Christmas":"🎅🤶🧝🧦🦌🍪",
        "Halloween": "💀👻👽🧙🧛🧟🦇",
        "Faces":"😀😁😂🤣😃😄😅",
        "Animals": "🙈🙉🙊💥💦💨💫"
    ]
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConsentrationViewController{
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
    
    @IBAction func changeTheme(_ sender: Any){
        if let cvc = splitViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                cvc.theme = theme
            }
        }else if let cvc = lastSeguedToConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                cvc.theme = theme
            }
            navigationController?.pushViewController(cvc, animated: true)
        }else{
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    private var splitViewDetailConcentrationViewController: ConsentrationViewController?{
        return splitViewController?.viewControllers.last as? ConsentrationViewController
    }

    private var lastSeguedToConcentrationViewController: ConsentrationViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme"{
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                if let cvc = segue.destination as? ConsentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }
}
