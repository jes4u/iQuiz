//
//  MainTableVC.swift
//  iQuiz
//
//  Created by iosdev on 10/28/18.
//  Copyright © 2018 iosdev. All rights reserved.
//
//part two
import UIKit

//class Topics {
//    let banjoFacts = ["Origination", "Musicians", "Song", "Facts"]
//    let movies = ["Movie Titles", "Directors", "Genres", "Facts"]
//    let sports = ["Players", "Moments", "Controversies" , "Facts"]
//}
//
//class TopicsRepository {
//
//    static func instance() -> TopicsRepository {
//        return theInstance
//    }
//
//    private static let theInstance = TopicsRepository()
//
//}
//
//class TopicsDataSource : NSObject, UITableViewDataSource {
//    init(topics : Topics) {
//        self.topics = topics
//    }
//
//    let topics : Topics
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return topics.banjoFacts.count
//        }
//        else if section == 1 {
//            return topics.movies.count
//        }
//        else if section == 2 {
//            return topics.sports.count
//        }
//        else {
//            assert(false, "Should never be more than three sections")
//        }
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Banjo Facts"
//        }
//        else if section == 1 {
//            return "Movies"
//        }
//        else if section == 2 {
//            return "Sports"
//        }
//        else {
//            assert(false, "Should never be more than three sections")
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        NSLog("IndexPath: \(indexPath.item), \(indexPath.row), \(indexPath.section)")
//        var cell = tableView.dequeueReusableCell(withIdentifier: "NameTableIdentifier")
//        if cell == nil {
//            NSLog("Creating new UITableViewCell")
//            cell = UITableViewCell(style: .value1, reuseIdentifier: "NameTableIdentifier")
//        }
//
//        if indexPath.section == 0 {
//            cell?.textLabel?.text = topics.banjoFacts[indexPath.row]
//            cell?.detailTextLabel?.text = "A wide variety of little known facts about the banjo!"
//            cell?.imageView?.image = UIImage(named: "banjo")
//        }
//        else if indexPath.section == 1 {
//            cell?.textLabel?.text = topics.movies[indexPath.row]
//            cell?.detailTextLabel?.text = "With questions ranging from the early 1900's, you'll be surprised by some of these facts!"
//            cell?.imageView?.image = UIImage(named: "movie")
//
//        }
//        else if indexPath.section == 2 {
//            cell?.textLabel?.text = topics.sports[indexPath.row]
//            cell?.detailTextLabel?.text = "Football? Tennis? Tag? Any sport you're thinking of we got it!"
//            cell?.imageView?.image = UIImage(named: "sports")
//
//        }
//        else {
//            assert(false, "Should never get section number \(indexPath.section)")
//        }
//
//        return cell!
//    }
//}

class MainTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var appdata = AppData.shared
    
    @IBAction func setting(_ sender: Any) {
        let uiAlert = UIAlertController(title: "Settings", message: "Check back for settings!", preferredStyle: .alert)
        uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(uiAlert, animated: true, completion: nil)
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let section = indexPath.section
//        let row = indexPath.row
//        var name = ""
//        if section == 0 {
//            name = dataSource.topics.banjoFacts[row]
//        } else if section == 1 {
//            name = dataSource.topics.movies[row]
//        } else if section == 2 {
//            name = dataSource.topics.sports[row]
//        }
//        let uiAlert = UIAlertController(title: "You selected", message: name, preferredStyle: .alert)
//        uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(uiAlert, animated: true, completion: nil)
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appdata.topicIdx = indexPath.row
        performSegue(withIdentifier: "segueToQuestion", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appdata.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "NameTableIdentifier")
        if cell == nil {
            NSLog("Creating new UITableViewCell")
            cell = UITableViewCell(style: .value1, reuseIdentifier: "NameTableIdentifier")
        }
        cell?.textLabel?.text = appdata.titles[indexPath.row]
        cell?.detailTextLabel?.text = appdata.desc[indexPath.row]
        cell?.imageView?.image = UIImage(named: appdata.img[indexPath.row])

        return cell!
    }
    
    @IBOutlet weak var tableView: UITableView!
    
//    let dataSource = TopicsDataSource(topics: Topics.init())


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    

}
