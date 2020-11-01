//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Mohammed Sadiq on 01/11/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    private let quiz = [
        Question(question: "Which is the largest organ in the human body?", options: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(question: "Five dollars is worth how many nickels?", options: ["25", "50", "100"], correctAnswer: "100"),
        Question(question: "What do the letters in the GMT time zone stand for?", options: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(question: "What is the French word for 'hat'?", options: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(question: "In past times, what would a gentleman keep in his fob pocket?", options: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(question: "How would one say goodbye in Spanish?", options: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(question: "Which of these colours is NOT featured in the logo for Google?", options: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(question: "What alcoholic drink is made from molasses?", options: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(question: "What type of animal was Harambe?", options: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(question: "Where is Tasmania located?", options: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    private var currentQuestionNumber: Int = 0
    private var currentScore: Int = 0
    
    var progressSoFar: Float {
        return Float(currentQuestionNumber + 1) / Float(quiz.count)
    }
    
    var currectQuestion: Question {
        return quiz[currentQuestionNumber]
    }
    
    var score: Int {
        get {
            return currentScore
        }
    }
    
    mutating func next() {
        currentQuestionNumber = (currentQuestionNumber + 1) % quiz.count
        
        if currentQuestionNumber == 0 {
            currentScore = 0
        }
    }
    
    mutating func isValid(answer: String) -> Bool {
        if answer == currectQuestion.correctAnswer {
            currentScore += 1
            return true
        } else {
            return false
        }
    }
}
