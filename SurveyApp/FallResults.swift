//
//  FallResults.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Updated 4/18/24
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct FallResults: View {
    @Binding var numberFallYes: Int
    @State private var isNavigation = false
        
    func fallResults(numberFalls: Int)-> String {
        if numberFalls > 0{
            self.isNavigation = true;
            return("The patient screened positive for fall risk.")
        }
        else {
            return("Based on this questionnaire, the patient is not high risk for falls at this time.")
        }
    }
       var body: some View {
        ScrollView{
        VStack(alignment: .center){
            Text("Fall Screening Results").font(.system(size: 60)).multilineTextAlignment(.center)    .fixedSize(horizontal: false, vertical: true)

            Spacer().frame(height: 30)

            //
            Text(fallResults(numberFalls: numberFallYes)).font(.system(size: 30)).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)

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
                    Text("Consider for your patient: ")
                    HStack{
                        Text("•")
                        Text("Orthostatic blood pressure measurement")
                    }
                    HStack{
                        Text("•")
                        Text("Physical therapy referral")
                    }
                    HStack{
                        Text("•")
                        Text("A cane or walker")
                    }
                    HStack{
                        Text("•")
                        Text("Home safety evaluation")
                    }
                    HStack{
                        Text("•")
                        Text("Screening for low vision")
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            else{
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    //LINK TO SOMETHING ON ORTHOSTATIC VITALS
                    HStack{
                        Text("•")
                        Text("Orthostatic vital signs measurement")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let url = URL.init(string: "https://www.cdc.gov/steadi/pdf/STEADI-Assessment-MeasuringBP-508.pdf")
                                guard let orthoStat = url, UIApplication.shared.canOpenURL(orthoStat) else { return }
                                UIApplication.shared.open(orthoStat)}
                    }

                    Spacer().frame(height: 10)

                    //LINK TO FALL MEDICATION LIST, BEER'S LIST!!!!!
                    HStack{
                        Text("•")
                        Text("Medications associated with falls")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let url2 = URL.init(string: "https://www.guidelinecentral.com/summaries/american-geriatrics-society-2015-updated-beers-criteria-for-potentially-inappropriate-medication-use-in-older-adults/#section-society")
                                guard let beersList = url2, UIApplication.shared.canOpenURL(beersList) else { return }
                                UIApplication.shared.open(beersList)}.multilineTextAlignment(.leading)
                    }
                    Spacer().frame(height: 10)
                    
                    //LINK CDC
                    HStack{
                        Text("•")
                        Text("CDC Fall Screener")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let url = URL.init(string: "https://www.cdc.gov/steadi/pdf/STEADI-Algorithm-508.pdf")
                                guard let fallURL = url, UIApplication.shared.canOpenURL(fallURL) else { return }
                                UIApplication.shared.open(fallURL)}
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
            }
            Spacer()
//            Text("\nAdapted from CDC’s STEADI tools and resources that can help you screen, assess, and intervene to reduce your patient’s fall risk.").font(.footnote)
               

        }.padding()
        }
    }
}

//struct FallResults_Previews: PreviewProvider {
//    static var previews: some View {
//        FallResults()
//    }
//}
