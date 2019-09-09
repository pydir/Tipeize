//
//  TipBrain.swift
//  Tipsy
//
//  Created by Oguz Mert Beyoglu on 4.10.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

enum TipPercentage: Float {
    case zero   = 0.0
    case ten    = 10.0
    case twenty = 20.0
}

enum VCIdentifiers: String {
    case ResultVC = "ResultViewController"
}

struct TipBrain {
    private var selectedPercentange: TipPercentage = .ten
    private var totalBill: Float = 0.0
    private var totalPerson: Int = 2
    private var calculatedBillPerPerson: Float = 0.0
    
    var tip: Tip?
    
    mutating func changeTotalPerson(for person: Int) {
        totalPerson = person
    }
    
    mutating func getTotalPersonAsString() -> String{
        String(totalPerson)
    }
    
    func getResult() -> Tip?{
        return tip
    }
    
    func getSelectedButton(zeroPctButton: UIButton, tenPctButton: UIButton, twentyPctButton: UIButton) -> UIButton {
        switch selectedPercentange {
        case .ten:
            return tenPctButton
        case .twenty:
            return twentyPctButton
        default:
            return zeroPctButton
        }
    }
    
    mutating func calculateResult(for amount: Float?) {
        guard let billAmount = amount, billAmount > 0 else { return }
        let billPerPerson = billAmount / Float(totalPerson)
        let billPerPersonWithTip = billPerPerson * (1 + (selectedPercentange.rawValue / 100))
        tip = Tip(billPerPerson: billPerPersonWithTip, totalPerson: totalPerson, percentange: selectedPercentange.rawValue)
    }
    
    mutating func changePercentange(for percentageText: String?) {
        guard let percentageText = percentageText, let percentageValue = Float(percentageText.dropLast()) else { return }
        if let tipPercentage = TipPercentage(rawValue: percentageValue) {
            selectedPercentange = tipPercentage
        }
    }
}
