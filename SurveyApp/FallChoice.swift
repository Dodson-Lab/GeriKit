//
//  FallChoice.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Updated 4/18/24
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct FallChoice: View{
    var body: some View{
        VStack(alignment: .center){
            NavigationLink(destination: TUGView()){
            Text("Click here for Timed Up \n & Go (TUG) ")
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .font(.system(size: 36))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }

            Spacer().frame(height:20)
            NavigationLink(destination: FallView()){
            Text("Click here for 2 question \n fall risk screener")
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .font(.system(size: 36))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)

            }

        }.padding(1.05)
    }
}

struct FallChoice_Previews: PreviewProvider {
    static var previews: some View {
        FallChoice()
    }
}
