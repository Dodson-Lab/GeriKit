//
//  UBCamResultsView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 12/5/23.
//  Copyright © 2023 Ambika Viswanathan. All rights reserved.
//

import Foundation
import SwiftUI

struct UBCamResultsView: View {
    @Binding var isQ: [Bool]

    func UBCamResults(vals: [Bool])-> String{
        if (vals[0] == true || vals[1] == true){
            return("The patient scored positive on the Ultra-Brief CAM. They should be further evaluated with the longer 3D-CAM")
        }
        else {
            return("The patient did not meet screening criteria for delirium.")
        }
    }
    
       var body: some View {
        ScrollView{
        
        VStack(alignment: .center){
            Text("Ultra-Brief CAM Results").font(.system(size: 60))
                
            Spacer().frame(height: 30)
             
            Text("\(UBCamResults(vals: isQ))").bold().font(.system(size: 30)).multilineTextAlignment(.center)
           
            Spacer().frame(height: 30)

            if(isQ[0] || isQ[1]) {
                HStack{
                    Text("•")
                    NavigationLink(destination: ThreeDCamView(q2: $isQ)) {Text("Click here for the 3D-CAM")}
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .font(.system(size: 36))
                        .multilineTextAlignment(.center)
                }
            }
        Spacer()
        VStack(alignment: .leading){
            Text("Ultra-Brief CAM Detail")
            .foregroundColor(.blue)
            .underline()
            .onTapGesture {
                let url = URL.init(string: "https://deliriumnetwork.org/wp-content/uploads/2020/07/UB-CAM_Final-1.pdf")
                guard let UBCamURL = url, UIApplication.shared.canOpenURL(UBCamURL) else { return }
                UIApplication.shared.open(UBCamURL)}
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding()
        
            Text("Ultra-Brief CAM Copyright © Edward R. Marcantonio, M.D., SM, Donna M. Fick, RN, PhD, Richard N. Jones, ScD, and Sharon K. Inouye, M.D., MPH. All rights reserved.").font(.footnote)
        }.padding()

        }
    }
}


