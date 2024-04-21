//
//  PHQ2Results.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Updated 4/18/2024
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
        ScrollView{
        
        VStack(alignment: .center){
            Text("PHQ2 Results").font(.system(size: 60))
            Spacer().frame(height: 30)

            Text("The patient's score of \(numberPHQ2Yes) suggests \(PHQ2Results(number:numberPHQ2Yes))")
                .font(.system(size: 30)).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
            Spacer().frame(height: 30)

            if(self.numberPHQ2Yes > 2) {
                NavigationLink(destination: PHQ9View()) {Text("Click here for PHQ9")}
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .font(.system(size: 36))
                    .multilineTextAlignment(.center)
                Spacer()



            }
            VStack(alignment: .leading){
                HStack{
                    Text("•")
                    Text("PHQ2 Detail")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            let url = URL.init(string: "https://www.apa.org/pi/about/publications/caregivers/practice-settings/assessment/tools/patient-health")
                            guard let phq9URL = url, UIApplication.shared.canOpenURL(phq9URL) else { return }
                            UIApplication.shared.open(phq9URL)}
                }
            }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        
        Text("PHQ2 Copyright © Pfizer Inc. All rights reserved.").font(.footnote)
        }.padding()

        //.navigationBarTitle(("PHQ2 Results"))
    }
    }
}

