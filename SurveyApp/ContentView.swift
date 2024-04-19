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
                NavigationLink(destination: ADLView())
                  {HStack{
                      Image("elderly")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:80)
                          .padding()
                      Text("Function")
                      }}
                NavigationLink(destination: ChairView())
                  {HStack{
                      Image("chair")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:80)
                          .padding()
                      Text("Strength")
                      }}
                NavigationLink(destination: FallChoice())
                  {HStack{
                      Image("accident")
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

                NavigationLink(destination: FrailtyChoice())
                  {HStack{
                      Image("walker")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:80)
                          .padding()
                      Text("Frailty")
                      }}
                NavigationLink(destination: HearingView())
                  {HStack{
                      Image("hearing")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:80)
                          .padding()
                      Text("Hearing")
                      }}
                NavigationLink(destination: AdvancedCareView())
                  {HStack{
                      Image("plan")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:80)
                          .padding()
                      Text("Advance Care Planning")
                      }}
                NavigationLink(destination: FiveMSView())
                  {HStack{
                      Image("5Ms")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:100)
                          .padding()
                      Text("The 5Ms of Geriatrics")
                      }}
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
                        Text("© NYU Grossman School of Medicine 2024")
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
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
