//
//  ViewController.swift
//  Assignment 6
//
//  Created by user287375 on 11/30/25.
//

import UIKit

class ViewController: UIViewController {
   

@IBOutlet weak var amountTextField: UITextField!
    
   
    @IBOutlet weak var errorLabel: UILabel!
    
    
 
    @IBOutlet weak var eurSwitch: UISwitch!
    
   
    @IBOutlet weak var gbpSwitch: UISwitch!
    
   @IBOutlet weak var jpySwitch: UISwitch!
    
    @IBOutlet weak var cadSwitch: UISwitch!
   

   // Data to send to next screen
   private var selectedCurrencies: [Currency] = []
   private var amountUSD: Int = 0

   override func viewDidLoad() {
       super.viewDidLoad()
       title = "Currency Converter"

       errorLabel.textColor = .systemRed
       errorLabel.isHidden = true

       amountTextField.keyboardType = .numberPad
   }

    
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        errorLabel.isHidden = true
         errorLabel.text = ""

         guard validateInput() else { return }

         // If validation passed, perform segue
         performSegue(withIdentifier: "showResults", sender: self)
    }
    
    
    
    
 

   private func validateInput() -> Bool {
       // 1. Validate amount
       guard let text = amountTextField.text, !text.isEmpty else {
           showError("Please enter an amount in USD.")
           return false
       }

       guard let intValue = Int(text) else {
           showError("Invalid input. Please enter whole dollars only.")
           return false
       }

       if intValue < 0 {
           showError("Please enter a non-negative amount.")
           return false
       }

       amountUSD = intValue

       // 2. Validate at least one currency selected
       selectedCurrencies = []
       if eurSwitch.isOn { selectedCurrencies.append(.eur) }
       if jpySwitch.isOn { selectedCurrencies.append(.jpy) }
       if gbpSwitch.isOn { selectedCurrencies.append(.gbp) }
       if cadSwitch.isOn { selectedCurrencies.append(.cad) }

       if selectedCurrencies.isEmpty {
           showError("Please select at least one currency.")
           return false
       }

       return true
   }

   private func showError(_ message: String) {
       errorLabel.text = message
       errorLabel.isHidden = false
   }

   // MARK: - Navigation

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "showResults",
          let resultsVC = segue.destination as? ResultsViewController {
           resultsVC.amountUSD = amountUSD
           resultsVC.selectedCurrencies = selectedCurrencies
       }
   }

}
