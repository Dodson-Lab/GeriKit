//
//  FallView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Updated 4/18/24
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct FallView: View{
    @State var numFallYes = 0
    @State var ifFall = false
    @State var quantity: Int = 0
    @State var temp = 0

    var body: some View {
            List{
                Section(header: Text("Ask the patient...")) {
                    HStack {
                        Text("Do you feel unsteady when standing or walking?")
                        Spacer()
                        YesNo(numberOfYeses: $numFallYes)
                    }
                    HStack{
                        Text("Have you fallen in the last year?")
                        Spacer()
                        YesNo(numberOfYeses: $numFallYes)
                        
                    }
                                        
//                    HStack {
//                            Text("How many times, if any, have you fallen in the last year?")
//                            Spacer()
//                            Stepper(value: $quantity, in: 0...10, label: { Text("\(quantity)")})
//                        }
                    }
                
                NavigationLink(destination: FallResults(numberFallYes: $numFallYes))
                        {Text("Click here for fall screening result:").bold()
                        }.foregroundColor(.blue)
            }
            .navigationBarTitle(("Fall Screening"))
    }
}

struct FallView_Previews: PreviewProvider {
    static var previews: some View {
        FallView()
    }
}
