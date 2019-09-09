//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Oguz Mert Beyoglu on 4.10.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var tipBrain = TipBrain()
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var totalBillTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        tipBrain.changePercentange(for: sender.currentTitle!)
        updateUI()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        tipBrain.changeTotalPerson(for: Int(sender.value))
        updateUI()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billAmountText = totalBillTextField.text, let billAmount = Float(billAmountText) else { return }
        
        tipBrain.calculateResult(for: billAmount)
        
        if let _ = tipBrain.getResult() {
            performSegue(withIdentifier: VCIdentifiers.ResultVC.rawValue, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == VCIdentifiers.ResultVC.rawValue {
            let resultViewController = segue.destination as? ResultViewController
            resultViewController?.tipResult = tipBrain.getResult()
        }
    }
    
    private func deselectAllTipButtons() {
        zeroPctButton.isSelected    = false
        tenPctButton.isSelected     = false
        twentyPctButton.isSelected  = false
    }
    
    private func updateUI() {
        splitNumberLabel.text = tipBrain.getTotalPersonAsString()
        
        deselectAllTipButtons()
        
        let selectedButton = tipBrain.getSelectedButton(zeroPctButton: zeroPctButton, tenPctButton: tenPctButton, twentyPctButton: twentyPctButton)
        selectedButton.isSelected = true
    }
}

