//
//  MoodEntryTableViewCell.swift
//  MoodTracker
//
//  Created by Medi Assumani on 11/18/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class MoodEntryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelMoodTitle: UILabel!
    @IBOutlet weak var labelMoodDate: UILabel!
    @IBOutlet weak var imageViewMoodColor: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
