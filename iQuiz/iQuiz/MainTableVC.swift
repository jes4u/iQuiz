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
    var newURL : UITextField = UITextField()
    
    
    
    @IBAction func setting(_ sender: Any) {
        let uiAlert = UIAlertController(title: "Settings", message: "Enter JSON URL:", preferredStyle: .alert)
        
        uiAlert.addTextField { (text: UITextField) in
            self.newURL = text
        }
        
        uiAlert.addAction(UIAlertAction(title: "Check Now", style: .default, handler: { (UIAlertAction) in
            if !Reachability.isConnectedToNetwork() {
                self.noConnection()
            }
            
            if((self.newURL.text) != nil){
                print("hi")
                self.getJSON(link: self.newURL.text!)
            }
        }))
        
        uiAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
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
        {
            self.throwError()
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {
                self.throwError()
                return
            }
            
            do {
                let list = try
                    JSONDecoder().decode([AppData.quizList].self, from: data)
                self.appdata.dictionary = list
                
                print(self.appdata.dictionary)
                
            } catch let err{
                print(err)
                print("Threw error")
                self.throwError()
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
        
        
    }
    
    func throwError() {
        let errorAlert = UIAlertController(title: "Error", message: "Download Failed", preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "Exit", style: .default, handler: nil))
        self.present(errorAlert, animated: true, completion: nil)

    }

    func noConnection() {
        let noConnection = UIAlertController(title: "No Internet Connection", message: "Using local quiz.", preferredStyle: .alert)
        noConnection.addAction(UIAlertAction(title: "Exit", style: .default, handler: nil))
        self.present(noConnection, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        
        if Reachability.isConnectedToNetwork(){
            self.getJSON(link: "https://raw.githubusercontent.com/jes4u/iQuiz/partThree/iQuiz/iQuiz/localFiles.JSON")
        }else{
            let noConnection = UIAlertController(title: "No Internet Connection", message: "Using local quiz.", preferredStyle: .alert)
            noConnection.addAction(UIAlertAction(title: "Exit", style: .default, handler: nil))
            self.present(noConnection, animated: true, completion: nil)
            appdata.getLocalJSON()
        }
        
        
        super.viewDidLoad()

        

        tableView.dataSource = self
        tableView.delegate = self
    }
    

}
