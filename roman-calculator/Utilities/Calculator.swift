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
    
    var a = Double(exp[0])
    
    if Double(exp[0]) != nil {
        a = Double(exp[0])
    } else {
        do {
            try a = translate(value: exp[0])
        } catch Exceptions.InvalidRomanException(let errorMessage){
            return errorMessage
        } catch {
            return "shiiet bro"
        }
    }
    
    var c = Double("0.0")
    let expSize = exp.count
    
    for i in (1...expSize-2) {
       
//        do {
//            try  c = translate(value: exp[i+1])
//        } catch Exceptions.InvalidRomanException(let errorMessage){
//            return errorMessage
//        } catch {
//            return "shiiet bro"
//        }
        
        if Double(exp[i+1]) != nil {
            c = Double(exp[i+1])
        } else {
            do {
                try c = translate(value: exp[i+1])
            } catch Exceptions.InvalidRomanException(let errorMessage){
                return errorMessage
            } catch {
                return "shiiet bro"
            }
        }
        
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
    
    return String(format: "%.1f", a!)
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
    
    return String(format: "%.1f", a!)
}
