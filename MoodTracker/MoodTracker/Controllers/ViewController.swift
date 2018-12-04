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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndexPath = moondEntriesTableView.indexPathForSelectedRow {
            moondEntriesTableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
    
    
    @IBAction func pressAddEntry(_ sender: UIBarButtonItem) {
        
        let now = Date()
        let newMood = MoodEntry(mood: .amazing, date: now)
        entries.insert(newMood, at: 0)
        moondEntriesTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    
    
    func createEntry(mood: Mood, date: Date) {
        let newEntry = MoodEntry(mood: mood, date: date)
        entries.insert(newEntry, at: 0)
        moondEntriesTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    
    func updateEntry(mood: Mood, date: Date, at index: Int) {
        entries[index].mood = mood
        entries[index].date = date
        moondEntriesTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func deleteEntry(at index: Int) {
        entries.remove(at: index)
        moondEntriesTableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
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
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue){
        
        guard let identifier = segue.identifier else {return}
        guard let detailedEntryViewController = segue.source as? MoodDetailedViewController else {
            return print("storyboard unwind segue not set up correctly")
        }
        
        switch identifier{
            
        case "unwind from save":
            let newMood: Mood = detailedEntryViewController.mood
            let newDate: Date = detailedEntryViewController.date
            if detailedEntryViewController.isEditing{
                guard let selectedIndexPath = moondEntriesTableView.indexPathForSelectedRow else {return}
                updateEntry(mood: newMood, date: newDate, at: selectedIndexPath.row)
            }else{
                createEntry(mood: newMood, date: newDate)
            }
            
        case "unwind from cancel":
            print("cancel button pressed")
            
        default:
            break
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
        let destinationVC = MoodDetailedViewController()
        destinationVC.mood = selectedEntry.mood
        destinationVC.date = selectedEntry.date
        self.present(destinationVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            deleteEntry(at: indexPath.row)
        }
    }
}

