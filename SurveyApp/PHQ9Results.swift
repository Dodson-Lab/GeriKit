//
//  PHQ9Results.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct PHQ9Results: View {
    @Binding var numberPHQ9Yes: Int
    @Binding var alert: Bool
    @State private var isNavigation = true
    @State var nextStep = ""
    
    func phq9Results(number: Int)-> (String, String) {
        var next = ""
        var result = ""
        if number <= 4{
            next = "Monitor the patient. They might not require treatment at this time."
            result = "minimal or no depression"
            }
        else if (number >= 5 && number <= 9){
            next = "Use clinical judgement to determine if patient requires further psychiatric evaluation."
            result = "mild depression"
        }
        else if(number >= 10 && number <= 14){
            next = "Use clinical judgement to determine if patient requires further psychiatric evaluation."
            result = "moderate depression"
        }
        else if(number >= 15 && number <= 19){
            next = "Recommend further follow up and/or treatment."
            result = "moderately severe depression"
            }
        else {
            next = "Recommend further follow up and/or treatment."
            result = "severe depression"
        }
        return(result, next)
    }
       var body: some View {
        ScrollView{
        VStack(alignment: .center){
            Text("PHQ9 Results").font(.system(size: 60)).fixedSize(horizontal: false, vertical: true)
            Spacer().frame(height: 30)
            if(alert){
                VStack(alignment: .center){

                Text("The patient scored positively for suicidal ideation, urgent psychiatric evaluation is warranted.").fixedSize(horizontal: false, vertical: true)
                Spacer().frame(height: 10)
                Text("Suicide Risk Assessment: The Columbia-Suicide Severity Rating Scale")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://cssrs.columbia.edu/the-columbia-scale-c-ssrs/risk-identification/")
                        guard let suicideRiskAssessment = url, UIApplication.shared.canOpenURL(suicideRiskAssessment) else { return }
                        UIApplication.shared.open(suicideRiskAssessment)}
                    .fixedSize(horizontal: false, vertical: true)
                }.background(Color.red).font(.system(size: 36)).multilineTextAlignment(.center)
            }
            else{
            Text("The score of \(numberPHQ9Yes) suggests the patient has \(phq9Results(number: numberPHQ9Yes).0)").font(.system(size: 36)).multilineTextAlignment(.center)
             
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
                    Text("\(phq9Results(number: numberPHQ9Yes).1)").multilineTextAlignment(.leading)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            else{
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    Text("1. PHQ9 Original Manuscript")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://pubmed.ncbi.nlm.nih.gov/11556941/")
                        guard let phq9URL = url, UIApplication.shared.canOpenURL(phq9URL) else { return }
                        UIApplication.shared.open(phq9URL)}
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                }
            }
        Spacer()
        Text("PHQ9 Copyright © Pfizer Inc. All rights reserved.")
        }.padding()
    }
    }
}


struct PHQ9Results_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
