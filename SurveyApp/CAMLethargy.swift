//
//  CAMLethargy.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 4/20/24.
//  Copyright © 2024 Ambika Viswanathan. All rights reserved.
//

import Foundation
import SwiftUI

struct CAMLethargy: View{
    //code for just yes/no phq2
    @State var q1 = false
    @State var isNavigation = false
    
    var body: some View {
        List{
            Section {
                Text("Does the patient have:").font(.subheadline)
                
                HStack{
                    Spacer()
                    Text("Click if positive").italic().font(.footnote)
                }
                HStack {
                    Toggle("Severe lethargy or severe altered level of consciousness (no or minimal response to voice/touch).", isOn: $q1).font(.headline)
                }
                
            }
            if(!q1){
                Section{
                    Text("If not present, proceed to UB‐2 Screener.")
                    NavigationLink(destination: UBCamView())
                    {Text("Click here for the UB‐2 Screener:").bold()
                    }.foregroundColor(.blue)
                }
            }
            else{
                Section{
                    Text("Severe lethary or severe altred level of consciousness has been evaluated as present. Terminate assessment and ratings.")
                    Text("Patient is considered DELIRIOUS.").font(.headline)
                    
                }
                HStack{
                    // if intTime >= 12{
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
                
                if(isNavigation){
                    
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
                
            }
        }
        .navigationBarTitle(("UB-CAM Part 1"))
    }
}

struct CAMLethargy_Previews: PreviewProvider {
    static var previews: some View {
        CAMLethargy()
    }
}

