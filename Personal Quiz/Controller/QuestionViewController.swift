//
//  QuestionViewController.swift
//  Personal Quiz
//
//  Created by Nazar Lykashik on 26.06.22.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //MARK: - IB Outlets
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLables: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var qeustionProgreView: UIProgressView!
    
    //MARK: - Private Properties
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        uppdateIU()


    }
    
    // MARK: - IB Actions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers =  questions[questionIndex].ansvers
        guard let currentIndex = singleButtons.firstIndex(of: sender) else {return}
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].ansvers
        
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn{
                answersChoosen.append(answer)
            }
        }
            nextQuestion()
    }
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].ansvers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChoosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    
    
    //MARK: - Private Metods
    
    //Uppdate user interface
    private func uppdateIU(){
        //Hide evrythyng
        for stackView  in [singleStackView, multipleStackView,rangedStackView]{
                stackView?.isHidden = true
        }
        //get current question
        let currentQuestion = questions[questionIndex]
        // Set current question for current qestion
        questionLabel.text = currentQuestion.text
        //  calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        // Set progress for question progress view
        qeustionProgreView.setProgress(totalProgress, animated: true)
        //  set navigation title
        title = "Вопрос № \(questionIndex + 1)  из \(questions.count)"
        
        let currentAnswers = currentQuestion.ansvers
        //show stack view corresponding to question type
        switch currentQuestion.type{
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleSrackView(using: currentAnswers)
        case .ranged:
            updateRangedSrackView(using: currentAnswers)
            
        }
    }
    /// setup single stack view
    ///
    /// - Parameter answers: - array with answers
    ///
    /// description
    private func updateSingleStackView(using answers: [Answer]){
        // show single stack view
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    /// Setup multiple stack view
    ///
    /// - Parameter answers: array with  answers
    ///
    /// description 
    private func updateMultipleSrackView(using answers: [Answer]){
        // show multiple stack view
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    /// Setup ranged stack view
    ///
    /// - Parameter answers: array with  answers
    ///
    /// description
    private func updateRangedSrackView(using answers: [Answer]){
        // show ranged stack view
        rangedStackView.isHidden = false
        
        rangedLables.first?.text = answers.first?.text
        rangedLables.last?.text = answers.last?.text
    }
    //MARK: - Navigation
    // show next question or go to the next screen
    private func nextQuestion() {
    questionIndex += 1
        
        if questionIndex < questions.count {
            uppdateIU()
        }else{
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else {return}
        let resultVC = segue.destination as! ResultsViewController
        resultVC.responses = answersChoosen
    }
}


