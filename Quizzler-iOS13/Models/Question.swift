//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Mohammed Sadiq on 01/11/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let options: [String]
    let correctAnswer: String
    
    init(question: String, options: [String], correctAnswer: String) {
        self.text = question
        self.options = options
        self.correctAnswer = correctAnswer
    }
}
