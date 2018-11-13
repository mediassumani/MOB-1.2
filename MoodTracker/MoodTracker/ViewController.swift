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
    @IBOutlet weak var moondEntriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let goodEntry = MoodEntry(mood: .good, date: Date())
        let badEntry = MoodEntry(mood: .bad, date: Date())
        let neutralEntry = MoodEntry(mood: .neutral, date: Date())
        
        entries = [goodEntry, badEntry, neutralEntry]
        moondEntriesTableView.reloadData()
        
        self.moondEntriesTableView.delegate = self as UITableViewDelegate
        self.moondEntriesTableView.dataSource = self as UITableViewDataSource
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(entries.count)
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

