//
//  FrailScaleView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 12/19/23.
//  Updated 4/18/24
//  Copyright © 2023 Ambika Viswanathan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct FrailScaleView: View {
    @State var Frailty = Bundle.main.decode("FrailScale.json")
    @State var FrailtyScore: Array<Int> = Array(repeating: 0, count: 100)
    @State var FrailtySelection: Array<Int> = Array(repeating: 0, count: 100)

    @State var FrailtySum = 0
    @State var weightNow = ""
    @State var weightYear = ""
    
    @State var selectedDiseases: [String] = []
    
    let diseases = [
        "Hypertension",
        "Diabetes",
        "Cancer (other than a minor skin cancer)",
        "Chronic lung disease",
        "Heart attack",
        "Congestive heart failure",
        "Angina",
        "Asthma",
        "Arthritis",
        "Stroke",
        "Kidney disease"
    ]

    var body: some View {
        List{
            Section(header: Text("Ask the participant the following questions.")                        .foregroundColor(.black).fontWeight(.semibold)) {
                QuestionView(fetcher: $Frailty, scores: $FrailtyScore, sum: $FrailtySum, selected: $FrailtySelection)
                
                Text("D. How many of the following illnesses has a doctor ever told you that you have?")
                    .padding(.bottom, 10)
                
                ForEach(diseases, id: \.self) { disease in
                    CheckboxRow(title: disease, isChecked: self.selectedDiseases.contains(disease)) {
                        if self.selectedDiseases.contains(disease) {
                            self.selectedDiseases.removeAll(where: { $0 == disease })
                        } else {
                            self.selectedDiseases.append(disease)
                        }
                    }
                    
                }
                
                Text("Number of diseases checked: \(selectedDiseases.count)")
                    .padding(.top, 10)
            }
            
            
            Section(header: Text("One year ago, how much did you weigh? (lbs)").foregroundColor(.black).fontWeight(.semibold)) {
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
            
            
            Section(header: Text("How much do you weigh currently? (lbs)").foregroundColor(.black).fontWeight(.semibold)) {
                TextField("150", text: $weightNow)
                    .frame(width: 50)
                    .keyboardType(.numberPad)
                    .onReceive(Just(weightNow)) { newValue2 in
                        let filtered2 = newValue2.filter { "0123456789".contains($0) }
                        if filtered2 != newValue2 {
                            self.weightNow = filtered2
                        }
                    }
            }
            
            
            
            Section {
                NavigationLink(destination: FrailScaleResultsView(frailtySum: $FrailtySum, curWeight: $weightNow, oldWeight: $weightYear, selDx: $selectedDiseases))
                {Text("Click here for Frailty result:").bold()
                }.foregroundColor(.blue)
            }

        }
            .navigationBarTitle("Frail Scale")
        
    }
}

struct CheckboxRow: View {
    let title: String
    let isChecked: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square" : "square")
                Text(title)
            }
        }
        .foregroundColor(.primary)
    }
}

struct FrailScaleView_Previews: PreviewProvider {
    static var previews: some View {
        FrailScaleView()
    }
}
