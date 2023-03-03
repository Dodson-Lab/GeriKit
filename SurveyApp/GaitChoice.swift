//
//  GaitChoice.swift
//  SurveyApp
//
//  Created by Gabriela Lopez Otero 2023.
//  Copyright © 2023 Gabriela Lopez Otero. All rights reserved.
//

import SwiftUI

struct GaitChoice: View{
    var body: some View{
        VStack(alignment: .center){
            NavigationLink(destination: TUGView()){
            Text("Click here if you have a hallway available")
                .padding(10)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .font(.system(size: 36))
                .multilineTextAlignment(.center)
            }

            Spacer().frame(height:20)
            NavigationLink(destination: ChairView()){
            Text("Click here if you do not have a hallway available")
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

struct GaitChoice_Previews: PreviewProvider {
    static var previews: some View {
        GaitChoice()
    }
}
