//
//  Payroll.swift
//  TipCalculator
//
//  Created by Assumani, Medi on 2/15/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation

class Payroll{
    
    
    private var billAmount : Double
    private var tipPercent : Double
    
  
    init(_ bill : Double, _ percent : Double) {
        
        self.billAmount = bill
        self.tipPercent = percent
    }
    
    
    func getTipPercent() -> Double{
    
        return self.tipPercent
    }

    func getBillAmount() -> Double{
        
        return self.billAmount
    }
    
    func computeTipAmount() -> Double{
    
        return (self.billAmount * self.tipPercent)/100
    }
    
    func computeTotalAmount() -> Double{
    
    return (self.getBillAmount() + self.computeTipAmount())
    }
    
}
