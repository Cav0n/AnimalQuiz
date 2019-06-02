//
//  IntroductionViewController.swift
//  TabBar
//
//  Created by Florian Bernard on 01/06/2019.
//  Copyright © 2019 Florian Bernard. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.layer.cornerRadius = 10
    }
    
    @IBAction func unwindToIntroduction(segue: UIStoryboardSegue){
    
    }
}
