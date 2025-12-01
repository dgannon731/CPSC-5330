//
//  CurrencyConverter.swift
//  Assignment 6
//
//  Created by user287375 on 11/30/25.
//

import Foundation

struct CurrencyConverter {

    static func convert(amountInUSD: Int, to currency: Currency) -> Double {
        return Double(amountInUSD) * currency.ratePerUSD
    }

}
