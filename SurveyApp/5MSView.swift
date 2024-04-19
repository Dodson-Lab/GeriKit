//
//  5MSView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 4/17/24.
//  Updated 4/18/24
//  Copyright © 2024 Ambika Viswanathan. All rights reserved.
//

import Foundation
import SwiftUI

struct FiveMSView: View {
    
    var body: some View {

        ScrollView{
            Section {
                VStack{
                    Spacer()
                    Text("Geriatrics providers focus on 5 key areas, known as the Geriatric 5Ms*. The “Ms” stand for the targets that are important to care for us all as we age.").fontWeight(.semibold)
                    Spacer()
                    
                    Text("The 5Ms are described below and link to the corresponding screeners in GeriKit when applicable ").font(.subheadline)
                }
                
                //MULTICOMPLEXITY

                HStack{
                    Image("game")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                        .padding()
                    VStack(alignment: .leading){
                        Text("Multicomplexity").font(.headline)
                        HStack{
                            Text(" ")
                            Text("As stated by AGS: 'Multicomplexity describes the whole person, typically an older adult, living with multiple chronic conditions, advanced illness, and/or with complicated biopsychosocial needs.'")
                        }
                    }
                }
                //MIND
                HStack {
                    Image("brain")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                        .padding()
                    VStack{
                        VStack(alignment: .leading){
                            Text("Mind").font(.headline)
                            HStack{
                                Text("•")
                                NavigationLink(destination: CognitionChoice())
                                {
                                    Text("Dementia").foregroundColor(.blue)
                                }
                            }
                            HStack{
                                Text("•")
                                NavigationLink(destination: UBCamView())
                                {
                                    Text("Delirium").foregroundColor(.blue)
                                }
                            }
                            HStack{
                                Text("•")
                                NavigationLink(destination: PHQ2View())
                                {
                                    Text("Depression").foregroundColor(.blue)
                                }
                            }
                            Spacer(minLength: 0.5)
                            HStack{
                                Text("•")
                                Text("Mentation")
                            }
                            Spacer()
                            
                        }
                    }
                }
                
                //MOBILITY
                HStack {
                    Image("elderly")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                        .padding()
                    VStack(alignment: .leading){
                        Text("Mobility").font(.headline)
                        HStack{
                            Text("•")
                            NavigationLink(destination: ADLView())
                            {
                                Text("Amount of Mobility/Function").foregroundColor(.blue)
                            }
                        }
                        HStack{
                            Text("•")
                            NavigationLink(destination: FallChoice())
                            {
                                Text("Fall injury Prevention").foregroundColor(.blue)
                            }
                        }
//                        HStack{
//                            Text("•")
//                            NavigationLink(destination: ChairView())
//                            {
//                                Text("Strength").foregroundColor(.blue)
//                            }
//                        }
//                        HStack{
//                            Text("•")
//                            NavigationLink(destination: FrailtyChoice())
//                            {
//                                Text("Frailty").foregroundColor(.blue)
//                            }
//                        }
                        Spacer(minLength: 0.5)
                        HStack{
                            Text("•")
                            Text("Impaired gait and balance")
                        }
                        Spacer()
                    }
                }
                
                //MEDICATION
                HStack {
                    Image("drugs")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                        .padding()
                    VStack(alignment: .leading){
                        Text("Medications").font(.headline)
                        HStack{
                            Text("•")
                            NavigationLink(destination: MedicineView())
                            {
                                Text("Polypharmacy; deprescribing").foregroundColor(.blue)
                            }
                        }
                        Spacer(minLength: 0.5)
                        HStack{
                            Text("•")
                            Text("Optimal prescribing")
                        }
                        
                        Spacer(minLength: 0.5)
                        HStack{
                            Text("•")
                            Text("Adverse medication effects and medication burden")
                        }
                        Spacer()
                        
                    }
                }
                
                //Matters
                HStack {
                    Image("plan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                        .padding()
                    VStack(alignment: .leading){
                        Text("What matters most?").font(.headline)
                        HStack{
                            Text("•")
                            NavigationLink(destination: MedicineView())
                            {
                                Text("Advance care planning").foregroundColor(.blue)
                            }
                        }
                        Spacer()
                        
                    }
                }
                VStack(alignment: .leading){
                    Text("Resources:").font(.headline)
                    Spacer(minLength: 0.5)
                    HStack{ Text("•")
                    VStack(alignment: .leading){
                        Text("HealtinAging 5Ms Tip Sheet")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let murl = URL.init(string: "https://www.healthinaging.org/sites/default/files/media/pdf/HIA-TipSheet%20Geriatric%205Ms.July20_0.pdf")
                                guard let mURL = murl, UIApplication.shared.canOpenURL(mURL) else { return }
                                UIApplication.shared.open(mURL)}
                    }
                }
                    Spacer(minLength: 0.5)
                    HStack{ Text("•")
                        VStack(alignment: .leading){
                            Text("HealtinAging 5Ms Resources")
                                .foregroundColor(.blue)
                                .underline()
                                .onTapGesture {
                                    let murls = URL.init(string: "https://www.healthinaging.org/age-friendly-healthcare-you")
                                    guard let mURLs = murls, UIApplication.shared.canOpenURL(mURLs) else { return }
                                    UIApplication.shared.open(mURLs)}
                        }
                    }
                    Spacer()
                    Text("\nAdapted from Healthin Aging 5Ms by the American Geriatrics Soceity (AGS)").font(.footnote)
                    Spacer()
                    Text("© Frank Molnar & Allen Huang, University of Ottawa; Mary Tinetti, Yale University").font(.footnote)
                }
                
            }
        }
        .navigationBarTitle("The 5Ms of Geriatrics")
    }
}

struct FiveMSView_Preview: PreviewProvider {
    static var previews: some View {
        FiveMSView()
    }
}
