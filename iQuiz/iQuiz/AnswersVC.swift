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
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view.
    }
    
    var appdata = AppData.shared
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 1:
            appdata.topicQuestion = 0
            appdata.currentCorrect = -1
            appdata.totalCorrect = 0
            performSegue(withIdentifier: "segueAnswersToHome", sender: self)
        case 2:
            btnNext(self)
        default:
            break
        }
    }
    
    func fillAnswers()  {
        
        if appdata.currentCorrect == Int(appdata.dictionary[appdata.topicIdx].questions[appdata.topicQuestion].answer)! {
            result.text = "Correct!"
            appdata.totalCorrect = appdata.totalCorrect + 1
        } else {
            result.text = "Incorrect"
        }
        
        correctAnswer.text = appdata.dictionary[appdata.topicIdx].questions[appdata.topicQuestion].answers[Int(appdata.dictionary[appdata.topicIdx].questions[appdata.topicQuestion].answer)! - 1]
        
        
//        switch appdata.topicIdx {
//        case 0:
//            correctAnswer.text = appdata.banjoResult[appdata.topicQuestion]
//        case 1:
//            correctAnswer.text = appdata.moviesResult[appdata.topicQuestion]
//
//        default:
//            correctAnswer.text = appdata.sportsResult[appdata.topicQuestion]
//
//        }
        appdata.currentCorrect = -1;
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
//        switch appdata.topicIdx {
//        case 0:
//            if appdata.topicQuestion < appdata.dictionary[appdata.topicIdx].questions.count - 1 {
//                appdata.topicQuestion = appdata.topicQuestion + 1
//                performSegue(withIdentifier: "segueToQuestions", sender: self)
//
//            } else {
//                appdata.topicQuestion = 0
//                performSegue(withIdentifier: "segueToFinal", sender: self)
//
//            }
//
//        case 1:
//            if appdata.topicQuestion < appdata.moviesQuestions.count - 1 {
//                appdata.topicQuestion = appdata.topicQuestion + 1
//                performSegue(withIdentifier: "segueToQuestions", sender: self)
//
//            } else {
//                appdata.topicQuestion = 0
//                performSegue(withIdentifier: "segueToFinal", sender: self)
//
//            }
//        default:
            if appdata.topicQuestion < appdata.dictionary[appdata.topicIdx].questions.count - 1 {
                appdata.topicQuestion = appdata.topicQuestion + 1
                performSegue(withIdentifier: "segueToQuestions", sender: self)
                
            } else {
                appdata.topicQuestion = 0
                performSegue(withIdentifier: "segueToFinal", sender: self)
                
            }
        }
    }
    

