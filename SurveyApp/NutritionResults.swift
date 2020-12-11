//
//  NutritionResults.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//
import SwiftUI

struct NutritionResults: View {
    @Binding var score: Int
    @State private var isNavigation = true
    @State var nextStep = ""
    
    func nutritionResults(number: Int)-> (String, String) {
        var next = ""
        var result = ""
        if number >= 12{
            next = "Normal Nutritional Status"
            result = "Rescreen yearly or after an acute event"
            }
        else if (number >= 8 && number <= 11){
            next = "At Risk of Malnutrition"
            result = "If no weight loss: monitor, rescreen every 3 months. \nIf weight loss: treat with diet enhancements, oral nutritional supplementation, and weight monitoring."
        }
        else {
            next = "Malnourished Nutritional Status"
            result = "Treat with nutritional supplementation, diet enhancement, and close weight monitoring."
        }
        return(result, next)
    }
       var body: some View {
        List{
            Text("The score of \(score) suggests the patient has a:\n\n\n \(nutritionResults(number: score).1)").bold().font(.system(size: 30)).multilineTextAlignment(.center)
             
            Spacer().frame(height: 60)
            
            HStack{
                Button(action: {
                    self.isNavigation = true
                    }, label: {Text("Next Steps")}).frame(maxWidth: .infinity)
                    .padding(10)
                    .buttonStyle(BorderlessButtonStyle())
                    .background(isNavigation ? Color.blue : Color.gray)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                
                Button(action: {
                    self.isNavigation = false
                    },label: {Text("Resources")}).frame(maxWidth: .infinity)
                    .padding(10)
                    .buttonStyle(BorderlessButtonStyle())
                    .background(isNavigation ? Color.gray : Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            
            if(isNavigation){
                VStack(alignment: .leading){
                    Text("\(nutritionResults(number: score).0)").multilineTextAlignment(.leading)
                }.background(Color(.systemGray6))
                .cornerRadius(10)
            }
            else{
                VStack(alignment: .leading){
                    Text("1. MNA® ")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.mna-elderly.com/forms/mini/mna_mini_english.pdf")
                        guard let phq9URL = url, UIApplication.shared.canOpenURL(phq9URL) else { return }
                        UIApplication.shared.open(phq9URL)}
                    Text("\n® Société des Produits Nestlé SA, Trademark Owners.\n\n")
                    Image("nestle")
                }.background(Color(.systemGray6))
                .cornerRadius(10)
            }
        }.padding()
        .navigationBarTitle("MNA®️ Results")
    }
}
