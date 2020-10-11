//
//  NutritionResults.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct NutritionResults: View {
       var body: some View {
            VStack(alignment: .center){
            Text("Nutrition History Results").font(.system(size: 60)).multilineTextAlignment(.center)
            Spacer().frame(height: 30)
            }.padding()
        }
    
}

struct NutritionResults_Previews: PreviewProvider {
    static var previews: some View {
        NutritionResults()
    }
}
