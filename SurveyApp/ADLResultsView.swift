//
//  ADLResultsView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct ADLResultsView: View {
    @Binding var numberADLYes: Int
    @Binding var numberIADLYes: Int
    @Binding var arrayADL: Array<String>
    @Binding var arrayIADL: Array<String>
    @State private var isNavigation = false

    func printArray(array: Array<String>)-> String{
        var oneString = ""
//        for item in array{
//            if(array.firstIndex(of: item) == array.count - 1){
//                oneString = oneString + " " + item}
//            else{
//                oneString = oneString + " " + item + ","}
//
//            }
        for item in array{
            if(array.firstIndex(of: item) == 0){
                oneString = oneString + "\n \t- " + item}
            else{
                oneString = oneString + "\n \t- " + item}

            }
        return(oneString)

        }
    func adlResults(numberOfADL: Int, numberOfIADL: Int)-> (String, String) {
           var next = ""
           var result = ""
           if numberOfADL > 0{
               next = "Because the patient answered yes to one or more ADL, they likely require home services."
               result = "Follow up with the care management team."
               }
           else if (numberOfIADL > 0){
            next = "Because the patient answered yes to one or more of the IADLs, they will need follow-up regarding the item(s) where there is help needed."
            result = "If necessary, follow up with the care management team."
           }
           else {
               next = "The patient appears to be independent in all ADLs and IADLs."
               result = ""
           }
        return (next, result)
    }
    

    
       var body: some View {
        ScrollView{
            Text("ADL and IADL Summary").font(.system(size: 60)).multilineTextAlignment(.center)
                    
            Spacer().frame(height: 30)

            if(arrayADL.count == 0 && arrayIADL.count == 0){
                Text("The patient did not meet screening criteria for functional impairment.")
                .font(.system(size: 24)).multilineTextAlignment(.center)
            }
            else{
            Text("The patient answered that they require help with:").font(.system(size: 24)).multilineTextAlignment(.leading)
            VStack(alignment: .leading) {
            if(arrayADL.count != 0){
                Text("ADLs: \(printArray(array: arrayADL))").font(.system(size: 24))                //.frame(minWidth: 0, maxWidth: .infinity)
                }
            if(arrayIADL.count != 0){
                Spacer().frame(height:20)
                Text("IADLs: \(printArray(array: arrayIADL))").font(.system(size: 24))                //.frame(minWidth: 0, maxWidth: .infinity)
                }
            }.frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            
            Spacer().frame(height: 10)
                Text(adlResults(numberOfADL: numberADLYes, numberOfIADL: numberIADLYes).0).font(.system(size: 24)).multilineTextAlignment(.center)
            }

            

//            Text("\(adlResults(numberOfADL: numberADLYes, numberOfIADL: numberIADLYes))").bold().font(.system(size: 20)).multilineTextAlignment(.center)
            
        Spacer().frame(height: 30)
            
            HStack{
                if(numberADLYes > 0 || numberIADLYes > 0){
                Button(action: {
                    self.isNavigation = true
                    }, label: {Text("Next Steps")}).frame(maxWidth: .infinity)
                    .padding(10)
                    .buttonStyle(BorderlessButtonStyle())
                    .background(isNavigation ? Color.blue : Color.gray)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                }
                
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
                    Text(adlResults(numberOfADL: numberADLYes, numberOfIADL: numberIADLYes).1)
//                    Text("2. If trouble with managing medications, might be more urget. Perform medical reconciliation")
//                    Text("3. If trouble preparing food, refer to meal delivery service i.e. Meals on Wheels")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            else{
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    Text("1. Initial manuscript about ADLs")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://pubmed.ncbi.nlm.nih.gov/6418786/")
                        guard let adlURL = url, UIApplication.shared.canOpenURL(adlURL) else { return }
                        UIApplication.shared.open(adlURL)}

                    Spacer().frame(height: 10)

                    Text("2. Initial manuscript about IADLs ")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url2 = URL.init(string: "https://psycnet.apa.org/record/2011-21299-001")
                        guard let iadlURL = url2, UIApplication.shared.canOpenURL(iadlURL) else { return }
                        UIApplication.shared.open(iadlURL)}
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
        Spacer()
        }.padding()
    }
}
//
//struct ADLResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ADLResultsView()
//    }
//}
