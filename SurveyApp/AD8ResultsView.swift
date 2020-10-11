//
//  AD8ResultsView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct AD8ResultsView: View {
    @Binding var numberAD8Yes: Int
    @State private var isNavigation = false
    
    func ad8Results(number: Int)-> String {
        if number > 1{
            self.isNavigation = true;
            return("suggests that cognitive impairment is likely to be present.")
        }
        else {
            return("suggests normal cognition.")
        }
    }
       var body: some View {
        VStack(alignment: .center){
            Text("AD8 Result").font(.system(size: 60))
                
            Spacer().frame(height: 30)
             
            Text("The score of \(numberAD8Yes)/8 \(ad8Results(number: numberAD8Yes))").bold().font(.system(size: 30)).multilineTextAlignment(.center)

            Spacer().frame(height: 40)

//            Text("Based on clinical research findings from 995 individuals included in the development and validation samples, the following cut off points are provided: \n\n0 – 1: Normal cognition \n\n2 or greater: Cognitive impairment is likely to be present ").multilineTextAlignment(.center)
//
            Spacer().frame(height: 30)
            
            HStack{
                if(numberAD8Yes > 1){
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
                    Text("1. Check for reversible causes of cognitive impairment").multilineTextAlignment(.leading)
                    Text("2. Consider further neuropsychological testing")
                }.background(Color(.systemGray6))
                .padding(10)
                .cornerRadius(10)
            }
            else{
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    Text("1. AD8 Detail")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.alz.org/media/Documents/ad8-dementia-screening.pdf")
                        guard let ad8URL = url, UIApplication.shared.canOpenURL(ad8URL) else { return }
                        UIApplication.shared.open(ad8URL)}

                    Spacer().frame(height: 10)

                    Text("2. AD8 Original Manuscript")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            let url2 = URL.init(string: "https://pubmed.ncbi.nlm.nih.gov/16116116/")
                            guard let ad8URL2 = url2, UIApplication.shared.canOpenURL(ad8URL2) else { return }
                            UIApplication.shared.open(ad8URL2)}.multilineTextAlignment(.leading)
                }.background(Color(.systemGray6))
                .padding(10)
                .cornerRadius(10)
            }

        }.padding()
    }
}



