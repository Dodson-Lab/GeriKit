//
//  ClinFrailtyView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 12/19/23.
//  Updated 4/18/24
//  Copyright © 2023 Ambika Viswanathan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct ClinFrailtyView: View {
    var body: some View{
        ScrollView{
            Spacer()
            Text("Apply your patients clinical picture to these frailty ratings below: ").bold()
            Spacer()
            Image("frailty1")
                .resizable()
                .aspectRatio(contentMode: .fill)
            //.frame(width: 300, height: 400, alignment: .topLeading)
            
            Image("frailty2").resizable()
                .resizable()
                .aspectRatio(contentMode: .fill)
            //.frame(width: 300, height: 400, alignment: .topLeading)
            Spacer()
            VStack(alignment:.leading){
                HStack{
                    Text("•")
                    Text("Clinical Frailty Scale Detail")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            let url = URL.init(string: "https://www.dal.ca/sites/gmr/our-tools/clinical-frailty-scale.html")
                            guard let clinUrl = url, UIApplication.shared.canOpenURL(clinUrl) else { return }
                            UIApplication.shared.open(clinUrl)}
                }
                
                Spacer()
                HStack{
                    Text("•")
                    Text("Clinical Frailty Scale Scoring Information")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            let urls = URL.init(string: "https://www.dal.ca/sites/gmr/our-tools/clinical-frailty-scale/cfs-classification-tree.html")
                            guard let clinUrls = urls, UIApplication.shared.canOpenURL(clinUrls) else { return }
                            UIApplication.shared.open(clinUrls)}
                }
                Text("\nClinical Frailty Scale ©2005-2020 Rockwood, Version 2.0 (EN). All rights reserved.").font(.footnote)

            }.padding()
        }
        .navigationBarTitle("Clinical Frailty Scale")
    }
}
    
struct ClinFrailty_Preview: PreviewProvider {
    static var previews: some View {
        ClinFrailtyView()
    }
}
