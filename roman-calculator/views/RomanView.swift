//
//  RomanView.swift
//  roman-calculator
//
//  Created by Nathan on 22.12.21.
//

import SwiftUI

struct RomanView: View {
    
    
    let rows_roman = [
        ["C", "D", "M", "÷"],
        ["V", "X", "L", "−"],
        ["I", "=", "×", "+"]
    ]

    
    @State var noBeingEntered: String = ""
    @State var finalValue:String = "Hallo"
    @State var calExpression: [String] = []
    
    var body: some View {
        VStack {
            VStack {
                Text(self.finalValue)
                    .font(Font.custom("HelveticaNeue-Thin", size: 40))
                    .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(Color.white)
                    .padding()
                Text(flattenTheExpression(exps: calExpression))
                    .font(Font.custom("HelveticaNeue-Thin", size: 24))
                    .frame(alignment: Alignment.bottomTrailing)
                    .foregroundColor(Color.white)
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(primaryColor)
            VStack {
                Spacer(minLength: 48)
                VStack {
                    ForEach(rows_roman, id: \.self) { row in
                        HStack(alignment: .top, spacing: 0) {
                            Spacer(minLength: 13)
                            ForEach(row, id: \.self) { column in
                                Button(action: {
                                    if column == "=" {
                                        self.calExpression = []
                                        self.noBeingEntered = ""
                                        return
                                    } else if checkIfOperator(str: column)  {
                                        self.calExpression.append(column)
                                        self.noBeingEntered = ""
                                    } else {
                                        self.noBeingEntered.append(column)
                                        if self.calExpression.count == 0 {
                                            self.calExpression.append(self.noBeingEntered)
                                        } else {
                                            if !checkIfOperator(str: self.calExpression[self.calExpression.count-1]) {
                                                self.calExpression.remove(at: self.calExpression.count-1)
                                            }

                                            self.calExpression.append(self.noBeingEntered)
                                        }
                                    }

                                    self.finalValue = processExpressionRoman(exp: self.calExpression)
                                    
                                    if self.calExpression.count > 3 {
                                        self.calExpression = [self.finalValue, self.calExpression[self.calExpression.count - 1]]
                                    }

                                }, label: {
                                    Text(column)
                                    .font(.system(size: getFontSize(btnTxt: column)))
                                    .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                                }
                                )
                                .foregroundColor(Color.white)
                                .background(getBackground(str: column))
                                .mask(CustomShape(radius: 40, value: column))
                            }
                        }
                    }
                }
            }
            .background(Color.black)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 414, maxHeight: .infinity, alignment: .topLeading)
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

func processExpressionRoman(exp:[String]) -> String {
    
    if exp.count < 3 {
        return "0.0"
    }
    
    var a = 0.0
    var c = 0.0
    
    if let test = Double(exp[0]) {
        a = test
    } else {
        a = translate(value: exp[0])
    }
    
       
    let expSize = exp.count
    
    for i in (1...expSize-2) {
        
        c = translate(value: exp[i+1])
        
        if (a == -3.141592){
            return "Invalid roman numerals, Click = to continue"
        }
        
        switch exp[i] {
            case "+":
                a += c
            case "−":
                a -= c
            case "×":
                a *= c
            case "÷":
                a /= c
            default:
                print("skipping the rest")
        }
    }
    
    return String(format: "%.1f", a)
}

struct RomanView_Previews: PreviewProvider {
    static var previews: some View {
        RomanView()
    }
}
