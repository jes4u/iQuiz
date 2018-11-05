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
        // Do any additional setup after loading the view.
    }
    
    var appdata = AppData.shared

    
    @IBOutlet weak var congratulatoryTxt: UILabel!
    @IBOutlet weak var finalScore: UILabel!
    
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
