
//  testJSON.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/12/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct NutritionView: View {
    @State var MNA = Bundle.main.decode("MiniNutritional.json")
    @State var MNAScore: Array<Int> = Array(repeating: 0, count: 100)
    @State var MNAselected: Array<Int> = Array(repeating: 0, count: 100)
    @State var MNASum = 0

    var body: some View {
        List{
            Section(header: Text("Ask the patient...")) {
                QuestionView(fetcher: $MNA, scores: $MNAScore, sum: $MNASum, selected: $MNAselected)
            }
            Section {
                NavigationLink(destination: NutritionResults(score: $MNASum)){
                    Text("Click here for MNA®️ result:").bold()
                }.foregroundColor(.blue)
            }
        }
        .navigationBarTitle("Mini Nutrition Assessment")
    }
}




struct testJSON_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}
