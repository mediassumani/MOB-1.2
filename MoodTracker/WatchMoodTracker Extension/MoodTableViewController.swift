//
//  MoodTableViewController.swift
//  WatchMoodTracker Extension
//
//  Created by Medi Assumani on 12/6/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class MoodTableViewController: WKInterfaceController {

    var entries: [MoodEntry] = []
    
    
    @IBOutlet weak var moodTableView: WKInterfaceTable!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    
        // Inside awake method
        let goodEntry = MoodEntry(mood: .good, date: Date())
        let badEntry = MoodEntry(mood: .bad, date: Date())
        let neutralEntry = MoodEntry(mood: .neutral, date: Date())
        let amazingEntry = MoodEntry(mood: .amazing, date: Date())
        let terribleEntry = MoodEntry(mood: .terrible, date: Date())
        
        entries = [goodEntry, badEntry, neutralEntry, amazingEntry, terribleEntry]
        
        moodTableView.setNumberOfRows(entries.count, withRowType: "identifier")
        
        
        
        for index in 0..<entries.count {
            guard let controller = moodTableView.rowController(at: index) as? MoodRowView else { continue }
            controller.moodObj = entries[index].mood
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let mood = entries[rowIndex]
        
        if WCSession.default.isReachable == true {
            // App is reachable
            WCSession.default.transferUserInfo(["mood": mood.mood.stringValue, "date": mood.date])
        }
        pop()
    }
}
