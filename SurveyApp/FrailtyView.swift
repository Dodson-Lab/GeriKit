//
//  FrailtyView.swift
//  SurveyApp
//
//  Created by Gabriela Lopez on 1/23/23.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI
import Combine

struct FrailtyView: View {
    @State var Frailty = Bundle.main.decode("Frailty.json")
    @State var FrailtyScore: Array<Int> = Array(repeating: 0, count: 100)
    @State var FrailtySum = 0
    @State var weightNow = ""
    @State var weightYear = ""

    var body: some View {
            List{
                Section(header: Text("Ask the participant the following questions..")) {
                    QuestionView(fetcher: $Frailty, scores: $FrailtyScore, sum: $FrailtySum)
                }
                

                Section(header: Text("One year ago, how much did you weigh? (lbs)")) {
                        TextField("150", text: $weightYear)
                            .frame(width: 50)
                            .keyboardType(.numberPad)
                            .onReceive(Just(weightYear)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.weightYear = filtered
                                    }
                                }
                            }

                
                
                Section(header: Text("How much do you weigh currently? (lbs)")) {
                    TextField("150", value: $weightNow, formatter: NumberFormatter())
                        .frame(width: 50)
                        .keyboardType(.numberPad)
                        .onReceive(Just(weightNow)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.weightNow = filtered
                                }
                            }
                        }
                    
                
                
                Section {
                    NavigationLink(destination: FrailtyResults(frailty_sum: $FrailtySum, cur_weight: $weightNow, old_weight: $weightYear))
                            {Text("Click here for Frailty result:").bold()
                            }.foregroundColor(.blue)
                    }
            }
            .navigationBarTitle("Frailty")
        
    }
}

struct FrailtyView_Previews: PreviewProvider {
    static var previews: some View {
        FrailtyView()
    }
}
