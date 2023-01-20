//
//  AboutView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 8/5/20.
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
                Text("Nina L. Blachman, MD \nJohn A. Dodson, MD \nAmbika V. Viswanathan")
            }
            Section(header: Text("Developer")){
                Text("Ambika V. Viswanathan")
                HStack{
                    Spacer()
                    Image("SmallGeriKit").frame(alignment: .center)
                    Spacer()

                }
            }
            Section(header: Text("Version")){
                Text("1.1")
            }
            Section(header: Text("Icons")){
                Text("Icon made by Freepik from www.flaticon.com")
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
