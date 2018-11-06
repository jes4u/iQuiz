//
//  FinishVC.swift
//  iQuiz
//
//  Created by iosdev on 11/5/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit

class FinishVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillFinish()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view.
    }
    
    var appdata = AppData.shared
    
    @IBOutlet weak var congratulatoryTxt: UILabel!
    @IBOutlet weak var finalScore: UILabel!
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 1:
            appdata.topicQuestion = 0
            appdata.currentCorrect = false
            appdata.totalCorrect = 0
            performSegue(withIdentifier: "segueToHome", sender: self)
        case 2:
            appdata.topicQuestion = 0
            appdata.currentCorrect = false
            appdata.totalCorrect = 0
            performSegue(withIdentifier: "segueToHome", sender: self)
        default:
            break
        }
    }
    
    func fillFinish() {
        var numQuestions: Int
        
        switch appdata.topicIdx {
        case 0:
            numQuestions = appdata.banjoQuestions.count
        case 1:
            numQuestions = appdata.moviesQuestions.count
        default:
            numQuestions = appdata.sportsQuestions.count
        }
        
        if appdata.totalCorrect == 0 {
            congratulatoryTxt.text = "Yikes"
        } else if appdata.totalCorrect == numQuestions {
            congratulatoryTxt.text = "Perfect Score!"
        } else {
            congratulatoryTxt.text = "Close. But not close enough"
        }
        
        finalScore.text = "\(appdata.totalCorrect) of \(numQuestions)"
        
        
    }
    
    @IBAction func navToHome(_ sender: Any) {
        appdata.totalCorrect = 0
        performSegue(withIdentifier: "segueToHome", sender: self)

    }
    
}
