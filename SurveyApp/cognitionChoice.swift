//
//  CognitionChoice.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Updated 4/18/24
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct CognitionChoice: View{
    var body: some View{
        VStack(alignment: .center){
            NavigationLink(destination: MiniCogView()){
            Text("Click here for MiniCog \n (Patient answers)")
                .padding(10)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 36))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)

            }

            Spacer().frame(height:20)
            
            NavigationLink(destination: AD8View()){
            Text("Click here for AD8 \n (Caregiver answers)")
                .padding(10)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 36))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)

            }

        }.padding()


    }

}

struct CognitionChoice_Previews: PreviewProvider {
    static var previews: some View {
        CognitionChoice()
    }
}
