//
//  3DCamResultsView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 4/19/24.
//  Copyright © 2024 Ambika Viswanathan. All rights reserved.
//

import Foundation
import SwiftUI

struct ThreeDCamResultsView: View {
    
    //bool var of question 2.1 or 2.2
    @Binding var q2: [Bool]
    // bool var of q3, q4, q5
    @Binding var q3: Bool
    @Binding var q4: Bool
    @Binding var q5: Bool
    
    //array of answers for q6-q9
    @Binding var q6_ans: [Bool]
    @Binding var q7_ans: [Bool]
    @Binding var q8_ans: [Bool]
    @Binding var q9_ans: [Bool]

    //bool var for q6-q9
    @State var q6 = false
    @State var q7 = false
    @State var q8 = false
    @State var q9 = false

    //nav bar variable
    @State private var isNavigation = false


    func camResults(q2: [Bool], q3: Bool, q4: Bool, q5: Bool, q6: Bool, q7: Bool, q8: Bool, q9: Bool)-> String {
        var feature1 = false
        var feature2 = false
        var feature3 = false
        var feature4 = false
        //var isDel = false
        
        if (q5 || q9) {feature1 = true}
        if (q4 || q8 || q2[1]) {feature2 = true}
        if (q3 || q7 || q2[0]) {feature3 = true}
        if (q6) {feature4 = true}
        
        if(feature1 && feature2 && ((feature3 == true) || (feature4 == true))){
            return("The patient has screened positive for delirium)")
        }
        else {
            return("The patient has not screened positive for delirium")
            }
        }
    
    var body: some View {
        ScrollView{
            VStack{
                Text("3D-CAM Results Page").font(.system(size: 60)).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
                
                Spacer().frame(height: 30)

                Text("\(camResults(q2: q2, q3: q3, q4: q4, q5: q5, q6: q6, q7: q7, q8: q8, q9: q9))")
                    .font(.system(size: 36)).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true).padding()
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
                    // }
                    Button(action: {
                        self.isNavigation = false
                    },label: {Text("Resources")}).frame(maxWidth: .infinity)
                        .padding(10)
                        .buttonStyle(BorderlessButtonStyle())
                        .background(isNavigation ? Color.gray : Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                
            }
            if(isNavigation){
                Spacer().frame(height: 10)
                
                VStack(alignment: .leading){
                    HStack{
                        Text("•")
                        Text("Evaluatation and Management of Delirium")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let url = URL.init(string: "https://www.cdc.gov/steadi/pdf/TUG_test-print.pdf")
                                guard let tugURL = url, UIApplication.shared.canOpenURL(tugURL) else { return }
                                UIApplication.shared.open(tugURL)}
                        //
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
                    HStack{
                        Text("•")
                        Text("UB-CAM Detail")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let url = URL.init(string: "https://deliriumnetwork.org/wp-content/uploads/2020/07/UB-CAM_Final-1.pdf")
                                guard let camURL = url, UIApplication.shared.canOpenURL(camURL) else { return }
                                UIApplication.shared.open(camURL)}
                    }
                    Spacer()
                    HStack{
                        Text("•")
                        Text("UB-CAM Training Manual")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let url = URL.init(string: "https://americandeliriumsociety.org/wp-content/uploads/2021/08/UB-CAM_Training-Manual.pdf")
                                guard let ubmanURL = url, UIApplication.shared.canOpenURL(ubmanURL) else { return }
                                UIApplication.shared.open(ubmanURL)}
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            Spacer()
            //                Text("\nAdapted from CDC’s STEADI tools and resources that can help you screen, assess, and intervene to reduce your patient’s fall risk.").font(.footnote)
            
        }.padding()
        
            .onAppear(perform:{
                for answer in self.q6_ans {
                    if answer {
                        self.q6 = true
                        break // Exit the loop once q5s is set to true
                    }
                }
                
                for answer in self.q7_ans {
                    if answer {
                        self.q7 = true
                        break // Exit the loop once q5 is set to true
                    }
                }
                
                for answer in self.q8_ans {
                    if answer {
                        self.q8 = true
                        break // Exit the loop once q5 is set to true
                    }
                }
                for answer in self.q9_ans {
                    if answer {
                        self.q9 = true
                        break // Exit the loop once q5 is set to true
                    }
                }
                
            })
    }
    
}

//struct ThreeDCamResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThreeDCamResultsView()
//    }
//}
//    
