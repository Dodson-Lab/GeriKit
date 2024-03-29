//
//  MedicineView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct MedicineView: View{
    //@State var num = 0
    @State var quantity: Int = 0
    var body: some View {
            List{
                Section {
                    HStack {
                        Text("How many medications, if any, is the patient on?")
                        Spacer().frame(width: 40)
                        Stepper(value: $quantity, in: 0...30, label: { Text("\(quantity)")})
                    }
                }
                //TODO: Create a version of this comment for quant < 4, this tab is not clear w/ no instructions or context
                //TODO: Create resources header that shows up regardless of quant, like the links do. Remove the resources text in this note
                if quantity > 4{
                Section {
                    Text("The patient has screened positive for polypharmacy. Consider reducing the number of pills or frequency of pills. Refer to the following resources:")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    }
                }
                Section{
                    Text("Deprescribing Aid")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://deprescribing.org/resources/deprescribing-guidelines-algorithms/")
                        guard let deprescribingURL = url, UIApplication.shared.canOpenURL(deprescribingURL) else { return }
                        UIApplication.shared.open(deprescribingURL)}
                    Text("Beers List")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://pubmed.ncbi.nlm.nih.gov/30693946/")
                        guard let beersListUrl = url, UIApplication.shared.canOpenURL(beersListUrl) else { return }
                        UIApplication.shared.open(beersListUrl)}
                    Text("STOPP/START Criteria")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4339726/")
                        guard let stoppStartUrl = url, UIApplication.shared.canOpenURL(stoppStartUrl) else { return }
                        UIApplication.shared.open(stoppStartUrl)}
                    }
                    //BEERS LIST ADD
            }

            .navigationBarTitle(("Polypharmacy Screening"))
    }
}

struct MedicineView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineView()
    }
}
