//
//  AnswersVC.swift
//  iQuiz
//
//  Created by iosdev on 11/5/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit

class AnswersVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillAnswers()
        // Do any additional setup after loading the view.
    }
    
    var appdata = AppData.shared
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    
    func fillAnswers()  {
        
        if appdata.currentCorrect {
            result.text = "Correct!"
            appdata.totalCorrect = appdata.totalCorrect + 1
        } else {
            result.text = "Incorrect"
        }
        
        switch appdata.topicIdx {
        case 0:
            correctAnswer.text = appdata.banjoResult[appdata.topicQuestion]
        case 1:
            correctAnswer.text = appdata.moviesResult[appdata.topicQuestion]

        default:
            correctAnswer.text = appdata.sportsResult[appdata.topicQuestion]

        }
        appdata.currentCorrect = false;
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
        switch appdata.topicIdx {
        case 0:
            if appdata.topicQuestion < appdata.banjoQuestions.count - 1 {
                appdata.topicQuestion = appdata.topicQuestion + 1
                performSegue(withIdentifier: "segueToQuestions", sender: self)

            } else {
                appdata.topicQuestion = 0
                performSegue(withIdentifier: "segueToFinal", sender: self)

            }
                
        case 1:
            if appdata.topicQuestion < appdata.moviesQuestions.count - 1 {
                appdata.topicQuestion = appdata.topicQuestion + 1
                performSegue(withIdentifier: "segueToQuestions", sender: self)
                
            } else {
                appdata.topicQuestion = 0
                performSegue(withIdentifier: "segueToFinal", sender: self)
                
            }
        default:
            if appdata.topicQuestion < appdata.moviesQuestions.count - 1 {
                appdata.topicQuestion = appdata.topicQuestion + 1
                performSegue(withIdentifier: "segueToQuestions", sender: self)
                
            } else {
                appdata.topicQuestion = 0
                performSegue(withIdentifier: "segueToFinal", sender: self)
                
            }
        }
    }
    
}
