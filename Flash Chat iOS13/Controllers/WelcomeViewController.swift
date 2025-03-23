//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func animateTitle(){
        let titleText = titleLabel.text!
        titleLabel.text = ""
        for (index,char) in titleText.enumerated(){
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(index + 1), repeats: false) { timer in
                self.titleLabel.text?.append(char)
            }
        }
    }

}
