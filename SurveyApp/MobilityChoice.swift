//
//  MobilityChoice.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct MobilityChoice: View{
    var body: some View{
        VStack(alignment: .center){
            NavigationLink(destination: ADLView()){
            Text("ADL Assessment")
                .padding(10)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 36))
                .multilineTextAlignment(.center)
            }

            Spacer().frame(height:20)
            NavigationLink(destination: GaitChoice()){
            Text("GAIT Assessment")
                .padding(10)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 36))
                .multilineTextAlignment(.center)
            }

        }
    }
}

struct MobilityChoice_Previews: PreviewProvider {
    static var previews: some View {
        MobilityChoice()
    }
}
