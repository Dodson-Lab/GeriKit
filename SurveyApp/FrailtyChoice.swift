//
//  FrailtyChoice.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 12/19/23.
//  Updated 4/18/24
//  Copyright © 2023 Ambika Viswanathan. All rights reserved.
//

import Foundation

import SwiftUI

struct FrailtyChoice: View{
    var body: some View{
        VStack(alignment: .center){
            NavigationLink(destination: FrailScaleView()){
            Text("Click here if in ambulatory setting")
                .padding(10)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 36))
                .multilineTextAlignment(.center)
            }

            Spacer().frame(height:20)
            NavigationLink(destination: ClinFrailtyView()){
            Text("Click here if in inpatient setting")
                .padding(24)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 36))
                .multilineTextAlignment(.center)
            }

        }
    }
}

struct FrailtyChoice_Previews: PreviewProvider {
    static var previews: some View {
        FrailtyChoice()
    }
}
