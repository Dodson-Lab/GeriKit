//
//  NutritionView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct NutritionView: View{
    @State var numNutritionYes = ""
    @State var quantity: Int = 0
    @State var quantity2: Int = 0
    @State var weight = ""
    @State var height = ""


    var question1 = ["severe decrease in food intake", "moderate decrease in food intake", "no decrease in food intake"]

    var body: some View {
            List{
                VStack(alignment: .leading){
                    Text("1. Has food intake declined over the past 3 months due to loss of appetite, digestive problems, or swallowing difficulties?\n")
                    Text("0 = severe decrease in food intake")
                    Text("1 = moderate decrease in food intake")
                    Text("2 = no decrease in food intake")
                }.padding()
                
        }.navigationBarTitle(("Mini Nutrition Assessment"))

    }
}

//                VStack(alignment: .leading){
//                    Text("2. Weight loss during the last 3 months? \n")
//                    Text("0 = weight loss greater than 3kg (6.6lbs)")
//                    Text("1 = does not know")
//                    Text("2 = weight loss between 1 and 3kg (2.2 and 6.6lbs)")
//                    Text("3 = no weight loss")
//                    }.padding()
//                VStack(alignment: .leading){
//                    Text("3. Mobility\n")
//                    Text("0 = bed or chair bound")
//                    Text("1 = able to get out of bed/ chair but does not go out")
//                    Text("2 = goes out")
//                    }.padding()
//                VStack(alignment: .leading){
//                    Text("4. Has suffered psychological stress or acute disease in the past 3 months?\n")
//                    Text("0 = yes")
//                    Text("2 = no")
//                    }.padding()
//                VStack(alignment: .leading){
//                    Text("5. Neuropsychological problems\n")
//                    Text("0 = sivere dementia or depression")
//                    Text("1 = mild dementia")
//                    Text("2 = no psychological problems")
//                    }.padding()
//                HStack{
//                    Text("6. Patient height?")
//                    Spacer()
//                   // TextField("Patient weight: ", text: $height)
//                    }.padding()
//                HStack{
//                    Text("7. Patient weight?")
//                    Spacer()
//                    TextField("Patient weight: ", text: $weight)
//                    }.padding()
//                HStack{
//                    Text("Score: ")
//                    Spacer()
//                    //TextField("Score", text: $numNutritionYes)
//
//                }
//                //NavigationLink(destination: NutritionResults(numberFallYes: $numNutritionYes))
//                //{Text("Nutrition Screening Result:").bold()
//                //}
////            }
//    }
//}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}
