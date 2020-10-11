//
//  ChairView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/10/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

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

struct ChairView: View{
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
                //NavigationLink(destination: ChairResults){Text("Test")}
                
                    
            }.padding()
            .navigationBarTitle(("Chair Stands"))
    }
}

struct ChairView_Previews: PreviewProvider {
    static var previews: some View {
        ChairView()
    }
}
