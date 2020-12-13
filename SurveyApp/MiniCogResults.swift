//
//  MiniCogResults.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/13/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//
import SwiftUI


struct MiniCogResults: View {
    @State private var numberOfWords = 0
    @State private var clock = 0
    //private var sum = numberOfWords + clock
    var body: some View {
       Form {
        Section(footer: Text("Number of words spontaneously recalled")){
            Picker("Word recall", selection: $numberOfWords) {
                 ForEach(0 ..< 4) {
                     Text("\($0) words")
                 }
             }
         }
        Section(footer: Text("Normal clock = 2 points. A normal clock has all numbers placed in the correct sequence and approximately correct position (e.g. 12, 3, 6, and 9 are in anchor positions) with no missing or duplicate numbers. Hands are points to the 11 and 2 (11:10). Hand length is not scored.  \n\nInability or refusal to draw a clock (abnormal) = 0 points")){
            Picker("Clock draw", selection: $clock) {
                 ForEach(0 ..< 3) {
                     Text("\($0) points")
                 }
             }
         }
        Section(footer: Text("A cut off point of <3 on the Mini-CogTM has been validated for dementia screening, but many individuals with clinically meaningful cognitive impairment with score higher. When greater sensitivity is desired, a cut point of <4 is recommended as it may indicate a need for further evaluation of cognitive status.")){
            Text("Total Score: \(self.numberOfWords + self.clock)").bold()
        }
        
        Section{
            Text("Resources:")
            VStack(alignment: .leading){
                Text("1. MiniCogⒸ")
                .foregroundColor(.blue)
                .underline()
                .onTapGesture {
                    let url = URL.init(string: "http://mini-cog.com/wp-content/uploads/2018/03/Standardized-English-Mini-Cog-1-19-16-EN_v1-low-1.pdf")
                    guard let ad8URL = url, UIApplication.shared.canOpenURL(ad8URL) else { return }
                    UIApplication.shared.open(ad8URL)}
                
                Text("\nMini-Cog © S. Borson. All rights reserved. ")

            }
            .padding(10)
            .cornerRadius(10)        }

       }.padding()
        .navigationBarTitle("MiniCogⒸ Scoring")

    }
}

struct MiniCogResults_Previews: PreviewProvider {
    static var previews: some View {
        MiniCogResults()
    }
}
