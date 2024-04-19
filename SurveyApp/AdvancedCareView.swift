//
//  AdvancedCareView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/13/20.
//  Updated 4/18/24
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//
import SwiftUI

struct AdvancedCareView: View {
    
    var body: some View {
        List{
            Section {
                Text("The following resources are helpful in assisting your discussion about advance care planning with your patient:").font(.body).fontWeight(.heavy)
                Text("Resources for patients, starting the conversation:").font(.callout).fontWeight(.semibold)

                HStack{
                    Text("•")
                    VStack(alignment: .leading){
                        Text("PrepareⒸ for your care")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let prepurl = URL.init(string: "https://prepareforyourcare.org/advance-directive")
                                guard let prepURL = prepurl, UIApplication.shared.canOpenURL(prepURL) else { return }
                                UIApplication.shared.open(prepURL)}
                    }
                }
                HStack{
                    Text("•")
                    VStack(alignment: .leading){
                        Text("The Conversation Project")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let convurl = URL.init(string: "https://theconversationproject.org/")
                                guard let convURL = convurl, UIApplication.shared.canOpenURL(convURL) else { return }
                                UIApplication.shared.open(convURL)}
                    }
                }

                Text("Resources for providers, communication and prognostication:").font(.callout).fontWeight(.semibold)
                HStack{
                    Text("•")
                    VStack(alignment: .leading){
                    Text("Vital Talk: Communication Skills")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            let vitalurl = URL.init(string: "https://www.vitaltalk.org/resources/quick-guides/")
                            guard let vitalURL = vitalurl, UIApplication.shared.canOpenURL(vitalURL) else { return }
                            UIApplication.shared.open(vitalURL)}
                }
            }
                HStack{
                    Text("•")
                    VStack(alignment: .leading){
                        Text("ePrognosis: Collection of Prognostic Calculators")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let progurl = URL.init(string: "https://eprognosis.ucsf.edu//")
                                guard let progURL = progurl, UIApplication.shared.canOpenURL(progURL) else { return }
                                UIApplication.shared.open(progURL)}
                    }
                }
                
                Text("State specific resources").font(.callout).fontWeight(.semibold)
                HStack{
                    Text("•")
                    VStack(alignment: .leading){
                        Text("CaringInfo: Find your State or Territories' Advance Directive Form")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                let ad_url = URL.init(string: "https://www.caringinfo.org/planning/advance-directives/by-state/")
                                guard let adURL = ad_url, UIApplication.shared.canOpenURL(adURL) else { return }
                                UIApplication.shared.open(adURL)}
                    }
                }
                Text("\nModified from: Enhancing Advance Care Planning Communication: An Interactive Workshop With Role-Play for Students and Primary Care Clinicians. https://doi.org/10.15766/mep_2374-8265.10973").font(.footnote)



//            VStack(alignment: .leading){
//                Text("1. PrepareⒸ for your care")
//                .foregroundColor(.blue)
//                .underline()
//                .onTapGesture {
//                    let url = URL.init(string: "https://prepareforyourcare.org/advance-directive")
//                    guard let ad8URL = url, UIApplication.shared.canOpenURL(ad8URL) else { return }
//                    UIApplication.shared.open(ad8URL)}
//                }
            }
        }
        .navigationBarTitle("Advance Care Planning")
    }
}

struct AdvancedCareView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedCareView()
    }
}
