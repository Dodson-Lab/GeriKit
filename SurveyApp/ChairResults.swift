//
//  ChairResults.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI


struct ChairResults: View {
    @Binding var patAge: String
    @Binding var numStands: String
    @Binding var gender: Int
    @State private var isNavigation = true
    @State private var intAge = 0
    @State private var intStands = 0

    var body: some View {
        VStack{
            Text("Fall Screening Results").font(.system(size: 60)).multilineTextAlignment(.center)
            
            Spacer().frame(height: 30)
            
            Text("The patient is \(self.intAge) years old and completed \(self.intStands) chair stands. \(chairLogic(age: intAge, stands: intStands, gen: self.gender))").font(.system(size: 36)).multilineTextAlignment(.center)
            
           Spacer().frame(height: 30)
            
            HStack{
                Button(action: {
                    self.isNavigation = true
                    }, label: {Text("Next Steps")}).frame(maxWidth: .infinity)
                    .padding(10)
                    .buttonStyle(BorderlessButtonStyle())
                    .background(isNavigation ? Color.blue : Color.gray)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                
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
                    Text("Refer to GeriKit's Fall Screener for more information").multilineTextAlignment(.leading)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            else{
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    Text("1. 30-Second Chair Stands Detail")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.cdc.gov/steadi/pdf/STEADI-Assessment-30Sec-508.pdf")
                        guard let phq9URL = url, UIApplication.shared.canOpenURL(phq9URL) else { return }
                        UIApplication.shared.open(phq9URL)}
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                }
        Spacer()
            
    }.padding().onAppear(perform:{
            self.intAge = 0
            self.intStands = 0
            if self.patAge != "" {self.intAge = Int(self.patAge)!}
            if self.numStands != "" {self.intStands = Int(self.numStands)!}
        })
    }
}
        

//       var body: some View {
//        VStack(alignment: .center){
//            Text("Fall Screening Results").font(.system(size: 60)).multilineTextAlignment(.center)
//
//            Spacer().frame(height: 30)
//
//            //
//           // Text(chairResults(age: numStands)).font(.system(size: 36)).multilineTextAlignment(.center)
//
//            Spacer().frame(height: 30)
//
//            HStack{
//                if numStands > 0{
//                Button(action: {
//                    self.isNavigation = true
//                    }, label: {Text("Next Steps")}).frame(maxWidth: .infinity)
//                    .padding(10)
//                    .buttonStyle(BorderlessButtonStyle())
//                    .background(isNavigation ? Color.blue : Color.gray)
//                    .foregroundColor(Color.white)
//                    .cornerRadius(10)
//                }
//                Button(action: {
//                    self.isNavigation = false
//                    },label: {Text("Resources")}).frame(maxWidth: .infinity)
//                    .padding(10)
//                    .buttonStyle(BorderlessButtonStyle())
//                    .background(isNavigation ? Color.gray : Color.blue)
//                    .foregroundColor(Color.white)
//                    .cornerRadius(10)
//            }
//
//            if(isNavigation){
//                Spacer().frame(height: 10)
//                VStack(alignment: .leading){
//                    //"Consider"
//                    Text("1. Orthostatic blood pressure measurement").multilineTextAlignment(.leading)
//                    Text("2. Physical therapy referral")
//                    Text("3. Consider a cane or walker")
//                    Text("4. Home safety evaluation")
//                    Text("4. Consider screening for low vision")
//                }
//                .padding()
//                .frame(maxWidth: .infinity, alignment: .center)
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//            }
//            else{
//                Spacer().frame(height: 10)
//                VStack(alignment: .leading){
//                    //LINK TO SOMETHING ON ORTHOSTATIC VITALS
//                    Text("1. Orthostatic vital signs measurement")
//                    .foregroundColor(.blue)
//                    .underline()
//                    .onTapGesture {
//                        let url = URL.init(string: "https://www.cdc.gov/steadi/pdf/STEADI-Assessment-MeasuringBP-508.pdf")
//                        guard let orthoStat = url, UIApplication.shared.canOpenURL(orthoStat) else { return }
//                        UIApplication.shared.open(orthoStat)}
//
//                    Spacer().frame(height: 10)
//
//                    //LINK TO FALL MEDICATION LIST, BEER'S LIST!!!!!
//                    Text("2. Medications associated with falls")
//                        .foregroundColor(.blue)
//                        .underline()
//                        .onTapGesture {
//                            let url2 = URL.init(string: "https://www.guidelinecentral.com/summaries/american-geriatrics-society-2015-updated-beers-criteria-for-potentially-inappropriate-medication-use-in-older-adults/#section-society")
//                            guard let beersList = url2, UIApplication.shared.canOpenURL(beersList) else { return }
//                            UIApplication.shared.open(beersList)}.multilineTextAlignment(.leading)
//
//                    Spacer().frame(height: 10)
//
//                    //LINK CDC
//                    Text("3. CDC Fall Screener")
//                    .foregroundColor(.blue)
//                    .underline()
//                    .onTapGesture {
//                        let url = URL.init(string: "https://www.cdc.gov/steadi/pdf/STEADI-Algorithm-508.pdf")
//                        guard let fallURL = url, UIApplication.shared.canOpenURL(fallURL) else { return }
//                        UIApplication.shared.open(fallURL)}
//                }
//                .padding()
//                .frame(maxWidth: .infinity, alignment: .center)
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//
//            }
//            Spacer()
//
//        }.padding()
//    }
//}
//
