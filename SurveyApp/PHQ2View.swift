//
//  PHQ2View.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Updated 4/18/2024
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

//View for PHQ-2 MEntal Health Exam
struct PHQ2View: View{
        @State var PHQ2 = Bundle.main.decode("PHQ2.json")
        @State var PHQ2Score: Array<Int> = Array(repeating: 0, count: 100)
        @State var PHQ2Sum = 0
        @State var PHQ2Selected: Array<Int> = Array(repeating: 0, count: 100)

        var body: some View {
            List{
                Section(header: Text("Ask the patient: how often have they been bothered by the following over the past 2 weeks?")) {
                    QuestionView(fetcher: $PHQ2, scores: $PHQ2Score, sum: $PHQ2Sum, selected:$PHQ2Selected)
                }
                Section {
                    NavigationLink(destination: PHQ2Results(numberPHQ2Yes: $PHQ2Sum)){
                        Text("Click here for PHQ2 result:").bold()
                    }.foregroundColor(.blue)
                }
            }
            .navigationBarTitle("PHQ2")
        }
    }

//code for just yes/no phq2
//    @State var numPHQ2Yes = 0
//    var body: some View {
//            List{
//                Section(header: Text("Ask the patient: how often have they been bothered by the following over the past 2 weeks?")) {
//                    HStack {
//                        Text("1. Little interest or pleasure in doing things")
//                        Spacer()
//                        YesNo(numberOfYeses: $numPHQ2Yes)
//                    }
//
//                    HStack{
//                        Text("2. Feeling down, depressed or hopeless")
//                        Spacer()
//                        YesNo(numberOfYeses: $numPHQ2Yes)
//                    }
//                }
//                Section {
//                    NavigationLink(destination: PHQ2Results(numberPHQ2Yes: $numPHQ2Yes))
//                            {Text("Click here for PHQ2 result:").bold()
//                            }
//                    }
//            }
//            .navigationBarTitle(("PHQ2"))
//    }
//}

struct PHQ2View_Previews: PreviewProvider {
    static var previews: some View {
        PHQ2View()
    }
}
