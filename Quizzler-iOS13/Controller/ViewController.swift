//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var progressBar: UIProgressView!
  @IBOutlet weak var optionA: UIButton!
  @IBOutlet weak var optionB: UIButton!
  @IBOutlet weak var optionC: UIButton!
  
  var quizBrain = QuizBrain()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    
    let userAnswer = sender.currentTitle! // True, False
    let userGotItRight = quizBrain.checkAnswer(userAnswer)
    
    if userGotItRight  {
      sender.backgroundColor = UIColor.green
    }
    
    else {
      sender.backgroundColor = UIColor.red
    }
    
    quizBrain.nextQuestion()
    
    Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
  }
  
  @objc func updateUI() {
    questionLabel.text = quizBrain.getQuestionText()//quiz[questionNumber].text
    let answerOptions = quizBrain.getAnswers()
       
    optionA.setTitle(answerOptions[0], for: .normal)
    optionB.setTitle(answerOptions[1], for: .normal)
    optionC.setTitle(answerOptions[2], for: .normal)
    progressBar.progress = quizBrain.getProgress()
    scoreLabel.text = "Score: \(quizBrain.getScore())"
    optionA.backgroundColor = UIColor.clear
    optionB.backgroundColor = UIColor.clear
    optionC.backgroundColor = UIColor.clear
    }
  
}

