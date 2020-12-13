//
//  ChairView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI
import Combine

struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    
    var body: some View {
        Text(label)
            .foregroundColor(.white)
        .padding()
           // .padding(.vertical, 20)
            // .padding(.horizontal, 90)
            .buttonStyle(PlainButtonStyle())
            .background(buttonColor)
            .cornerRadius(10)

    }
}

struct ChairView: View{
    @State var numChairStands = ""
    @State var age = ""
    @State var selectedGender = 0
    let genders = ["Male", "Female"]
    
    @State private var enableLogging = false
    @ObservedObject var stopWatchManager = StopWatchManager()

    var body: some View {
                   
            Form{
                Section(header: Text("1) Instruct the patient:")
                        .font(.headline)
                        .foregroundColor(.black)) {
                Text("1. Sit in the middle of the chair. \n \n2. Place your hands on the opposite shoulder crossed, at the wrists. \n\n3. Keep your feet flat on the floor. \n\n4. Keep your back straight, and keep your arms against your chest. \n\n5. On Go, rise to a full standing position, then sit back down again. \n\n6. Repeat this for 30 seconds.")
                    .frame(maxWidth: .infinity).padding()
                    //.background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                Section(header: Text("2) On the word \"go\", begin timing.")
                    .font(.headline)
                    .foregroundColor(.black)) {
                Text("If the patient must use his/her arms to stand, stop the test. Record \"0\" for the number and score.").padding()
                }
                Section(header: Text("3) Count the number of times the patient comes to a full standing position in 30 seconds.")
                    .font(.headline)
                    .foregroundColor(.black)) {
                Text("If the patient is over halfway to a standing postition when the 30 seconds have elapsed, count it as a stand.").padding()
                }
                
                Section(header: Text("4)Record the number of times the patient stands in 30 seconds.")
                    .font(.headline)
                    .foregroundColor(.black)) {
                //Spacer()
                //Text("Timer:").font(.title)
                VStack{
                Text("\n")
                Text("\(String(format: "%.1f", stopWatchManager.secondsElapsed as Double))")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(20)
                    .onAppear{self.stopWatchManager.stop()}
                
                HStack(alignment: .center){
                    if stopWatchManager.mode == .stopped {
                        Button(action: {self.stopWatchManager.start()}) {
                            TimerButton(label: "Start", buttonColor: .blue)
                            }.buttonStyle(PlainButtonStyle()).padding()

                        Button(action: {}) {
                            TimerButton(label: "Pause", buttonColor: .red)
                            }.buttonStyle(PlainButtonStyle()).padding()

                    }
                    if stopWatchManager.mode == .running {
                        Button(action: {}) {
                            TimerButton(label: "Start", buttonColor: .blue)
                            }.buttonStyle(PlainButtonStyle()).padding()

                        Button(action: {self.stopWatchManager.pause()}) {
                            TimerButton(label: "Pause", buttonColor: .red)
                            }.buttonStyle(PlainButtonStyle()).padding()

                    }
                    if stopWatchManager.mode == .paused {
                        Button(action: {self.stopWatchManager.start()}) {
                            TimerButton(label: "Start", buttonColor: .blue)
                            }.buttonStyle(PlainButtonStyle()).padding()

                        Button(action: {self.stopWatchManager.stop()}) {
                            TimerButton(label: "Reset", buttonColor: .red)
                            }.buttonStyle(PlainButtonStyle()).padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
               
                HStack {
                    Text("Select Gender:").bold()
                    Picker("", selection: $selectedGender) {

                        ForEach(0..<genders.count) { index in
                            Text(self.genders[index]).tag(index).font(.title)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }

                HStack{
                    Text("Patient age:").bold()
                    TextField("age", text: $age)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .onReceive(Just(age)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.age = filtered
                            }
                        }
                    }


                HStack
                    {Text("Number chair stands:").bold()
                     TextField("# chair stands", text: $numChairStands)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .onReceive(Just(numChairStands)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.numChairStands = filtered
                            }
                        }
                    }
                }
                NavigationLink(destination: ChairResults(patAge: $age, numStands: $numChairStands, gender: $selectedGender)){
                Text("Click here for 30-second chair stand result:").bold()
                }.foregroundColor(.blue)

                }
                

            //}
            .padding()
            .modifier(AdaptsToKeyboard()) // allows for bottom keyboard to move accordingly, see specific file for details
            .navigationBarTitle(("30-Second Chair Stand"))
    }
}
