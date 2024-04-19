//
//  TUGResults.swift
//  SurveyApp
//
//  Edited by Ambika Viswanathan on 4/12/24.
//  Updated 4/18/24
//  Copyright © 2024 Ambika Viswanathan. All rights reserved.
//

import Foundation

import SwiftUI

struct TUGResults: View {
    @Binding var timeTug: String
    @State private var isNavigation = false
    @State private var intTime = 0

            
    func tugResults(number: Int)-> String {
            if number >= 12 {
                self.isNavigation = true;
                return("An older adult who takes 12 or more seconds to complete the TUG is at risk of falling.")
            }
            else {
                return("The patient is not at risk for falling")
            }
        }
    
    var body: some View {
        ScrollView{
            VStack{
                Text("TUG Results").font(.system(size: 60)).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
                
                Spacer().frame(height: 30)
                
                if (self.timeTug == ""){
                    Text("Please input the number of seconds to complete the TUG on the previous screen.").font(.system(size: 36)).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true).padding()

                }
                else {
                        Text("The patient took \(timeTug) seconds to complete the TUG. \(tugResults(number: intTime))")
                            .font(.system(size: 36)).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true).padding()
                        
                        Spacer().frame(height: 30)
                        
                        HStack{
                            if intTime >= 12{
                                Button(action: {
                                    self.isNavigation = true
                                }, label: {Text("Next Steps")}).frame(maxWidth: .infinity)
                                    .padding(10)
                                    .buttonStyle(BorderlessButtonStyle())
                                    .background(isNavigation ? Color.blue : Color.gray)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10)
                            }
                            Button(action: {
                                self.isNavigation = false
                            },label: {Text("Resources")}).frame(maxWidth: .infinity)
                                .padding(10)
                                .buttonStyle(BorderlessButtonStyle())
                                .background(isNavigation ? Color.gray : Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                        
                    }
                if(isNavigation){
                    Spacer().frame(height: 10)
                    VStack(alignment: .leading){
                        Text("Consider for your patient: ").frame(maxWidth: .infinity, alignment: .leading)
                        Text("\t1. Physical therapy referral")
                        Text("\t3. A cane or walker")
                        Text("\t4. Home safety evaluation")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                else{
                    Spacer().frame(height: 10)
                    VStack(alignment: .leading){
                        Text("1. Timed Up & Go (TUG) Detail")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let url = URL.init(string: "https://www.cdc.gov/steadi/pdf/TUG_test-print.pdf")
                                guard let tugURL = url, UIApplication.shared.canOpenURL(tugURL) else { return }
                                UIApplication.shared.open(tugURL)}
                        Text("2. CDC STEADI Information")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let url = URL.init(string: "https://www.cdc.gov/steadi/index.html")
                                guard let cdcURL = url, UIApplication.shared.canOpenURL(cdcURL) else { return }
                                UIApplication.shared.open(cdcURL)}
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                Spacer()
//                Text("\nAdapted from CDC’s STEADI tools and resources that can help you screen, assess, and intervene to reduce your patient’s fall risk.").font(.footnote)
                   
            }.padding()
        }
        .onAppear(perform:{
            self.intTime = 0
            if self.timeTug != "" {self.intTime = Int(self.timeTug)!}
        })
    }
    
}
