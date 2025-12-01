//
//  currency.swift
//  Assignment 6
//
//  Created by user287375 on 11/30/25.
//

import Foundation

enum Currency {
    case eur
    case jpy
    case gbp
    case cad

    var code: String {
        switch self {
        case .eur: return "EUR"
        case .jpy: return "JPY"
        case .gbp: return "GBP"
        case .cad: return "CAD"
        }
    }

    /// Conversion rate: 1 USD = ratePerUSD of this currency
    var ratePerUSD: Double {
        switch self {
        case .eur: return 0.92   // example values
        case .jpy: return 150.0
        case .gbp: return 0.80
        case .cad: return 1.35
        }
    }

    var symbol: String {
        switch self {
        case .eur: return "€"
        case .jpy: return "¥"
        case .gbp: return "£"
        case .cad: return "$"
        }
    }
}
