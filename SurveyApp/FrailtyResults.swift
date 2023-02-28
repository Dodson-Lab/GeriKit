//
//  FrailtyResultsView.swift
//  SurveyApp
//
//  Created by Gabriela Lopez on 1/23/23.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct FrailtyResults: View {
    @Binding var frailty_sum: Int
    @Binding var cur_weight: String
    @Binding var old_weight: String
    @State private var intcur = 0
    @State private var intold = 0


    @State private var isNavigation = false
    
    func FrailtyResults(sum: Int, cur: String, old: String)-> String {
        intcur = Int(cur)!
        intold = Int(old)!
        var final_score = 0
        let weight_score: Double = (Double(intold-intcur) / Double(intold))*100
        if weight_score > 5 {
            final_score = sum + 1
        } else {
            final_score = sum
        }
        if final_score > 7{
            return("Frail. Score of \(final_score)")
        }
        else if final_score > 0 {
            return("Pre-Frail. Score of \(final_score)")
        }
        else
        {
            return("Robust Health Status. Score of \(final_score)")
        }
    }
       var body: some View {
        ScrollView{
        VStack(alignment: .center){
            Text("Frailty Result").font(.system(size: 60)).fixedSize(horizontal: false, vertical: true)
                
            Spacer().frame(height: 30)
            
            Text("\(FrailtyResults(sum: frailty_sum, cur: cur_weight, old: old_weight))").font(.system(size: 36)).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)

            Spacer().frame(height: 30)
            
//            HStack{
//                if(frailtySum > 1){
//                    Button(action: {
//                        self.isNavigation = true
//                        }, label: {Text("Next Steps")}).frame(maxWidth: .infinity)
//                        .padding(10)
//                        .buttonStyle(BorderlessButtonStyle())
//                        .background(isNavigation ? Color.blue : Color.gray)
//                        .foregroundColor(Color.white)
//                        .cornerRadius(10)
//                }
//                Button(action: {
//                    self.isNavigation = false
//                    },label: {Text("Resources")}).frame(maxWidth: .infinity)
//                    .padding(10)
//                    .buttonStyle(BorderlessButtonStyle())
//                    .background(isNavigation ? Color.gray : Color.blue)
//                    .foregroundColor(Color.white)
//                    .cornerRadius(10)
//            }
            
            if(isNavigation){
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    Text("1. Ask if patient has been admitted to the hospital within the last 3 months\n").multilineTextAlignment(.leading)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            else{
                Spacer().frame(height: 10)
//                VStack(alignment: .leading){
//                    Text("1. You are in robust health")
//                        .foregroundColor(.blue)
//                        .underline()
//                    Spacer().frame(height: 10)
//                }
//
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            Spacer()
        }.padding()
    }
    }
}




struct FrailtyResultsView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
