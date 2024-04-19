//
//  UBCamView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 12/5/23.
//  Copyright © 2023 Ambika Viswanathan. All rights reserved.
//

import Foundation
import SwiftUI

//View for PHQ-2 MEntal Health Exam
struct UBCamView: View{
//code for just yes/no phq2
    @State var q1 = false
    @State var q2 = false
    var body: some View {
            List{
                Section {
                    Text("Ask the patient the following questions. A positive sign for delirium is any incorrect, don't know, non-response, or non-sensical response.").font(.subheadline)

                    HStack{
                        Spacer()
                        Text("Click if sign positive").italic().font(.footnote)
                    }
                    HStack {
                        Toggle("1. Please tell me the day of the week.", isOn: $q1)
                        }
                        
                    HStack{
                        Toggle("2. Please tell me the months of the year backwards, say 'December' as your fist month ", isOn: $q2)
                    }
                }
                Section {
                    NavigationLink(destination: UBCamResultsView(quest1: $q1, quest2:$q2))
                            {Text("Click here for Ultra-Brief CAM result:").bold()
                            }.foregroundColor(.blue)
                    }
            }
            .navigationBarTitle(("Ultra-Brief CAM"))
    }
}

struct UBCamView_Previews: PreviewProvider {
    static var previews: some View {
        UBCamView()
    }
}
