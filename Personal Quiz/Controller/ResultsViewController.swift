//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by Nazar Lykashik on 26.06.22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefenitionLabel: UILabel!
    
    
    //MARK: - Public properties
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    private func updateResult(){
        var freqencyOfAnimals: [AnimalType: Int]  = [:]
        let animals = responses.map { $0.type }
        
        for animal in animals {
            freqencyOfAnimals[animal] = (freqencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedFreqencyOfAnimals = freqencyOfAnimals.sorted { $0.value > $1.value }
        
        guard let mostFreqencyAnimal = sortedFreqencyOfAnimals.first?.key else {return}
        
        updateUI(with: mostFreqencyAnimal)
        
    }
    private func updateUI(with animal: AnimalType) {
        resultAnswerLabel.text = "Вы - \(animal.rawValue)"
        resultDefenitionLabel.text = "\(animal.definition)"
    }
}
