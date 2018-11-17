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
        print(appdata.dictionary.count)
        return appdata.dictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "NameTableIdentifier")
        if cell == nil {
            NSLog("Creating new UITableViewCell")
            cell = UITableViewCell(style: .value1, reuseIdentifier: "NameTableIdentifier")
        }
        cell?.textLabel?.text = appdata.dictionary[indexPath.row].title
        cell?.detailTextLabel?.text = appdata.dictionary[indexPath.row].desc
        cell?.imageView?.image = UIImage(named: appdata.img[indexPath.row])

        return cell!
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func getJSON(link : String) {
        let urlString = link
        guard let url = URL(string: urlString) else
        { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                let list = try
                    JSONDecoder().decode([AppData.quizList].self, from: data)
                self.appdata.dictionary = list
                
                print(self.appdata.dictionary)
                
            } catch let err{
                print(err)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
        
        
    }


    override func viewDidLoad() {
        self.getJSON(link: "http://tednewardsandbox.site44.com/questions.json")
        
        super.viewDidLoad()

        

        tableView.dataSource = self
        tableView.delegate = self
    }
    

}
