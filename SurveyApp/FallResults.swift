//
//  FallResults.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct FallResults: View {
    @Binding var numberFallYes: Int
    @State private var isNavigation = false
        
    func fallResults(numberFalls: Int)-> String {
        if numberFalls > 0{
            self.isNavigation = true;
            return("The patient screened positive for fall risk:")
        }
        else {
            return("Based on this questionnaire, the patient is not high risk for falls at this time.")
        }
    }
       var body: some View {
        VStack(alignment: .center){
            Text("Fall History Results").font(.system(size: 60)).multilineTextAlignment(.center)
                
            Spacer().frame(height: 30)

            //
            Text(fallResults(numberFalls: numberFallYes)).bold().font(.system(size: 30)).multilineTextAlignment(.center)
//
//            Spacer().frame(height: 60)
//
            Spacer().frame(height: 30)
            
            HStack{
                if numberFallYes > 0{
                Button(action: {
                    self.isNavigation = true
                    }, label: {Text("Next Steps")}).frame(maxWidth: .infinity)
                    .padding(10)
                    .buttonStyle(BorderlessButtonStyle())
                    .background(isNavigation ? Color.blue : Color.gray)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                }
                Button(action: {
                    self.isNavigation = false
                    },label: {Text("Resources")}).frame(maxWidth: .infinity)
                    .padding(10)
                    .buttonStyle(BorderlessButtonStyle())
                    .background(isNavigation ? Color.gray : Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            
            if(isNavigation){
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    //"Consider"
                    Text("1. Orthostatic blood pressure measurement").multilineTextAlignment(.leading)
                    Text("2. Physical therapy referral")
                    Text("3. Consider a cane or walker")
                    Text("4. Home safety evaluation")
                    Text("4. Consider screening for low vision")
                }.background(Color(.systemGray6))
                .cornerRadius(10)
            }
            else{
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    //LINK TO SOMETHING ON ORTHOSTATIC VITALS
                    Text("1. Orthostatic vital signs measurement")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.cdc.gov/steadi/pdf/STEADI-Assessment-MeasuringBP-508.pdf")
                        guard let orthoStat = url, UIApplication.shared.canOpenURL(orthoStat) else { return }
                        UIApplication.shared.open(orthoStat)}

                    Spacer().frame(height: 10)

                    //LINK TO FALL MEDICATION LIST, BEER'S LIST!!!!!
                    Text("2. Medications associated with falls")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            let url2 = URL.init(string: "https://www.guidelinecentral.com/summaries/american-geriatrics-society-2015-updated-beers-criteria-for-potentially-inappropriate-medication-use-in-older-adults/#section-society")
                            guard let beersList = url2, UIApplication.shared.canOpenURL(beersList) else { return }
                            UIApplication.shared.open(beersList)}.multilineTextAlignment(.leading)
                    
                    Spacer().frame(height: 10)
                    
                    //LINK CDC
                    Text("3. CDC Fall Screener")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.cdc.gov/steadi/pdf/STEADI-Algorithm-508.pdf")
                        guard let fallURL = url, UIApplication.shared.canOpenURL(fallURL) else { return }
                        UIApplication.shared.open(fallURL)}
                }.background(Color(.systemGray6))
                .cornerRadius(10)
                
                //
            }

        }.padding()
    }
}

//struct FallResults_Previews: PreviewProvider {
//    static var previews: some View {
//        FallResults()
//    }
//}
