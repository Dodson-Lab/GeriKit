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
            next = "has a normal nutritional status"
            result = "Rescreen yearly or after an acute event"
            }
        else if (number >= 8 && number <= 11){
            next = "is at risk of malnutrition"
            result = "If no weight loss: monitor, rescreen every 3 months. \n\nIf weight loss: treat with diet enhancements, oral nutritional supplementation, and weight monitoring."
        }
        else {
            next = "has a malnourished nutritional status"
            result = "Treat with nutritional supplementation, diet enhancement, and close weight monitoring."
        }
        return(result, next)
    }
       var body: some View {
        ScrollView{
            Text("MNA®️ Results").font(.system(size: 60)).multilineTextAlignment(.center)
            Spacer().frame(height: 30).fixedSize(horizontal: false, vertical: true)

            Text("The score of \(score) suggests the patient \(nutritionResults(number: score).1)").font(.system(size: 30)).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
            
            Spacer().frame(height: 30)

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
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    Text("\(nutritionResults(number: score).0)").multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            else{
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    Text("1. MNA® ")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.mna-elderly.com/forms/mini/mna_mini_english.pdf")
                        guard let phq9URL = url, UIApplication.shared.canOpenURL(phq9URL) else { return }
                        UIApplication.shared.open(phq9URL)}
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            Spacer().frame(height: 30)
            Image("nestle")
            Text("® Société des Produits Nestlé SA, Trademark Owners.")

        }.padding()
    }
}
