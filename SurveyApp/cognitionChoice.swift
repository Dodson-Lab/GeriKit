//
//  cognitionChoice.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 9/30/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct cognitionChoice: View{
    
    var body: some View{
        VStack(alignment: .center){
            NavigationLink(destination: MiniCogView()){
            Text("Click here if patient is alone")
                .padding(10)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 40))
                .multilineTextAlignment(.center)
            }

            Spacer().frame(height:20)
            NavigationLink(destination: AD8View()){
            Text("Click here if patient is with a caregiver who knows them well")
                .padding(10)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 40))
                .multilineTextAlignment(.center)
            }

        }
    }
}

struct cognitionChoice_Previews: PreviewProvider {
    static var previews: some View {
        cognitionChoice()
    }
}
