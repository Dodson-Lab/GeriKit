//
//  AboutView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 8/5/20.
//  Updated 4/18/24
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        List{
            Section(header: Text("Disclaimer")) {
                Text("This application is intended to help facilitate the geriatric examination. It is not intended as a substitute for professional medical judgment, diagnosis, or treatment. It should not be used by patients without direct consultation with, and supervision by, their healthcare provider.")
                
            }
            Section(header: Text("Funding")) {
                Text("GeriKit was supported by the MSTAR program, which was funded by the National Institute on Aging of the National Institutes of Health to NYU Grossman School of Medicine (2T35AG050998-06), and a gift from the Gerald Weissmann Young Scholars Society. The content is solely the responsibility of the authors and does not necessairly represent the official views of the National Institutes of Health.")
            }
            Section(header: Text("Credits")){
                VStack(alignment: .leading){
                    Text("Nina L. Blachman, MD")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://nyulangone.org/doctors/1902033137/nina-blachman")
                        guard let ninaURL = url, UIApplication.shared.canOpenURL(ninaURL) else { return }
                        UIApplication.shared.open(ninaURL)}
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .cornerRadius(10)
                VStack(alignment: .leading){
                    Text("John A. Dodson, MD")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://nyulangone.org/doctors/1366634644/john-a-dodson")
                        guard let johnURL = url, UIApplication.shared.canOpenURL(johnURL) else { return }
                        UIApplication.shared.open(johnURL)}
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .cornerRadius(10)
                
                Text("Ambika V. Viswanathan, MD")
            }
            Section(header: Text("Developer")){
                Text("Ambika V. Viswanathan, MD")
                Text("Anna Kiefer, MS")
                HStack{
                    Spacer()
                    Image("SmallGeriKit").frame(alignment: .leading)
                    Spacer()

                }
            }
            Section(header: Text("Icons")){
                Text("Icons made by Freepik from www.flaticon.com")
               // .foregroundColor(.blue)
                .underline()
                .onTapGesture {
                    let url2 = URL.init(string: "https://www.flaticon.com/authors/freepik")
                    guard let flaticon = url2, UIApplication.shared.canOpenURL(flaticon) else { return }
                    UIApplication.shared.open(flaticon)}.multilineTextAlignment(.leading)
            }
            
        }.navigationBarTitle("About GeriKit")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
