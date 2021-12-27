//
//  RomanValidator.swift
//  roman-calculator
//
//  Created by Nathan on 27.12.21.
//

import Foundation

func validateRoman(value: String) -> Bool {
    let romanPattern = #"^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$"#
    let valid = value.range(
        of: romanPattern,
        options: .regularExpression
    )
    return valid != nil
}
