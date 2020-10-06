//
//  ContentView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 6/29/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

//form just in case

// -- main
struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: cognitionChoice())
                {HStack{
                    Image("brain")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:80)
                        .padding()
                    Text("Cognition")
                    }}
                NavigationLink(destination: PHQ2View())
                {HStack{
                    Image("emotion")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:80)
                        .padding()
                    Text("Depression")
                    }}
                NavigationLink(destination: ADLView())
                  {HStack{
                      Image("elderly")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:80)
                          .padding()
                      Text("Function")
                      }}
                NavigationLink(destination: chairView())
                  {HStack{
                      Image("chair")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:80)
                          .padding()
                      Text("Strength")
                      }}
                NavigationLink(destination: fallView())
                  {HStack{
                      Image("fall")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:80)
                          .padding()
                      Text("Falls")
                      }}
//                NavigationLink(destination: nutritionView())
//                  {HStack{
//                      Image("kitchen")
//                          .resizable()
//                          .aspectRatio(contentMode: .fit)
//                          .frame(width:80)
//                          .padding()
//                      Text("Nutrition")
//                      }}
                NavigationLink(destination: medicineView())
                  {HStack{
                      Image("drugs")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:80)
                          .padding()
                      Text("Medications")
                      }}
                HStack{
//                        Image("survey")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width:80)
//                        .padding()
                        Text("Click here to take a survey about GeriKit once you’ve finished your rotation.")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            let url = URL.init(string: "https://unc.az1.qualtrics.com/jfe/form/SV_0PScJUobnquCRa5")
                            guard let survey = url, UIApplication.shared.canOpenURL(survey) else { return }
                            UIApplication.shared.open(survey)}
                    
                    }
            }.navigationBarTitle("GeriKit", displayMode: .automatic)
            .navigationBarItems(trailing:
                HStack {
                    NavigationLink(destination:AboutView()){Text("About")}

                })
            }
        }
    }


struct AD8ResultsView: View {
    @Binding var numberAD8Yes: Int
    @State private var isNavigation = false
    
    func ad8Results(number: Int)-> String {
        if number > 1{
            self.isNavigation = true;
            return("suggests that cognitive impairment is likely to be present.")
        }
        else {
            return("suggests normal cognition.")
        }
    }
       var body: some View {
        VStack(alignment: .center){
            Text("AD8 Result").font(.system(size: 60))
                
            Spacer().frame(height: 30)
             
            Text("The score of \(numberAD8Yes)/8 \(ad8Results(number: numberAD8Yes))").bold().font(.system(size: 30)).multilineTextAlignment(.center)

            Spacer().frame(height: 40)

//            Text("Based on clinical research findings from 995 individuals included in the development and validation samples, the following cut off points are provided: \n\n0 – 1: Normal cognition \n\n2 or greater: Cognitive impairment is likely to be present ").multilineTextAlignment(.center)
//
            Spacer().frame(height: 30)
            
            HStack{
                if(numberAD8Yes > 1){
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
                    Text("1. Check for reversible causes of cognitive impairment").multilineTextAlignment(.leading)
                    Text("2. Consider further neuropsychological testing")
                }.background(Color(.systemGray6))
                .padding(10)
                .cornerRadius(10)
            }
            else{
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    Text("1. AD8 Detail")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.alz.org/media/Documents/ad8-dementia-screening.pdf")
                        guard let ad8URL = url, UIApplication.shared.canOpenURL(ad8URL) else { return }
                        UIApplication.shared.open(ad8URL)}

                    Spacer().frame(height: 10)

                    Text("2. AD8 Original Manuscript")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            let url2 = URL.init(string: "https://pubmed.ncbi.nlm.nih.gov/16116116/")
                            guard let ad8URL2 = url2, UIApplication.shared.canOpenURL(ad8URL2) else { return }
                            UIApplication.shared.open(ad8URL2)}.multilineTextAlignment(.leading)
                }.background(Color(.systemGray6))
                .padding(10)
                .cornerRadius(10)
            }

        }.padding()
    }
}

//View for PHQ-2 MEntal Health Exam
struct PHQ2View: View{
    @State var numPHQ2Yes = 0
    var body: some View {
            List{
                Section(header: Text("Over the last 2 weeks, how often have you felt:")) {
                    HStack {
                        Text("1. Little interest or pleasure in doing things")
                        Spacer()
                        YesNo(numberOfYeses: $numPHQ2Yes)
                    }
                        
                    HStack{
                        Text("2. Feeling down, depressed or hopeless")
                        Spacer()
                        YesNo(numberOfYeses: $numPHQ2Yes)
                    }
                }
                Section {
                    NavigationLink(destination: PHQ2Results(numberPHQ2Yes: $numPHQ2Yes))
                            {Text("Click here for PHQ2 result:").bold()
                            }
                    }
            }
            .navigationBarTitle(("PHQ2"))
    }
}

struct PHQ9View: View{
    @State var numPHQ9Yes = 0
    @State var temp = 0
    @State var redAlert:Bool = false
    var body: some View {
            ScrollView{
                Section(header: Text("Over the last 2 weeks, how often have you been bothered by the following problems?")) {
                    HStack {
                        Text("1. Little interest or pleasure in doing things")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                        
                    HStack{
                        Text("2. Feeling down, depressed or hopeless")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("3. Trouble falling or staying asleep, or sleeping too much?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("4. Feeling tired or having little energy?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("5. Poor appetite or overeating?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("6. Feeling bad about yourself — or that you are a failure or have let yourself or your family down?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("7. Trouble concentrating on things, such as reading the newspaper or watching television?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("8. Moving or speaking so slowly that other people could have noticed? Or so fidgety or restless that you have been moving a lot more than usual?")
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes)
                    }
                    HStack{
                        Text("9. Thoughts that you would be better off dead, or thoughts of hurting yourself in some way?").onTapGesture {
                            self.redAlert = !self.redAlert
                        }
                        Spacer()
                        fourButtonChoices(questionScore: $numPHQ9Yes) //.onTapGesture { if(self.numPHQ9Yes > self.temp) {self.redAlert = true} }
                        //Text("temp: \(temp), numPHQ9Yes: \(numPHQ9Yes), redAlert: \(redAlert ? "hello" : "goodbye")")
                    }
                    //if(numPHQ9Yes > temp) {Text("ALERT")}

                }
                Section{
                    NavigationLink(destination: PHQ9Results(numberPHQ9Yes: $numPHQ9Yes, alert: $redAlert))
                            {Text("Click here for PHQ9 result: \(numPHQ9Yes)").bold()
                            }
                    }
            }
    .padding()
            .navigationBarTitle(("PHQ9"))
    }
}

//struct nextStepsAndReferences: View {
//    var body: some View{
//        HStack{
//            Button(action: {print("hello")
//            }, label: {Text("Next Steps")}).frame(maxWidth: .infinity)
//
//            Button(action: {print("hello2")},
//                   label: {Text("Resources")}).frame(maxWidth: .infinity)
//        }
//    }
//}

struct PHQ2Results: View {
    @Binding var numberPHQ2Yes: Int
    
    func PHQ2Results(number: Int)-> String{
        if number > 0{
            return("Given the patient answered yes to one or more of these questions, the patient should be further evaluated with the PHQ-9")
        }
        else {
            return("The patient did not meet screening criteria for depression.")
        }
    }
    
       var body: some View {
        
        VStack(alignment: .center){
            Text("PHQ2 Results").font(.system(size: 60))
                
            Spacer().frame(height: 30)
             
            Text("\(PHQ2Results(number:numberPHQ2Yes))").bold().font(.system(size: 30)).multilineTextAlignment(.center)
           
            if(self.numberPHQ2Yes > 0) {
                NavigationLink(destination: PHQ9View()) {Text("\nPHQ9").bold().font(.system(size: 30))}
            }
        }.padding()
    }
}

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
        VStack(alignment: .center){
            Text("PHQ9 Results").font(.system(size: 60))
            
            Spacer().frame(height: 30)
            if(alert){
                VStack(alignment: .leading){

                Text("The patient scored positively for suicidal ideation, urgent psychiatric evaluation is warranted.")
                Spacer().frame(height: 10)
                Text("Suicide Risk Assessment: The Columbia-Suicide Severity Rating Scale")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://cssrs.columbia.edu/the-columbia-scale-c-ssrs/risk-identification/")
                        guard let suicideRiskAssessment = url, UIApplication.shared.canOpenURL(suicideRiskAssessment) else { return }
                        UIApplication.shared.open(suicideRiskAssessment)}
                    //Text("Suicide Hotline: ")
                }.background(Color.red).font(.system(size: 26)).multilineTextAlignment(.center)
            }
            else{
            Text("The score of \(numberPHQ9Yes) suggests the patient has \(phq9Results(number: numberPHQ9Yes).0)").bold().font(.system(size: 30)).multilineTextAlignment(.center)
             
            Spacer().frame(height: 60)
            
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
                }.background(Color(.systemGray6))
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
                }.background(Color(.systemGray6))
                .cornerRadius(10)
            }
            }
          //  }
        }.padding()
    }
}
        

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
                Text("Do you require help with...")
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
                    Text("Do you require help with...")
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
                            {Text("ADL and IADL Summary").bold()}
                        }
            }
            .navigationBarTitle("ADL and IADL")
    }
}

struct ADLResultsView: View {
    @Binding var numberADLYes: Int
    @Binding var numberIADLYes: Int
    @Binding var arrayADL: Array<String>
    @Binding var arrayIADL: Array<String>
    @State private var isNavigation = false

    func printArray(array: Array<String>)-> String{
        var oneString = ""
        for item in array{
            if(array.firstIndex(of: item) == array.count - 1){
                oneString = oneString + " " + item}
            else{
                oneString = oneString + " " + item + ","}

            }
        return(oneString)

        }
    func adlResults(numberOfADL: Int, numberOfIADL: Int)-> (String, String) {
           var next = ""
           var result = ""
           if numberOfADL > 0{
               next = "Because the patient answered yes to one or more ADL, they likely require home services."
               result = "Follow up with a care management team and refer to the resources tab for more information."
               }
           else if (numberOfIADL > 0){
            next = "Because the patient answered yes to one or more of the IADLs, they will need follow-up regarding the item(s) where there is help needed."
            result = "If necessary, follow up with the care management team and refer to the resources tab for more information."
           }
           else {
               next = "The patient appears to be independent in all ADLs and IADLs."
               result = ""
           }
        return (next, result)
    }
    

    
       var body: some View {
        VStack{
            Text("ADL and IADL Summary").font(.system(size: 60)).multilineTextAlignment(.center)
                    
            Spacer().frame(height: 30)

            if(arrayADL.count == 0 && arrayIADL.count == 0){
                Text("The patient did not meet screening criteria for functional impairment.")
            }
            else{
            Text("The patient answered that they require help with: ")
            if(arrayADL.count != 0){
                Spacer().frame(height:10)
                Text("ADLS: \(printArray(array: arrayADL))")
                }
            if(arrayIADL.count != 0){
                Spacer().frame(height:10)
                Text("IADLS: \(printArray(array: arrayIADL))").multilineTextAlignment(.center)
                }
            Spacer().frame(height: 10)
                Text(adlResults(numberOfADL: numberADLYes, numberOfIADL: numberIADLYes).0)
            }

            

//            Text("\(adlResults(numberOfADL: numberADLYes, numberOfIADL: numberIADLYes))").bold().font(.system(size: 20)).multilineTextAlignment(.center)
            
        Spacer().frame(height: 60)
            
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
                }.background(Color(.systemGray6))
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
                }.background(Color(.systemGray6))
                .cornerRadius(10)
            }
                          
        }
    }
}

struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    
    var body: some View {
        Text(label)
            .foregroundColor(.white)
        .padding()
           // .padding(.vertical, 20)
            // .padding(.horizontal, 90)
            .background(buttonColor)
            .cornerRadius(10)
            .buttonStyle(BorderlessButtonStyle())

    }
}

struct chairView: View{
    @State var numChairStands = ""
    @State var age = ""

    @State private var enableLogging = false

    @ObservedObject var stopWatchManager = StopWatchManager()

    var body: some View {
                   
            List{
                TextField("Patient age: ", text: $age)
                
                Text("Instruct the patient:").font(.system(size: 20, weight: .heavy))
                Text("1. Sit in the middle of the chair \n \n2. Place your hands on the opposite shoulder crossed, at the wrists. \n\n3. Keep your feet flat on the floor. \n\n4. Keep your back straight, and keep your arms against your chest. \n\n5. On Go, rise to a full standing position, then sit back down again. \n\n6. Repeat this for 30 seconds")
                    .padding()
                Text("On go, start timing and count the number of times the patient comes to a full standing position in 30 seconds:").font(.system(size: 20)).padding()
                //Text("Count number of times patient comes to full standing position")
                Text(String(format: "%.1f", stopWatchManager.secondsElapsed))
                    //.font(.system(size: 30))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(20)

                HStack(alignment: .center){
                    if stopWatchManager.mode == .stopped {
                        Button(action: {self.stopWatchManager.start()}) {
                            TimerButton(label: "Start", buttonColor: .blue)
                        }.padding()
                        Button(action: {self.stopWatchManager.pause()}) {
                            TimerButton(label: "Pause", buttonColor: .red)
                        }.padding()
                    }
                    if stopWatchManager.mode == .running {
                        Button(action: {self.stopWatchManager.start()}) {
                            TimerButton(label: "Start", buttonColor: .blue)
                        }.padding()
                        Button(action: {self.stopWatchManager.pause()}) {
                            TimerButton(label: "Pause", buttonColor: .red)
                        }.padding()
                    }
                    if stopWatchManager.mode == .paused {
                        Button(action: {self.stopWatchManager.start()}) {
                            TimerButton(label: "Start", buttonColor: .blue)
                        }.padding()
                        Button(action: {self.stopWatchManager.stop()}) {
                            TimerButton(label: "Reset", buttonColor: .red)
                        }.padding()
                    }
                }.frame(maxWidth: .infinity, alignment: .center)
                
                TextField("Number of Chair Stands", text: $numChairStands)
                //NavigationLink(destination: ChairStandsResults){Text("Test")}
                
                    
            }.padding()
            .navigationBarTitle(("Chair Stands"))
    }
}

struct ChairStandsResults: View {
       var body: some View {
        List{
            Text("Hello world")
        }
    }
}

struct fallView: View{
    @State var numFallYes = 0
    @State var ifFall = false
    @State var quantity: Int = 0
    @State var temp = 0

    var body: some View {
            List{
                Section{
                    HStack {
                        Text("Do you feel unsteady when standing or walking?")
                        Spacer()
                        YesNo(numberOfYeses: $numFallYes)
                    }
                    HStack{
                        Text("Have you fallen in the last year?")
                        Spacer()
                        YesNo(numberOfYeses: $numFallYes)
                        
                    }
                                        
//                    HStack {
//                            Text("How many times, if any, have you fallen in the last year?")
//                            Spacer()
//                            Stepper(value: $quantity, in: 0...10, label: { Text("\(quantity)")})
//                        }
                    }
                
                NavigationLink(destination: FallResults(numberFallYes: $numFallYes))
                        {Text("Fall Screening Result:").bold()
                        }
            }
            .navigationBarTitle(("Fall History"))
    }
}

struct FallResults: View {
    @Binding var numberFallYes: Int
    @State private var isNavigation = false
        
    func fallResults(numberFalls: Int)-> String {
        if numberFalls > 0{
            self.isNavigation = true;
            return("The patient screened positive for fall risk:")
        }
        else {
            return("Based on this questionnaire, the patient is not high risk for falls at this time.")
        }
    }
       var body: some View {
        VStack(alignment: .center){
            Text("Fall History Results").font(.system(size: 60)).multilineTextAlignment(.center)
                
            Spacer().frame(height: 30)

            //
            Text(fallResults(numberFalls: numberFallYes)).bold().font(.system(size: 30)).multilineTextAlignment(.center)
//
//            Spacer().frame(height: 60)
//
            Spacer().frame(height: 30)
            
            HStack{
                if numberFallYes > 0{
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
                    //"Consider"
                    Text("1. Orthostatic blood pressure measurement").multilineTextAlignment(.leading)
                    Text("2. Physical therapy referral")
                    Text("3. Consider a cane or walker")
                    Text("4. Home safety evaluation")
                    Text("4. Consider screening for low vision")
                }.background(Color(.systemGray6))
                .cornerRadius(10)
            }
            else{
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    //LINK TO SOMETHING ON ORTHOSTATIC VITALS
                    Text("1. Orthostatic vital signs measurement")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.cdc.gov/steadi/pdf/STEADI-Assessment-MeasuringBP-508.pdf")
                        guard let orthoStat = url, UIApplication.shared.canOpenURL(orthoStat) else { return }
                        UIApplication.shared.open(orthoStat)}

                    Spacer().frame(height: 10)

                    //LINK TO FALL MEDICATION LIST, BEER'S LIST!!!!!
                    Text("2. Medications associated with falls")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            let url2 = URL.init(string: "https://www.guidelinecentral.com/summaries/american-geriatrics-society-2015-updated-beers-criteria-for-potentially-inappropriate-medication-use-in-older-adults/#section-society")
                            guard let beersList = url2, UIApplication.shared.canOpenURL(beersList) else { return }
                            UIApplication.shared.open(beersList)}.multilineTextAlignment(.leading)
                    
                    Spacer().frame(height: 10)
                    
                    //LINK CDC
                    Text("3. CDC Fall Screener")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        let url = URL.init(string: "https://www.cdc.gov/steadi/pdf/STEADI-Algorithm-508.pdf")
                        guard let fallURL = url, UIApplication.shared.canOpenURL(fallURL) else { return }
                        UIApplication.shared.open(fallURL)}
                }.background(Color(.systemGray6))
                .cornerRadius(10)
                
                //
            }

        }.padding()
    }
}

//struct nutritionView: View{
//    @State var numNutritionYes = ""
//    @State var quantity: Int = 0
//    @State var quantity2: Int = 0
//    @State var weight = ""
//    @State var height = ""
//
//
//    var question1 = ["severe decrease in food intake", "moderate decrease in food intake", "no decrease in food intake"]
//
//    var body: some View {
//            List{
//                VStack(alignment: .leading){
//                    Text("1. Has food intake declined over the past 3 months due to loss of appetite, digestive problems, or swallowing difficulties?\n")
//                    Text("0 = severe decrease in food intake")
//                    Text("1 = moderate decrease in food intake")
//                    Text("2 = no decrease in food intake")
//                }.padding()
//                VStack(alignment: .leading){
//                    Text("2. Weight loss during the last 3 months? \n")
//                    Text("0 = weight loss greater than 3kg (6.6lbs)")
//                    Text("1 = does not know")
//                    Text("2 = weight loss between 1 and 3kg (2.2 and 6.6lbs)")
//                    Text("3 = no weight loss")
//                    }.padding()
//                VStack(alignment: .leading){
//                    Text("3. Mobility\n")
//                    Text("0 = bed or chair bound")
//                    Text("1 = able to get out of bed/ chair but does not go out")
//                    Text("2 = goes out")
//                    }.padding()
//                VStack(alignment: .leading){
//                    Text("4. Has suffered psychological stress or acute disease in the past 3 months?\n")
//                    Text("0 = yes")
//                    Text("2 = no")
//                    }.padding()
//                VStack(alignment: .leading){
//                    Text("5. Neuropsychological problems\n")
//                    Text("0 = sivere dementia or depression")
//                    Text("1 = mild dementia")
//                    Text("2 = no psychological problems")
//                    }.padding()
//                HStack{
//                    Text("6. Patient height?")
//                    Spacer()
//                    TextField("Patient weight: ", text: $height)
//                    }.padding()
//                HStack{
//                    Text("7. Patient weight?")
//                    Spacer()
//                    TextField("Patient weight: ", text: $weight)
//                    }.padding()
//                HStack{
//                    Text("Score: ")
//                    Spacer()
//                    TextField("Score", text: $numNutritionYes)
//                    //.keyboardType(.numberPad)
//
//                }
//                //NavigationLink(destination: NutritionResults(numberFallYes: $numNutritionYes))
//                //{Text("Nutrition Screening Result:").bold()
//                //}
//            }
//            .navigationBarTitle(("Mini Nutrition Assessment"))
//    }
//}



struct NutritionResults: View {
       var body: some View {
            VStack(alignment: .center){
            Text("Fall History Results").font(.system(size: 60)).multilineTextAlignment(.center)
            Spacer().frame(height: 30)
            }.padding()
        }
    
}

struct medicineView: View{
    //@State var num = 0
    @State var quantity: Int = 0
    var body: some View {
            List{
                Section {
                    HStack {
                        Text("How many medications, if any, is the patient on?")
                        Spacer()
                        Stepper(value: $quantity, in: 0...10, label: { Text("\(quantity)")})
                    }
                }
                if quantity > 4{
                Section {
                    Text("The patient has screened positive for polypharmacy. Consider reducing the number of pills or frequency of pills. Refer to the following resources:")
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
                    Text("Stopp/Start Criteria")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
