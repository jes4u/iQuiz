//
//  QuestionsVC.swift
//  iQuiz
//
//  Created by iosdev on 11/5/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit

class QuestionsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        // Do any additional setup after loading the view.
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    var appdata = AppData.shared
    @IBOutlet weak var lblQuestion: UITextView!
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 1:
            appdata.topicQuestion = 0
            appdata.currentCorrect = false
            appdata.totalCorrect = 0
            performSegue(withIdentifier: "segueQuestionToHome", sender: self)
        case 2:
            performSegue(withIdentifier: "segueQuestionsToAnswers", sender: self)
        default:
            break
        }
    }
    
    func newQuestion() {
        switch appdata.topicIdx {
        // Seattle
        case 0:
            lblQuestion.text = appdata.banjoQuestions[appdata.topicQuestion]
            option1.setTitle(appdata.banjoAnswers[appdata.topicQuestion][0], for: .normal)
            option2.setTitle(appdata.banjoAnswers[appdata.topicQuestion][1], for: .normal)
            option3.setTitle(appdata.banjoAnswers[appdata.topicQuestion][2], for: .normal)
            option4.setTitle(appdata.banjoAnswers[appdata.topicQuestion][3], for: .normal)
        case 1:
            lblQuestion.text = appdata.moviesQuestions[appdata.topicQuestion]
            option1.setTitle(appdata.moviesAnswers[appdata.topicQuestion][0], for: .normal)
            option2.setTitle(appdata.moviesAnswers[appdata.topicQuestion][1], for: .normal)
            option3.setTitle(appdata.moviesAnswers[appdata.topicQuestion][2], for: .normal)
            option4.setTitle(appdata.moviesAnswers[appdata.topicQuestion][3], for: .normal)
        default:
            lblQuestion.text = appdata.sportsQuestions[appdata.topicQuestion]
            option1.setTitle(appdata.sportsAnswers[appdata.topicQuestion][0], for: .normal)
            option2.setTitle(appdata.sportsAnswers[appdata.topicQuestion][1], for: .normal)
            option3.setTitle(appdata.sportsAnswers[appdata.topicQuestion][2], for: .normal)
            option4.setTitle(appdata.sportsAnswers[appdata.topicQuestion][3], for: .normal)
        }
    }
    
    
    @IBAction func btnOption1Pressed(_ sender: Any) {
        switch appdata.topicIdx {
        case 0:
            appdata.currentCorrect = appdata.banjoBool[appdata.topicQuestion][0]
        case 1:
            appdata.currentCorrect = appdata.moviesBool[appdata.topicQuestion][0]
        default:
            appdata.currentCorrect = appdata.sportsBool[appdata.topicQuestion][0]
        }
    }
    @IBAction func btnOption2Pressed(_ sender: Any) {
        switch appdata.topicIdx {
        case 0:
            appdata.currentCorrect = appdata.banjoBool[appdata.topicQuestion][1]
        case 1:
            appdata.currentCorrect = appdata.moviesBool[appdata.topicQuestion][1]
        default:
            appdata.currentCorrect = appdata.sportsBool[appdata.topicQuestion][1]
        }
    }
    @IBAction func btnOption3Pressed(_ sender: Any) {
        switch appdata.topicIdx {
        case 0:
            appdata.currentCorrect = appdata.banjoBool[appdata.topicQuestion][2]
        case 1:
            appdata.currentCorrect = appdata.moviesBool[appdata.topicQuestion][2]
        default:
            appdata.currentCorrect = appdata.sportsBool[appdata.topicQuestion][2]
        }
    }
    @IBAction func btnOption4Pressed(_ sender: Any) {
        switch appdata.topicIdx {
        case 0:
            appdata.currentCorrect = appdata.banjoBool[appdata.topicQuestion][3]
        case 1:
            appdata.currentCorrect = appdata.moviesBool[appdata.topicQuestion][3]
        default:
            appdata.currentCorrect = appdata.sportsBool[appdata.topicQuestion][3]
        }
    }
    
    @IBAction func submit(_ sender: Any) {
        
        performSegue(withIdentifier: "segueGoToAnswers", sender: self)

    }
    
}
