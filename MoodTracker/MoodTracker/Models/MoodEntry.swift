//
//  MoodEntry.swift
//  MoodTracker
//
//  Created by Medi Assumani on 11/8/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit.UIColor

struct MoodEntry {
    var mood: Mood
    var date: Date
    
    init(mood: Mood, date: Date) {
        
        self.mood = mood
        self.date = date
    }
}
