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
        if number > 0{
            return("Given the patient answered yes to one or more of these questions, the patient should be further evaluated with the PHQ-9")
        }
        else {
            return("The patient did not meet screening criteria for depression.")
        }
    }
    
       var body: some View {
        
        VStack(alignment: .center){
            Text("PHQ2 Results").font(.system(size: 60))
                
            Spacer().frame(height: 30)
             
            Text("\(PHQ2Results(number:numberPHQ2Yes))").bold().font(.system(size: 30)).multilineTextAlignment(.center)
           
            if(self.numberPHQ2Yes > 0) {
                NavigationLink(destination: PHQ9View()) {Text("\nPHQ9").bold().font(.system(size: 30))}
            }
        }.padding()
    }
}

