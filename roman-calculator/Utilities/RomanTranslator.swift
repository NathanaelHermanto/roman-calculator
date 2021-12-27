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

func translate(value: String) throws -> Double {
    var res = 0
    var temp = value
    
    guard (validateRoman(value: temp)) else {
        throw Exceptions.InvalidRomanException("Invalid Roman, press = to continue")
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


