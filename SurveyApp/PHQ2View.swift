//
//  PHQ2View.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

//View for PHQ-2 MEntal Health Exam
struct PHQ2View: View{
    @State var numPHQ2Yes = 0
    var body: some View {
            List{
                Section(header: Text("Over the last 2 weeks, how often have you felt:")) {
                    HStack {
                        Text("1. Little interest or pleasure in doing things")
                        Spacer()
                        YesNo(numberOfYeses: $numPHQ2Yes)
                    }
                        
                    HStack{
                        Text("2. Feeling down, depressed or hopeless")
                        Spacer()
                        YesNo(numberOfYeses: $numPHQ2Yes)
                    }
                }
                Section {
                    NavigationLink(destination: PHQ2Results(numberPHQ2Yes: $numPHQ2Yes))
                            {Text("Click here for PHQ2 result:").bold()
                            }
                    }
            }
            .navigationBarTitle(("PHQ2"))
    }
}

struct PHQ2View_Previews: PreviewProvider {
    static var previews: some View {
        PHQ2View()
    }
}
