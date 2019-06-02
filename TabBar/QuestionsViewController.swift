//
//  QuestionsViewController.swift
//  TabBar
//
//  Created by Florian Bernard on 01/06/2019.
//  Copyright © 2019 Florian Bernard. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var horizontalSlider: UISlider!
    @IBOutlet weak var sliderLabel1: UILabel!
    @IBOutlet weak var sliderLabel2: UILabel!
    @IBOutlet weak var sliderValidateButton: UIButton!
    
    
    @IBOutlet weak var simpleView: UIStackView!
    @IBOutlet weak var simpleButton1: UIButton!
    @IBOutlet weak var simpleButton2: UIButton!
    @IBOutlet weak var simpleButton3: UIButton!
    @IBOutlet weak var simpleButton4: UIButton!
    
    
    @IBOutlet weak var multipleView: UIStackView!
    @IBOutlet weak var switchLabel1: UILabel!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switchLabel2: UILabel!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switchLabel3: UILabel!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switchLabel4: UILabel!
    @IBOutlet weak var switch4: UISwitch!
    @IBOutlet weak var multipleValidateButton: UIButton!
    
    
    let questions = questionsStub
    
    var questionIndex = 0
    var answersChosen : [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleButton1.layer.cornerRadius = 10
        simpleButton2.layer.cornerRadius = 10
        simpleButton3.layer.cornerRadius = 10
        simpleButton4.layer.cornerRadius = 10
        sliderValidateButton.layer.cornerRadius = 10
        multipleValidateButton.layer.cornerRadius = 10
        
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResult"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.responses = answersChosen
        }
    }
    
    func updateUI(){
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let progress = Float(questionIndex) / Float(questions.count)

        sliderView.isHidden = true
        simpleView.isHidden = true
        multipleView.isHidden = true
        
        navigationItem.title = "Question \(questionIndex + 1)"
        
        questionLabel.text = currentQuestion.text
        progressBar.setProgress(progress, animated: true)
        
        switch currentQuestion.type {
        case .slider :
                updateSliderView(using: currentAnswers)
            
        case .single :
                updateSimpleView(using: currentAnswers)
            
        case .multiple :
                updateMultipleView(using: currentAnswers)
        }
    }
    
    func updateSliderView(using answers: [Answer]){
        sliderView.isHidden = false
        horizontalSlider.value = 0.5
        
        sliderLabel1.text = answers.first?.text
        sliderLabel2.text = answers.last?.text
    }
    
    func updateSimpleView(using answers: [Answer]){
        simpleView.isHidden = false
        simpleButton1.setTitle(answers[0].text, for: .normal)
        simpleButton2.setTitle(answers[1].text, for: .normal)
        simpleButton3.setTitle(answers[2].text, for: .normal)
        simpleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleView(using answers: [Answer]){
        multipleView.isHidden = false
        switch1.isOn = false
        switch2.isOn = false
        switch3.isOn = false
        switch4.isOn = false
        
        switchLabel1.text = answers[0].text
        switchLabel2.text = answers[1].text
        switchLabel3.text = answers[2].text
        switchLabel4.text = answers[3].text
    }
    
    @IBAction func switchValidatedButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        
        if switch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if switch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if switch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if switch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func simpleValidatedButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender{
        case simpleButton1:
            answersChosen.append(currentAnswers[0])
        case simpleButton2:
            answersChosen.append(currentAnswers[1])
        case simpleButton3:
            answersChosen.append(currentAnswers[2])
        case simpleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func sliderValidatedButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        
        let index = Int(round(horizontalSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    func nextQuestion(){
        if(questionIndex < questions.count - 1){
            questionIndex += 1
            updateUI()
        } else {
            performSegue(withIdentifier: "ShowResult", sender: nil)
        }
    }
}
