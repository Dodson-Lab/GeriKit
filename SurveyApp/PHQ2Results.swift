//
//  PHQ2Results.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct PHQ2Results: View {
    @Binding var numberPHQ2Yes: Int
    
    func PHQ2Results(number: Int)-> String{
        if number > 2{
            return("they should be further evaluated with the PHQ-9:")
        }
        else {
            return("they did not meet screening criteria for depression.")
        }
    }
    
       var body: some View {
        
        VStack(alignment: .center){
            Text("PHQ2 Results").font(.system(size: 60))
                
            Spacer().frame(height: 30)
             
            Text("The patient's score of \(numberPHQ2Yes) suggests \(PHQ2Results(number:numberPHQ2Yes))").bold().font(.system(size: 30)).multilineTextAlignment(.center)
           
            Spacer().frame(height: 30)

            if(self.numberPHQ2Yes > 2) {
                NavigationLink(destination: PHQ9View()) {Text("Click here for PHQ9")}
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .font(.system(size: 36))
                    .multilineTextAlignment(.center)


            }
        Spacer()
        }.padding()
        //.navigationBarTitle(("PHQ2 Results"))
    }
}

