//
//  FrailtyView.swift
//  SurveyApp
//
//  Created by Gabriela Lopez on 1/23/23.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct FrailtyView: View {
    @State var Frailty = Bundle.main.decode("Frailty.json")
    @State var FrailtyScore: Array<Int> = Array(repeating: 0, count: 100)
    @State var FrailtySum = 0
    @State var weightNow: Int = 100
    @State var weightYear: Int = 100

    var body: some View {
            List{
                Section(header: Text("Ask the participant the following questions..")) {
                    QuestionView(fetcher: $Frailty, scores: $FrailtyScore, sum: $FrailtySum)
                }
                
                Section(header: Text("One year ago, how much did you weigh? (lbs)")) {
                        TextField("", value: $weightYear, formatter: NumberFormatter())
                            .frame(width: 50)

                }
                
                Section(header: Text("How much do you weigh currently? (lbs)")) {
                    TextField("", value: $weightNow, formatter: NumberFormatter())
                        .frame(width: 50)
                    
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
