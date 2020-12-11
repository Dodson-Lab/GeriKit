//
//  CognitionChoice.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct CognitionChoice: View{
    var body: some View{
        VStack(alignment: .center){
            NavigationLink(destination: MiniCogView()){
            Text("Click here if patient is alone")
                .padding(10)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 36))
                .multilineTextAlignment(.center)
            }

            Spacer().frame(height:20)
            NavigationLink(destination: AD8View()){
            Text("Click here if patient is with a caregiver who knows them well")
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

struct CognitionChoice_Previews: PreviewProvider {
    static var previews: some View {
        CognitionChoice()
    }
}
