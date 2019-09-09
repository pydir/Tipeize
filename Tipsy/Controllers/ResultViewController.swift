//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Oguz Mert Beyoglu on 4.10.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tipResult: Tip?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let result = tipResult {
            let formattedBill = String(format: "%.2f", result.billPerPerson)
            totalLabel.text = String("$\(formattedBill)")
            settingsLabel.text = "Split between \(result.totalPerson) people, with \(result.percentange)% tip."
        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
