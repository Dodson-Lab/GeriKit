//
//  AD8View.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/3/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct AD8View: View {
    @State var AD8 = Bundle.main.decode("AD8.json")
    @State var AD8Score: Array<Int> = Array(repeating: 0, count: 100)
    @State var AD8Sum = 0

    var body: some View {
        List{
            QuestionView(fetcher: $AD8, scores: $AD8Score, sum: $AD8Sum)
            Section {
                NavigationLink(destination: AD8ResultsView(numberAD8Yes: $AD8Sum))
                {Text("Click here for your AD8 Results \(AD8Sum)").bold()
                }
            }
            .navigationBarTitle("AD8")
        }
    }
}

struct AD8View_Previews: PreviewProvider {
    static var previews: some View {
        AD8View()
    }
}


//            List{
//                Section(header: Text("As the caregiver, has the patient had...")) {
//                HStack {Text("Problems with judgment (e.g. problems making decisions, bad financial decisions, problems with thinking)")
//                    Spacer()
//                    YesNo(numberOfYeses: $numAD8Yes)
//                }
//
//                HStack {Text("Less interest in hobbies/activities")
//                    Spacer()
//                    YesNo(numberOfYeses: $numAD8Yes)
//                }
//
//                HStack{Text("Repeats the same things over and over (questions, stories, or statements) ")
//                    Spacer()
//                    YesNo(numberOfYeses: $numAD8Yes)
//                }
//
//                HStack{ Text("Trouble learning how to use a tool, appliance, or gadget (e.g. VCR, computer, microwave, remote control)")
//                    Spacer()
//                    YesNo(numberOfYeses: $numAD8Yes)
//                }
//
//                HStack{ Text("Forgets correct month or year")
//                    Spacer()
//                    YesNo(numberOfYeses: $numAD8Yes)
//                }
//
//                HStack {Text("Trouble handling complicated financial affairs (e.g. balancing checkbook, income taxes, paying bills)")
//                    Spacer()
//                    YesNo(numberOfYeses: $numAD8Yes)
//                }
//                HStack {Text("Trouble remembering appointments")
//                    Spacer()
//                    YesNo(numberOfYeses: $numAD8Yes)
//                }
//
//                HStack {Text("Daily problems with thinking and/or memory")
//                    Spacer()
//                    YesNo(numberOfYeses: $numAD8Yes)
//                }
//
//                }
//
//                Section {
//                    NavigationLink(destination: AD8ResultsView(numberAD8Yes: $numAD8Yes))
//                            {Text("Click here for AD8 result").bold()
//                            }
//                    }
//            }
