//
//  ADLView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct ADLView: View {
    @State var numADL = 0
    @State var numIADL = 0
    @State var arrayOfAdl = [String]()
    @State var arrayOfIadl = [String]()
    @State var number = 1
    @State var ADLBathing = "bathing"
    @State var ADLDressing = "dressing"
    @State var ADLToileting = "toileting"
    @State var ADLTransferring = "transferring"
    @State var ADLFeeding = "feeding"
    @State var IADLTelephoning = "using the telephone"
    @State var IADLShopping = "shopping"
    @State var IADLPreparingFood = "preparing food"
    @State var IADLCleaning = "cleaning"
    @State var IADLLaundry = "laundry"
    @State var IADLTraveling = "traveling"
    @State var IADLMeds = "managing medications"
    @State var IADLHandlingFinances = "handling finances"



    var body: some View {
            List{
                Section(header: Text("Activities of Daily Living (ADL)")) {
                Text("Does the patient require help with...")
                HStack {Text("Bathing")
                    Spacer()
                    YesNo2(numberOfYeses: $numADL, thingsTappedYes: $arrayOfAdl, item: $ADLBathing)
                }
                    
                HStack {Text("Dressing")
                    Spacer()
                    YesNo2(numberOfYeses: $numADL, thingsTappedYes: $arrayOfAdl, item: $ADLDressing)                    }
                    
                HStack{Text("Toileting")
                    Spacer()
                    YesNo2(numberOfYeses: $numADL, thingsTappedYes: $arrayOfAdl, item: $ADLToileting)
                }
                    
                HStack{ Text("Transferring")
                    Spacer()
                    YesNo2(numberOfYeses: $numADL, thingsTappedYes: $arrayOfAdl, item: $ADLTransferring)
                }
               
                HStack {Text("Feeding")
                    Spacer()
                    YesNo2(numberOfYeses: $numADL, thingsTappedYes: $arrayOfAdl, item: $ADLFeeding)
                }

//                VStack {
//                    ForEach(arrayOfAdl, id: \.self) { color in
//                        Text(color.description.capitalized)
//                            .padding()
//                    }
//                }
                }
                
                
                Section(header: Text("Independent Activities of Daily Living (IADL)")) {
                    Text("Does the patient require help with...")
                    HStack {Text("Using the telephone")
                         Spacer()
                         YesNo2(numberOfYeses: $numIADL, thingsTappedYes: $arrayOfIadl, item: $IADLTelephoning)
                     }
                         
                     HStack {Text("Shopping")
                         Spacer()
                         YesNo2(numberOfYeses: $numIADL, thingsTappedYes: $arrayOfIadl, item: $IADLShopping)
                     }
                         
                     HStack{Text("Preparing Food")
                         Spacer()
                         YesNo2(numberOfYeses: $numIADL, thingsTappedYes: $arrayOfIadl, item: $IADLPreparingFood)
                     }
                         
                     HStack{ Text("Cleaning")
                         Spacer()
                         YesNo2(numberOfYeses: $numIADL, thingsTappedYes: $arrayOfIadl, item: $IADLCleaning)
                     }
                         
                     HStack{ Text("Laundry")
                         Spacer()
                         YesNo2(numberOfYeses: $numIADL, thingsTappedYes: $arrayOfIadl, item: $IADLLaundry)
                     }
                    
                     HStack {Text("Traveling")
                         Spacer()
                         YesNo2(numberOfYeses: $numIADL, thingsTappedYes: $arrayOfIadl, item: $IADLTraveling)
                     }
                    HStack {Text("Managing Medications")
                        Spacer()
                        YesNo2(numberOfYeses: $numIADL, thingsTappedYes: $arrayOfIadl, item: $IADLMeds)
                    }
                    HStack {Text("Handling Finances")
                        Spacer()
                        YesNo2(numberOfYeses: $numIADL, thingsTappedYes: $arrayOfIadl, item: $IADLHandlingFinances)
                    }
                  //  Text("IADL score \(numIADL)")
                }
                
                Section {
                    NavigationLink(destination: ADLResultsView(numberADLYes: $numADL, numberIADLYes: $numIADL, arrayADL: $arrayOfAdl, arrayIADL: $arrayOfIadl))
                            {Text("Click here for ADL and IADL result:").bold()}
                        }.foregroundColor(.blue)
            }
            .navigationBarTitle("ADL and IADL")
    }
}

struct ADLView_Previews: PreviewProvider {
    static var previews: some View {
        ADLView()
    }
}
