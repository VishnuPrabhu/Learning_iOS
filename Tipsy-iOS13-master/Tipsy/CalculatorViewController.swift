//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tip = 0.10
    var numberOfPeople = 2
    var billEach = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPcButton.isSelected = sender.currentTitle == "0%"
        tenPcButton.isSelected = sender.currentTitle == "10%"
        twentyPcButton.isSelected = sender.currentTitle == "20%"
        
        let percent = Double(String((sender.currentTitle!.dropLast())))!
        tip = percent / 100
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            
            let billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            
            billEach = resultTo2DecimalPlaces
            performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.result = billEach
            resultVC.numberOfPeople = numberOfPeople
            resultVC.tipPercentage = tip
        }
    }
    
    @IBAction func unwindToCalculate(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        print(sourceViewController)
    }
}

