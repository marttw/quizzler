//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Martiniano Villalba on 14/03/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
  let text: String
  let answers: [String]
  let correct: String
  
  init(q: String, a: [String], correctAnswer:String) {
    text = q
    answers = a
    correct = correctAnswer
  }
  
}
