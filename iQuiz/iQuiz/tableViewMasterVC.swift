////
////  ViewController.swift
////  iQuiz
////
////  Created by iosdev on 10/27/18.
////  Copyright © 2018 iosdev. All rights reserved.
////
//
//import UIKit
//    
//    class Topics {
//        let banjoFacts = ["Origination", "Musicians", "Song", "Facts"]
//        let movies = ["Movie Titles", "Directors", "Genres", "Facts"]
//        let sports = ["Players", "Moments", "Controversies" , "Facts"]
//    }
//
//    class TopicsRepository {
//        
//        static func instance() -> TopicsRepository {
//            return theInstance
//        }
//        
//        private static let theInstance = TopicsRepository()
//        
////        func getFamily(lastName: String) -> Topics? {
////            if lastName == "Neward" {
////                return Family() // this would normally have Neward family data in it
////            }
////            else {
////                return nil
////            }
////        }
//    }
//    
//    class TopicsDataSource : NSObject, UITableViewDataSource {
//        init(topics : Topics) {
//            self.topics = topics
//        }
//        
//        let topics : Topics
//        
//        //Do I need this
//        func numberOfSections(in tableView: UITableView) -> Int {
//            return 3
//        }
//        
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            if section == 0 {
//                return topics.banjoFacts.count
//            }
//            else if section == 1 {
//                return topics.movies.count
//            }
//            else if section == 2 {
//                return topics.sports.count
//            }
//            else {
//                assert(false, "Should never be more than three sections")
//            }
//        }
//        
//        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//            if section == 0 {
//                return "Banjo Facts"
//            }
//            else if section == 1 {
//                return "Movies"
//            }
//            else if section == 2 {
//                return "Sports"
//            }
//            else {
//                assert(false, "Should never be more than three sections")
//            }
//        }
//        
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            NSLog("IndexPath: \(indexPath.item), \(indexPath.row), \(indexPath.section)")
//            var cell = tableView.dequeueReusableCell(withIdentifier: "NameTableIdentifier")
//            if cell == nil {
//                NSLog("Creating new UITableViewCell")
//                cell = UITableViewCell(style: .default, reuseIdentifier: "NameTableIdentifier")
//            }
//            
//            if indexPath.section == 0 {
//                cell?.textLabel?.text = topics.banjoFacts[indexPath.row]
//            }
//            else if indexPath.section == 1 {
//                cell?.textLabel?.text = topics.movies[indexPath.row]
//            }
//            else if indexPath.section == 2 {
//                cell?.textLabel?.text = topics.sports[indexPath.row]
//            }
//            else {
//                assert(false, "Should never get section number \(indexPath.section)")
//            }
//            
//            return cell!
//        }
//    }
//
//    class tableViewMasterVC: UIViewController, UITableViewDelegate {
//        
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            let section = indexPath.section
//            let row = indexPath.row
//            var name = ""
//            if section == 0 {
//                name = dataSource.topics.banjoFacts[row]
//            } else if section == 1 {
//                name = dataSource.topics.movies[row]
//            } else if section == 2 {
//                name = dataSource.topics.sports[row]
//            }
//            let uiAlert = UIAlertController(title: "You selected", message: name, preferredStyle: .alert)
//            uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(uiAlert, animated: true, completion: nil)
//        }
//
//        @IBOutlet weak var tableView: UITableView!
//        
//        let dataSource = TopicsDataSource(topics: Topics.init())
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        tableView.dataSource = dataSource
//        tableView.delegate = self
//    }
//
//
//}
//
