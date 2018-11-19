//
//  ViewController.swift
//  MoodTracker
//
//  Created by Medi Assumani on 11/8/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var entries = [MoodEntry](){
        didSet{
            moondEntriesTableView.reloadData()
        }
    }
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
    
    
    @IBAction func pressAddEntry(_ sender: UIBarButtonItem) {
        
        let now = Date()
        let newMood = MoodEntry(mood: .amazing, date: now)
        entries.insert(newMood, at: 0)
        moondEntriesTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "show entry details":
                guard
                    let selectedCell = sender as? UITableViewCell,
                    let indexPath = moondEntriesTableView.indexPath(for: selectedCell) else {
                        return print("failed to locate index path from sender")
                }
                
                guard let entryDetailsViewController = segue.destination as? MoodDetailedViewController else {
                    return print("storyboard not set up correctly, 'show entry details' segue needs to segue to a 'MoodDetailedViewController'")
                }
                
                let entry = entries[indexPath.row]
                entryDetailsViewController.mood = entry.mood
                entryDetailsViewController.date = entry.date
                
            default: break
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return entries.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mood entry cell", for: indexPath) as! MoodEntryTableViewCell
        let entry = entries[indexPath.row]
        cell.labelMoodTitle.text = entry.mood.stringValue
        cell.imageViewMoodColor.backgroundColor = entry.mood.colorValue
        cell.labelMoodDate.text = String(describing: entry.date)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEntry = entries[indexPath.row]
        print("Selected mood was \(selectedEntry.mood.stringValue)")
    }
}

