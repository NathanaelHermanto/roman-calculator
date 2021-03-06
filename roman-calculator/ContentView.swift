//
//  ContentView.swift
//  roman-calculator
//
//  Created by Nathan on 22.12.21.
//

import SwiftUI


let primaryColor = Color.init(red: 0, green: 116/255, blue: 178/255, opacity: 1.0)

struct ContentView: View {
    @State var isRoman = true
    
    var body: some View {
        if isRoman {
            VStack {
                RomanView()
                Spacer(minLength: 0)
                Button {
                    isRoman = false
                } label: {
                    Text("Roman")
                        .font(.system(size: 24, weight: .medium, design: .serif))
                        .padding()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            
                .foregroundColor(Color.white)
                .background(Color.black)
            }
        } else {
            VStack {
                NumberView()
                Spacer(minLength: 0)
                Button {
                    isRoman = true
                } label: {
                    Text("Number")
                        .font(.system(size: 24, weight: .medium, design: .serif))
                        .padding()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            
                .foregroundColor(Color.white)
                .background(Color.black)
            }
        }
    }
    
}



func getBackground(str:String) -> Color {
    if checkIfOperator(str: str) {
        return primaryColor
    }
    return Color.black
}

func getFontSize(btnTxt: String) -> CGFloat {
    if checkIfOperator(str: btnTxt) {
        return 42
    }
    return 24
    
}



func flattenTheExpression(exps: [String]) -> String {
    var calExp = ""
    for exp in exps {
        calExp.append(exp)
    }
    
    return calExp
    
}



struct CustomShape: Shape {
    let radius: CGFloat
    let value: String
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let tl = CGPoint(x: rect.minX, y: rect.minY)
        let tr = CGPoint(x: rect.maxX, y: rect.minY)
        let br = CGPoint(x: rect.maxX, y: rect.maxY)
        let bl = CGPoint(x: rect.minX, y: rect.maxY)
        
        let tls = CGPoint(x: rect.minX, y: rect.minY+radius)
        let tlc = CGPoint(x: rect.minX + radius, y: rect.minY+radius)
        
        path.move(to: tr)
        path.addLine(to: br)
        path.addLine(to: bl)
        if value == "??" || value == "=" {
            path.addLine(to: tls)
            path.addRelativeArc(center: tlc, radius: radius, startAngle: Angle.degrees(90), delta: Angle.degrees(180))
        } else {
            path.addLine(to: tl)
        }
        
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
