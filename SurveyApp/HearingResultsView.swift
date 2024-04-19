//
//  HearingResultsView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Updated 4/18/24
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//
import SwiftUI

struct HearingResultsView: View {
    @Binding var score: Int
    @State private var isNavigation = true
    @State var nextStep = ""
    
    func hearingResults(number: Int)-> (String, String) {
        var next = ""
        var result = ""
        if number >= 26{
            next = "has a significant hearing handicap"
            result = "There is an 84% probability this patient has hearing impairment with severe handicap. Consider referral to audiology for additional hearing evaluation."
            }
        else if (number >= 10 && number <= 24){
            next = "has a mild-moderate hearing handicap"
            result = "There is an 50% probability this patient has hearing impairment with mild-moderate handicap. Consider referral to audiology for additional hearing evaluation."
        }
        else {
            next = "has no hearing handicap"
            result = "There is only a 13% probability this patient has hearing impairment with no-handicap. This patient does not require audiology referral."
        }
        return(result, next)
    }
       var body: some View {
        ScrollView{
            Text("Hearing Handicap Inventory for the Elderly Screening (HHIE-S) Results").font(.system(size: 40)).multilineTextAlignment(.center)
            Spacer().frame(height: 30).fixedSize(horizontal: false, vertical: true)

            Text("The score of \(score) suggests the patient \(hearingResults(number: score).1)").font(.system(size: 30)).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
            
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
                    Text("\(hearingResults(number: score).0)").multilineTextAlignment(.leading)
                }.padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            else{
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    Text("1. HHIE-S detail ")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://hign.org/sites/default/files/2020-06/Try_This_General_Assessment_12.pdf")
                        guard let hhies_url = url, UIApplication.shared.canOpenURL(hhies_url) else { return }
                        UIApplication.shared.open(hhies_url)}
                }.padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            Text("T Ventry, I, Weinstein B. (1983). Identification of elderly people with hearing problems. ©American Speech-Language-Hearing Association, July, 37-42. Reprinted with permission.").font(.footnote)

        }.padding()

           
           
    }
}
