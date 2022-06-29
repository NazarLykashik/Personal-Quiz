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
    
    //MARK: Private Properties
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        uppdateIU()


    }
 
    //MARK: Private Metods
    
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
        let totalProgress = Float(questionIndex / questions.count)
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
            break
        case .ranged:
            break
            
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
    }
    /// Setup multiple stack view
    ///
    /// - Parameter answers: array with  answers
    ///
    /// description 
    private func updateMultipleSrackView(using answers: [Answer]){
        
    }
}
