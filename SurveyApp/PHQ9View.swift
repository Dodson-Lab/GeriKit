//
//  PHQ9View.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Updated 4/18/2024
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

//func isAlert(number: Int) -> Bool{
//    if (number > 0){return true}
//    else {return false}
//}

struct PHQ9View: View{
    @State var numPHQ9Yes = 0
    @State var redAlert:Bool = false
    @State var redAlert9:Bool = false
   // @Environment(\.defaultMinListRowHeight) var minRowHeight


    var body: some View {
        ScrollView(Axis.Set.vertical, showsIndicators: true){
            Section{
                
            Text("Ask the patient: how often have they been bothered by the following over the past 2 weeks?")
                    .bold().padding(.horizontal)
            
 
                   // Spacer()
                
                    VStack {
                        Text("1. Little interest or pleasure in doing things.")
                        fourButtonChoices(questionScore: $numPHQ9Yes, isAlert: $redAlert)
            
                        Text("2. Feeling down, depressed, or hopeless.")
                        fourButtonChoices(questionScore: $numPHQ9Yes, isAlert: $redAlert)

                        Text("3. Trouble falling or staying asleep, or sleeping too much.")
                        fourButtonChoices(questionScore: $numPHQ9Yes, isAlert: $redAlert)

                        Text("4. Feeling tired or having little energy.")
                        fourButtonChoices(questionScore: $numPHQ9Yes, isAlert: $redAlert)

                        Text("5. Poor appetite or overeating.")
                        fourButtonChoices(questionScore: $numPHQ9Yes, isAlert: $redAlert)
                    }
                   VStack{
                        Text("6. Feeling bad about yourself — or that you are a failure or have let yourself or your family down.")
                        fourButtonChoices(questionScore: $numPHQ9Yes, isAlert: $redAlert)

                        Text("7. Trouble concentrating on things, such as reading the newspaper or watching television.")
                        fourButtonChoices(questionScore: $numPHQ9Yes, isAlert: $redAlert)

                        Text("8. Moving or speaking so slowly that other people could have noticed? Or so fidgety or restless that you have been moving a lot more than usual.")
                        fourButtonChoices(questionScore: $numPHQ9Yes, isAlert: $redAlert)
                   }
                    VStack{
                        Text("9. Thoughts that you would be better off dead, or thoughts of hurting yourself in some way.")
                            fourButtonChoices(questionScore: $numPHQ9Yes, isAlert: $redAlert9)
                    }
            }.padding()

                Section{
                    NavigationLink(destination: PHQ9Results(numberPHQ9Yes: $numPHQ9Yes, alert: $redAlert9))
                            {Text("Click here for PHQ9 result:").bold()
                    }.foregroundColor(.blue).multilineTextAlignment(.leading)
                    }


            }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarTitle(("PHQ9"))

            
    }
}

struct PHQ9View_Previews: PreviewProvider {
    static var previews: some View {
        PHQ9View()
    }
}

