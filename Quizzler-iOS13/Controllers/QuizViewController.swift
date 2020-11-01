//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!

    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateProgressIndicatorAndCurrentQuestionText()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        
        sender.backgroundColor = quizBrain.isValid(answer: userAnswer) ? .green : .red
        
        quizBrain.next()
        
        updateProgressIndicatorAndCurrentQuestionText()
    }
    
    
    func updateProgressIndicatorAndCurrentQuestionText() {
        questionLabel.text = quizBrain.currectQuestion.text
        optionOne.setTitle(quizBrain.currectQuestion.options[0], for: .normal)
        optionTwo.setTitle(quizBrain.currectQuestion.options[1], for: .normal)
        optionThree.setTitle(quizBrain.currectQuestion.options[2], for: .normal)

        progressView.progress = quizBrain.progressSoFar
        
        scoreLabel.text = "Score : \(quizBrain.score)"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
            self.optionOne.backgroundColor = .clear
            self.optionTwo.backgroundColor = .clear
            self.optionThree.backgroundColor = .clear
        }
    }
}
