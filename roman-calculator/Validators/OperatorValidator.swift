//
//  OperatorValidator.swift
//  roman-calculator
//
//  Created by Nathan on 27.12.21.
//

import Foundation

func checkIfOperator(str:String) -> Bool {
    if str == "÷" || str == "×" || str == "−" || str == "+" || str == "=" {
        return true
    }
    return false
}
