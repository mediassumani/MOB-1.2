//
//  ViewController.swift
//  MoodTracker
//
//  Created by Medi Assumani on 11/8/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var entries: [MoodEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moodEntryCell", for: indexPath)
        let entry = entries[indexPath.row]
        cell.textLabel?.text = entry.mood.stringValue
        cell.detailTextLabel?.text = String()
        
        
        return cell
    }
}

