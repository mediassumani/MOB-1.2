//
//  HabitImageCollectionViewCell.swift
//  Habitual
//
//  Created by Medi Assumani on 12/15/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class HabitImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let identifier = "habit image cell"
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    func setImage(image: UIImage){
        self.itemImageView.image = image
    }

}
