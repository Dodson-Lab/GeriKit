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
            VStack(alignment: .leading){
                Text("Geriatrics providers focus on 5 key areas, known as the Geriatric 5Ms™. The “Ms” stand for the targets that are important to care for us all as we age.").fontWeight(.semibold)        .padding(.horizontal)

                                        
                    Text("The Geriatric 5Ms™ are described below and link to the corresponding screeners in GeriKit when applicable ").font(.subheadline).padding()
                
                
                //MULTICOMPLEXITY
                Divider()

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
                            Text("As stated by the 5Ms™: 'Multicomplexity describes the whole person, typically an older adult, living with multiple chronic conditions, advanced illness, and/or with complicated biopsychosocial needs.'")
                        }
                    }
                }.padding()
                
                //MIND
                Divider()
                HStack {
                    Image("brain")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                        .padding()
                    VStack{
                        VStack(alignment: .leading){
                            Text("Mind").font(.headline)
                            Spacer()
                            HStack{
                                Text("•")
                                NavigationLink(destination: CognitionChoice())
                                {
                                    Text("Dementia").foregroundColor(.blue)
                                }
                            }
                            Spacer()
                            HStack{
                                Text("•")
                                NavigationLink(destination: CAMLethargy())
                                {
                                    Text("Delirium").foregroundColor(.blue)
                                }
                            }
                            Spacer()
                            HStack{
                                Text("•")
                                NavigationLink(destination: PHQ2View())
                                {
                                    Text("Depression").foregroundColor(.blue)
                                }
                            }
                            Spacer()
                            HStack{
                                Text("•")
                                Text("Mentation")
                            }
                            Spacer()
                            
                        }
                    }
                }.padding()
                Divider()
                //MOBILITY
                HStack {
                    Image("elderly")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                        .padding()
                    VStack(alignment: .leading){
                        Text("Mobility").font(.headline)
                        Spacer()
                        HStack{
                            Text("•")
                            NavigationLink(destination: ADLView())
                            {
                                Text("Amount of Mobility/Function").foregroundColor(.blue)
                            }
                        }
                        Spacer()
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
                        Spacer()
                        HStack{
                            Text("•")
                            Text("Impaired gait and balance")
                        }
                        Spacer()
                    }
                }.padding()
                Divider()
                //MEDICATION
                HStack {
                    Image("drugs")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                        .padding()
                    VStack(alignment: .leading){
                        Text("Medications").font(.headline)
                        Spacer()
                        HStack{
                            Text("•")
                            NavigationLink(destination: MedicineView())
                            {
                                Text("Polypharmacy; deprescribing").foregroundColor(.blue)
                            }
                        }
                        Spacer()
                        HStack{
                            Text("•")
                            Text("Optimal prescribing")
                        }
                        
                        Spacer()
                        HStack{
                            Text("•")
                            Text("Adverse medication effects and medication burden")
                        }
                        Spacer()
                        
                    }
                }.padding()
                
                //Matters
                Divider()
                HStack {
                    Image("plan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50)
                        .padding()
                    VStack(alignment: .leading){
                        Text("What matters most?").font(.headline)
                        //Spacer()
                        HStack{
                            Text("•")
                            NavigationLink(destination: AdvancedCareView())
                            {
                                Text("Advance care planning").foregroundColor(.blue)
                            }
                        }
                        Spacer()
                        
                    }
                }.padding()
                Divider()
                VStack(alignment: .leading){
                    Text("Resources:").font(.headline)
                    Spacer()
                    HStack{ Text("•")
                    VStack(alignment: .leading){
                        Text("Geriatric 5Ms™ Tip Sheet")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let murl = URL.init(string: "https://www.healthinaging.org/sites/default/files/media/pdf/HIA-TipSheet%20Geriatric%205Ms.July20_0.pdf")
                                guard let mURL = murl, UIApplication.shared.canOpenURL(mURL) else { return }
                                UIApplication.shared.open(mURL)}
                    }
                }
                    Spacer().frame(height: 10)
                    HStack{ Text("•")
                        VStack(alignment: .leading){
                            Text("Geriatric 5Ms™ Resources")
                                .foregroundColor(.blue)
                                .underline()
                                .onTapGesture {
                                    let murls = URL.init(string: "https://www.healthinaging.org/age-friendly-healthcare-you")
                                    guard let mURLs = murls, UIApplication.shared.canOpenURL(mURLs) else { return }
                                    UIApplication.shared.open(mURLs)}
                        }
                    }
                    Spacer()
                    Text("\nCopyright © 2017 Frank Molnar, Allen Huang, Mary Tinetti. 2017. The Geriatric 5Ms™ may be used for educational purposes with full attribution and no alterations. This work is bound by the Creative Commons TM license CC-BY-NC-ND 4.0 (https://creativecommons.org/licenses/by-nc-nd/4.0/  ).").font(.footnote)
//                    Text("\nAdapted from Healthin Aging 5Ms by the American Geriatrics Soceity (AGS)")                    Spacer()
//                    Text("© Frank Molnar & Allen Huang, University of Ottawa; Mary Tinetti, Yale University").font(.footnote)
                }.padding()
                
            }.padding()
        }
        .navigationBarTitle("The Geriatric 5Ms™")
    }
}

struct FiveMSView_Preview: PreviewProvider {
    static var previews: some View {
        FiveMSView()
    }
}
