//
//  ResultViewController.swift
//  TabBar
//
//  Created by Florian Bernard on 01/06/2019.
//  Copyright © 2019 Florian Bernard. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var responses : [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult(){
        var frequencyOfAnswers : [AnimalType : Int] = [:]
        let responsesTypes = responses.map { $0.type }
        
        for response in responsesTypes{
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnsweredSorted = frequencyOfAnswers.sorted { (pair1, pair2) -> Bool in
            pair1.value > pair2.value
        }
        
        let mostCommonAnswer = frequentAnsweredSorted.first!.key
        
        titleLabel.text = "Vous êtes donc \(mostCommonAnswer.rawValue)"
        descriptionLabel.text = mostCommonAnswer.definition
    }

}
