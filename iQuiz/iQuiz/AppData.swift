//
//  AppData.swift
//  iQuiz
//
//  Created by iosdev on 11/4/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit
import Alamofire



class AppData: NSObject {

    static let shared = AppData()
    
    open var dictionary : [quizList] = []
    open var isOnline = true
    open var topicIdx = 0
    open var topicQuestion = 0
    open var currentCorrect = -1
    open var totalCorrect = 0
    open var img : [String] = ["banjo", "movie", "sports"]
    
    public struct quizList: Decodable {
        let title: String
        let desc: String
        let questions: [questionsList]
    }
    
    public struct questionsList: Decodable {
        let text: String
        let answer: String
        let answers: [String]
    }


    func getJSON(link : String) {
        let urlString = link
        guard let url = URL(string: urlString) else
        { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                let list = try
                    JSONDecoder().decode([quizList].self, from: data)
                self.dictionary = list

                print(self.dictionary)
                
            } catch let err{
                print(err)
            }
        }.resume()
        
    }
    
    func getLocalJSON() {
        if let path = Bundle.main.path(forResource: "localFiles", ofType: "JSON") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try
                    JSONDecoder().decode([quizList].self, from: data)
                self.dictionary = jsonResult
                print(self.dictionary[0].title)
                print(jsonResult)
            } catch {
                print("local didn't work")
            }
        } else {
            print("JSON not found")
        }
    }
    
    
    
    
}

//    func getJSON(url : String)  {
//        self.dictionary = self.getLocalJSON()
////        Alamofire.request(url).responseJSON { response in
////            if let resp = response.result.value {
////                print(resp)
////                guard let onlineDict = resp["title"] as? NSDictionary  else {
////                    print("Couldn't find url")
////                    self.isOnline = false
////
////                    return
////                }
////
////                print(onlineDict)
////                if (self.isOnline) {
////                    self.dictionary = onlineDict
////                } else {
////                    print("hi")
////                    self.dictionary = self.getLocalJSON()
////                }
////
////
////            }
////        }
//    }
    
//    func getLocalJSON() -> NSDictionary {
//        print("Hello")
//        if let path = Bundle.main.path(forResource: "localFiles", ofType: "JSON") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>{
//                    print(jsonResult)
//                    return jsonResult as NSDictionary
//                }
//            } catch {
//                print("hi")
//                return [:]
//            }
//        }
//        print("Didn't work")
//        return [:]
//    }
//
//}


//    open var titles : [String] = ["Banjo", "Movies", "Sports"]
//    open var desc : [String] =
//        [
//        "A wide variety of little known facts about the banjo!",
//        "With questions ranging from the early 1900's, you'll be surprised by some of these facts!",
//        "Football? Tennis? Tag? Any sport you're thinking of we got it!"
//        ]
//    open var img : [String] = ["banjo", "movie", "sports"]
//    open var topicIdx = 0
//    open var topicQuestion = 0
//    open var currentCorrect = false
//    open var totalCorrect = 0
//
//    open var banjoQuestions: [String] =
//        [
//            "Where was the banjo originated?",
//            "Which of the following is another name for the banjo?"
//        ]
//    open var moviesQuestions: [String] =
//        [
//            "Which movie won the most Oscars without winning Best Picture?",
//            "What was the first James Bond movie to receive an Oscar?"
//        ]
//    open var sportsQuestions: [String] =
//        [
//            "MLB: Which player holds the record for most consecutive games played?",
//            "NBA: Which of these teams has never won a championship?"
//        ]
//
//
//    open var banjoAnswers: [[String]] =
//        [
//            ["Africa", "Europe", "North America", "South America"],
//            ["Strum Strump", "Banza", "Bonjoe", "All of the above"]
//        ]
//    open var banjoBool: [[Bool]] =
//        [
//            [true, false, false, false],
//            [false, false, false, true]
//        ]
//
//    open var banjoResult: [String] = ["Africa", "All of the above"]
//    //Answers: Africa, All of the above
//
//    open var moviesAnswers: [[String]] =
//        [
//            ["Cabaret (1972)", "Doctor Zhivago (1965)", "The King and I (1956)", "Star Wars (1977)"],
//            ["Diamonds Are Forever (1971)", "From Russia with Love (1963)", "Goldfinger (1964)", "The Spy Who Loved Me (1977)"]
//        ]
//    open var moviesBool: [[Bool]] =
//        [
//            [true, false, false, false],
//            [false, false, true, false]
//        ]
//
//    open var moviesResult: [String] = ["Cabbaret (1972)", "Goldfinger (1964)"]
//    //Answers: Cabaret, Goldfinger
//
//    open var sportsAnswers: [[String]] =
//        [
//            ["Cal Ripkin Jr.", "Pete Rose", "Stan Musal", "Lou Gehrig"],
//            ["Milwaukee Bucks", "Houston Rockets", "Indiana Pacers", "New York Knicks"]
//        ]
//    open var sportsBool: [[Bool]] =
//        [
//            [true, false, false, false],
//            [false, false, true, false]
//        ]
//
//    open var sportsResult: [String] = ["Cal Ripkin Jr.", "Indiana Pacers"]
//    //Answers: Cal Ripkin Jr., Indiana Pacers
//}
