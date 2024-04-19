//
//  ContentView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 6/29/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

//form just in case

// -- main
struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                Group {
                    NavigationLink(destination: CognitionChoice())
                    {HStack{
                        Image("brain")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:80)
                            .padding()
                        Text("Cognition")
                    }}
                    NavigationLink(destination: UBCamView())
                      {HStack{
                          Image("amnesia")
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(width:80)
                              .padding()
                          Text("Delirium")
                          }}
                    NavigationLink(destination: PHQ2View())
                    {HStack{
                        Image("emotion")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:80)
                            .padding()
                        Text("Depression")
                    }}
                    NavigationLink(destination: MobilityChoice())
                    {HStack{
                        Image("elderly")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:80)
                            .padding()
                        Text("Function")
                    }}
                }
                Group {
                    NavigationLink(destination: FallView())
                    {HStack{
                        Image("fall")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:80)
                            .padding()
                        Text("Falls")
                    }}
                    NavigationLink(destination: NutritionView())
                    {HStack{
                        Image("kitchen")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:80)
                            .padding()
                        Text("Nutrition")
                    }}
                    NavigationLink(destination: MedicineView())
                    {HStack{
                        Image("drugs")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:80)
                            .padding()
                        Text("Medications")
                    }}
                    NavigationLink(destination: AdvancedCareView())
                    {HStack{
                        Image("plan")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:80)
                            .padding()
                        Text("Advance Care Planning")
                    }
                    }
                    Group {
                        NavigationLink(destination: FrailtyView())
                        {HStack{
                            Image("arm")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:80)
                                .padding()
                            Text("Frailty")
                        }}
                    }
                    Group {
                        HStack{
                            //                        Image("survey")
                            //                        .resizable()
                            //                        .aspectRatio(contentMode: .fit)
                            //                        .frame(width:80)
                            //                        .padding()
                            Text("Click here to take a survey about GeriKit.")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    let url = URL.init(string: "https://nyumc.qualtrics.com/jfe/form/SV_9NrUEStP5yiGbXL")
                                    guard let survey = url, UIApplication.shared.canOpenURL(survey) else { return }
                                    UIApplication.shared.open(survey)}
                            
                        }
                        HStack{
                            Text("© NYU Grossman School of Medicine 2023")
                                .frame(maxWidth: .infinity, alignment: .center)
                            // .foregroundColor(.blue)
                            // .onTapGesture {
                            //     let url = URL.init(string: "https://unc.az1.qualtrics.com/jfe/form/SV_0PScJUobnquCRa5")
                            //     guard let survey = url, UIApplication.shared.canOpenURL(survey) else { return }
                            //     UIApplication.shared.open(survey)}
                            
                        }
                    }.navigationBarTitle("GeriKit", displayMode: .automatic)
                        .navigationBarItems(trailing:
                                                HStack {
                            NavigationLink(destination:AboutView()){Text("About")}
                            
                        })
                    
                }}
            }
        }
    }

//FIXME: "About" section doesn't appear until scrolling about halfway down main page


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
