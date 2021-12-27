//
//  Calculator.swift
//  roman-calculator
//
//  Created by Nathan on 27.12.21.
//

import Foundation

func processExpressionRoman(exp:[String]) -> String {
    
    if exp.count < 3 {
        return "0.0"
    }
    
    var a = 0.0
    
    if let test = Double(exp[0]) {
        a = test
    } else {
        do {
            try a = translate(value: exp[0])
        } catch Exceptions.InvalidRomanException(let errorMessage){
            return errorMessage
        } catch {
            return "press = to continue"
        }
    }
    
    var c = Double("0.0")
    let expSize = exp.count
    
    for i in (1...expSize-2) {
    
        do {
            try c = translate(value: exp[i+1])
        } catch Exceptions.InvalidRomanException(let errorMessage){
            return errorMessage
        } catch {
            return "press = to continue"
        }
        
//        if Double(exp[i+1]) != nil {
//            c = Double(exp[i+1])
//        } else {
//            do {
//                try c = translate(value: exp[i+1])
//            } catch Exceptions.InvalidRomanException(let errorMessage){
//                return errorMessage
//            } catch {
//                return "shiiet bro"
//            }
//        }
        
        
        switch exp[i] {
        case "+":
            a += c!
        case "−":
            a -= c!
        case "×":
            a *= c!
        case "÷":
            a /= c!
        default:
            print("skipping the rest")
        }
    }
    
    return String(format: "%.2f", a)
}

func processExpression(exp:[String]) -> String {
    
    if exp.count < 3 {
        return "0.0"
    }
    
    var a = Double(exp[0])
    var c = Double("0.0")
    let expSize = exp.count
    
    for i in (1...expSize-2) {
        
        c = Double(exp[i+1])
        
        switch exp[i] {
        case "+":
            a! += c!
        case "−":
            a! -= c!
        case "×":
            a! *= c!
        case "÷":
            a! /= c!
        default:
            print("skipping the rest")
        }
    }
    
    return String(format: "%.2f", a!)
}
