//
//  FirstViewController.swift
//  sample_project
//
//  Created by Kelsey Lieberman on 8/27/20.
//  Copyright © 2020 Kelsey Lieberman. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var darkModeButton: UIButton!
    
    var isDark = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func darkModeButtonPressed(_ sender: Any) {
        if isDark { //Current mode is dark mode
            isDark = false
            self.overrideUserInterfaceStyle = .light //Change to light mode
        } else { //Current mode is light mode
            isDark = true
            self.overrideUserInterfaceStyle = .dark //Change to dark mode
        }
    }
    
}
