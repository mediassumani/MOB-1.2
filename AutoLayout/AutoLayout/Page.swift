//
//  Page.swift
//  AutoLayout
//
//  Created by Medi Assumani on 12/19/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

struct Page{
    
    let imageName: String
    let headerText: String
    let description: String
    
    init(imageName: String, headerText: String, description: String) {
        
        self.imageName = imageName
        self.headerText = headerText
        self.description = description
    }
}
