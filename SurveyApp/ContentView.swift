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
                NavigationLink(destination: FallView())
                  {HStack{
                      Image("fall")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:80)
                          .padding()
                      Text("Fall Risk")
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
                      }}
                HStack{
//                        Image("survey")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width:80)
//                        .padding()
                        Text("Click here to take a survey about GeriKit once you’ve finished your rotation.")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            let url = URL.init(string: "https://unc.az1.qualtrics.com/jfe/form/SV_0PScJUobnquCRa5")
                            guard let survey = url, UIApplication.shared.canOpenURL(survey) else { return }
                            UIApplication.shared.open(survey)}
                    
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
