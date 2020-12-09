//
//  ChairResults.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct ChairResults: View {
    @Binding var numStands: Int
    @Binding var numAge: Int

       var body: some View {
        List{
            Text("Number of Stands: \(self.numStands) and Age: \(self.numAge)")
            Image("chairscore")
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
       .navigationBarTitle("Chair Stands Results")
    }
}

//struct ChairResults_Previews: PreviewProvider {
//    static var previews: some View {
//        ChairResults()
//    }
//}

//struct ChairResults_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}

struct ChairResults_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
