//
//  PHQ9View.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct PHQ9View: View{
    @State var numPHQ9Yes = 0
    @State var temp = 0
    @State var redAlert:Bool = false
    var body: some View {
            ScrollView{
                Section(header: Text("Over the last 2 weeks, how often have you been bothered by the following problems?")) {
                    HStack {
                        Text("1. Little interest or pleasure in doing things")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                        
                    HStack{
                        Text("2. Feeling down, depressed or hopeless")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("3. Trouble falling or staying asleep, or sleeping too much?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("4. Feeling tired or having little energy?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("5. Poor appetite or overeating?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("6. Feeling bad about yourself — or that you are a failure or have let yourself or your family down?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("7. Trouble concentrating on things, such as reading the newspaper or watching television?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("8. Moving or speaking so slowly that other people could have noticed? Or so fidgety or restless that you have been moving a lot more than usual?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("9. Thoughts that you would be better off dead, or thoughts of hurting yourself in some way?").onTapGesture {
                            self.redAlert = !self.redAlert
                        }
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes) //.onTapGesture { if(self.numPHQ9Yes > self.temp) {self.redAlert = true} }
                        //Text("temp: \(temp), numPHQ9Yes: \(numPHQ9Yes), redAlert: \(redAlert ? "hello" : "goodbye")")
                    }
                    //if(numPHQ9Yes > temp) {Text("ALERT")}

                }
                Section{
                    NavigationLink(destination: PHQ9Results(numberPHQ9Yes: $numPHQ9Yes, alert: $redAlert))
                            {Text("Click here for PHQ9 result: \(numPHQ9Yes)").bold()
                            }
                    }
            }
    .padding()
            .navigationBarTitle(("PHQ9"))
    }
}

struct PHQ9View_Previews: PreviewProvider {
    static var previews: some View {
        PHQ9View()
    }
}
