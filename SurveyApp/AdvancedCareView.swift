//
//  AdvancedCareView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/13/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//
import SwiftUI

struct AdvancedCareView: View {
    var body: some View {
        List{
            Section(header: Text("Some resources:")) {
            VStack(alignment: .leading){
                Text("1. PrepareⒸ for your care")
                .foregroundColor(.blue)
                .underline()
                .onTapGesture {
                    let url = URL.init(string: "https://prepareforyourcare.org/advance-directive")
                    guard let ad8URL = url, UIApplication.shared.canOpenURL(ad8URL) else { return }
                    UIApplication.shared.open(ad8URL)}
                }
//            VStack(alignment: .leading){
//                Text("1. PrepareⒸ for your care")
//                .foregroundColor(.blue)
//                .underline()
//                .onTapGesture {
//                    let url = URL.init(string: "https://prepareforyourcare.org/advance-directive")
//                    guard let ad8URL = url, UIApplication.shared.canOpenURL(ad8URL) else { return }
//                    UIApplication.shared.open(ad8URL)}
//                }
            }
        }
        .navigationBarTitle("Advance Care Planning")
    }
}

struct AdvancedCareView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedCareView()
    }
}
