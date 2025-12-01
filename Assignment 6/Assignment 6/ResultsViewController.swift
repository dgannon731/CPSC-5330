//
//  ResultsViewController.swift
//  Assignment 6
//
//  Created by user287375 on 11/30/25.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var usdLabel: UILabel!
    

    @IBOutlet weak var eurLabel: UILabel!
    
   
    @IBOutlet weak var gbpLabel: UILabel!
    
    @IBOutlet weak var jpyLabel: UILabel!
    
    @IBOutlet weak var cadLabel: UILabel!

    
    // Data coming from InputViewController
    var amountUSD: Int = 0
    var selectedCurrencies: [Currency] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Results"

        setupLabels()
    }

    private func setupLabels() {
        // Always show original USD amount
        let usdFormatter = NumberFormatter()
        usdFormatter.numberStyle = .currency
        usdFormatter.currencyCode = "USD"

        let usdString = usdFormatter.string(from: NSNumber(value: amountUSD)) ?? "$\(amountUSD)"
        usdLabel.text = "USD: \(usdString)"

        // Hide all currency labels by default
        eurLabel.isHidden = true
        jpyLabel.isHidden = true
        gbpLabel.isHidden = true
        cadLabel.isHidden = true

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        for currency in selectedCurrencies {
            let converted = CurrencyConverter.convert(amountInUSD: amountUSD, to: currency)

            formatter.currencyCode = currency.code
            let formattedAmount = formatter.string(from: NSNumber(value: converted)) ??
                                  "\(currency.symbol)\(String(format: "%.2f", converted))"

            switch currency {
            case .eur:
                eurLabel.text = "EUR: \(formattedAmount)"
                eurLabel.isHidden = false
            case .jpy:
                jpyLabel.text = "JPY: \(formattedAmount)"
                jpyLabel.isHidden = false
            case .cad:
                cadLabel.text = "CAD: \(formattedAmount)"
                cadLabel.isHidden = false
            case .gbp:
                         gbpLabel.text = "GBP: \(formattedAmount)"
                         gbpLabel.isHidden = false            }
        }
    }

}
