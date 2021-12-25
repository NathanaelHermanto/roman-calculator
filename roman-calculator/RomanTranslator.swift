//
//  RomanTranslator.swift
//  roman-calculator
//
//  Created by Nathan on 22.12.21.
//

import Foundation

let roman_numbers: [(key: String, value: Int)] = [
    ("IV", 4),
    ("IX", 9),
    ("XL", 40),
    ("XC", 90),
    ("CD", 400),
    ("CM", 900),
    ("I", 1),
    ("V", 5),
    ("X", 10),
    ("L", 50),
    ("C", 100),
    ("D", 500),
    ("M", 1000),
]

func translate(value: String) -> Double {
    var res = 0
    var temp = value
    
    guard (validateRoman(value: temp)) else {
        return -1
    }
    
    while temp.count > 0 {
        for (key, val) in roman_numbers{
            if temp.starts(with: key){
                temp.removeFirst(key.count)
                res = res + val
                break
            }
        }
    }
    
    return Double(res)
}

func validateRoman(value: String) -> Bool {
    let romanPattern = #"^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$"#
    let valid = value.range(
        of: romanPattern,
        options: .regularExpression
    )
    return valid != nil
}
