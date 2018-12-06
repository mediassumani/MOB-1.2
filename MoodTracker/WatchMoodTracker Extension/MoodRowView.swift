//
//  MoodRowView.swift
//  WatchMoodTracker Extension
//
//  Created by Medi Assumani on 12/6/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import WatchKit

class MoodRowView: NSObject {
    
    @IBOutlet weak var moodImageView: WKInterfaceImage!
    @IBOutlet weak var moodNameLabel: WKInterfaceLabel!
 
    var moodObj: Mood? {
        didSet{
            guard let moodObject = moodObj else {return}
            moodImageView.setImage(UIImage(named: moodObject.stringValue))
            moodNameLabel.setText(moodObject.stringValue)
        }
    }
}
