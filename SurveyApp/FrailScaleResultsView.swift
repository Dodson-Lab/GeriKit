//
//  FrailScaleResultsView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 12/19/23.
//  Updated 4/18/24
//  Copyright © 2023 Ambika Viswanathan. All rights reserved.
//

import Foundation
import SwiftUI

struct FrailScaleResultsView: View {
    @Binding var frailtySum: Int
    @Binding var curWeight: String
    @Binding var oldWeight: String
    @Binding var selDx: [String]
    @State private var intCur = 0
    @State private var intOld = 0
    @State private var numDx = 0



    @State private var isNavigation = false
    
    func FrailtyResults(sum: Int, cur: Int, old: Int,arr: Array<String>)-> String {
        var finalScore = sum
        var dx = 0
        dx = arr.count
        
        if dx >= 5{
            finalScore = finalScore + 1
        }
        
        let weightScore: Double = (Double(old-cur) / Double(old))*100
        
        if weightScore > 5 {
            finalScore = finalScore + 1
        }

        if finalScore >= 3 {
            return("the patient is Frail given their sccore of \(finalScore)")
        }
        else if (finalScore > 0 && finalScore < 3) {
            return("the patient is Pre-Frail given their score of \(finalScore)")
        }
        else
        {
            return("the patient has a Robust Health Status given their score of \(finalScore)")
        }
    }
       var body: some View {
        ScrollView{
        VStack(alignment: .center){
            Text("Frail Scale Results").font(.system(size: 60)).fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center)
                
            Spacer().frame(height: 30)
            
            Text("The Frail Scale suggests that \(FrailtyResults(sum: frailtySum, cur: intCur, old: intOld, arr:selDx))").font(.system(size: 36)).fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center)

            Spacer().frame(height: 30)
            
            HStack{
//                Button(action: {
//                    self.isNavigation = true}, label: {Text("Next Steps")}).frame(maxWidth: .infinity)
//                    .padding(10)
//                    .buttonStyle(BorderlessButtonStyle())
//                    .background(isNavigation ? Color.blue : Color.gray)
//                    .foregroundColor(Color.white)
//                    .cornerRadius(10)
    
                Button(action: {
                    self.isNavigation = false
                    },label: {Text("Resources")}).frame(maxWidth: .infinity)
                    .padding(10)
                    .buttonStyle(BorderlessButtonStyle())
                    .background(isNavigation ? Color.gray : Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
}
            
            
//            if(isNavigation){
//                Spacer().frame(height: 10)
//                VStack(alignment: .leading){
//                    Text("1. Ask if patient has been admitted to the hospital within the last 3 months\n").multilineTextAlignment(.leading)
//                }
//                .padding()
//                .frame(maxWidth: .infinity, alignment: .center)
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//            }
//            else{
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    Text("1. Frail Scale Detail")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.mass.gov/doc/frail-scale-screening-tool/download")
                        guard let frailurl = url, UIApplication.shared.canOpenURL(frailurl) else { return }
                        UIApplication.shared.open(frailurl)}
                    
                    Text("2. Frail Scale Primary Paper")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://pubmed.ncbi.nlm.nih.gov/22836700/")
                        guard let frailurl2 = url, UIApplication.shared.canOpenURL(frailurl2) else { return }
                        UIApplication.shared.open(frailurl2)}
                    Text("3. Understanding Frailty Interventions ")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5726589/")
                        guard let frailurl3 = url, UIApplication.shared.canOpenURL(frailurl3) else { return }
                        UIApplication.shared.open(frailurl3)}
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
           // }
            Spacer()
            // no copy right needed per John Morley
        }.padding().onAppear(perform:{
            self.intCur = 0
            self.intOld = 0
            //self.numDx = 0

            //if self.selDx.isEmpty {self.numDx = Int(exactly: selDx.count)!}
            if self.curWeight != "" {self.intCur = Int(self.curWeight)!}
            if self.oldWeight != "" {self.intOld = Int(self.oldWeight)!}

        })
    }
    }
}

