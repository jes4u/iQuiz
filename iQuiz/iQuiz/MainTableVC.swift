//
//  MainTableVC.swift
//  iQuiz
//
//  Created by iosdev on 10/28/18.
//  Copyright © 2018 iosdev. All rights reserved.
//
//part two
import UIKit


class MainTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var appdata = AppData.shared
    
    @IBAction func setting(_ sender: Any) {
        let uiAlert = UIAlertController(title: "Settings", message: "Check back for settings!", preferredStyle: .alert)
        uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(uiAlert, animated: true, completion: nil)
    }
    

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
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    

}
