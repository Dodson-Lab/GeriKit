////
////  MiniCogResults.swift
////  SurveyApp
////
////  Created by Ambika Viswanathan on 10/13/20.
////  Copyright © 2020 Ambika Viswanathan. All rights reserved.
////
//
//import SwiftUI
//
//
//struct ChairResults: View {
//    @Binding private var numStands = 0
//    @Binding private var numAge = 0
//
//    var body: some View {
//       List {
////
//        Section(footer: Text("A cut off point of <3 on the Mini-CogTM has been validated for dementia screening, but many individuals with clinically meaningful cognitive impairment with score higher. When greater sensitivity is desired, a cut point of <4 is recommended as it may indicate a need for further evaluation of cognitive status.")){
//            Text("Total Score: \(self.numberOfWords + self.clock)").bold()
//        }
//
//        Section{
//            Text("Resources:")
//            VStack(alignment: .leading){
//                Text("1. MiniCogⒸ")
//                .foregroundColor(.blue)
//                .underline()
//                .onTapGesture {
//                    let url = URL.init(string: "http://mini-cog.com/wp-content/uploads/2018/03/Standardized-English-Mini-Cog-1-19-16-EN_v1-low-1.pdf")
//                    guard let ad8URL = url, UIApplication.shared.canOpenURL(ad8URL) else { return }
//                    UIApplication.shared.open(ad8URL)}
//
////                Spacer().frame(height: 10)
////
////                Text("2. AD8 Original Manuscript")
////                    .foregroundColor(.blue)
////                    .underline()
////                    .onTapGesture {
////                        let url2 = URL.init(string: "https://pubmed.ncbi.nlm.nih.gov/16116116/")
////                        guard let ad8URL2 = url2, UIApplication.shared.canOpenURL(ad8URL2) else { return }
////                        UIApplication.shared.open(ad8URL2)}.multilineTextAlignment(.leading)
//            }
//            .padding(10)
//            .cornerRadius(10)        }
//
//       }.padding()
//        .navigationBarTitle("MiniCogⒸ Scoring")
//
//    }
//}
//
//struct MiniCogResults_Previews: PreviewProvider {
//    static var previews: some View {
//        MiniCogResults()
//    }
//}
