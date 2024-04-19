//
//  TUGView.swift
//  Updated 4/18/24
//  SurveyApp


import SwiftUI
import Combine

struct TimerButton2: View {
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
    
struct TUGView: View{
    @State var TugTime = ""
    
    @State private var enableLogging = false
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        
        Form{
            Section(header: Text("Directions:")
                .font(.headline)
                .foregroundColor(.black)) {
                    Text("Patients wear their regular footwear and can use a walking aid, if needed. Begin by having the patient sit back in a standard arm chair and identify a line 3 meters, or 10 feet away, on the floor.")
                        .frame(maxWidth: .infinity).padding()
                    //.background(Color(.systemGray6))
                        .cornerRadius(10)
                }
            Section(header: Text("1) Instruct the patient:")
                .font(.headline)
                .foregroundColor(.black)) {
                    Text("When I say “Go,” I want you to:\n1. Stand up from the chair.\n2. Walk to the line on the floor at your normal pace. \n3. Turn.\n4. Walk back to the chair at your normal pace.\n5. Sit down again.")
                        .frame(maxWidth: .infinity).padding()
                    //.background(Color(.systemGray6))
                        .cornerRadius(10)
                }
            
            Section(header: Text("2) On the word \"go\", begin timing. \n\n3) Stop timing after the patient sits back down.")
                .font(.headline)
                .foregroundColor(.black)) {
                    Text("The subject wears their regular footwear, may use any gait aid that they normally use during ambulation, but may not be assisted by another person. There is no time limit. They may stop and rest (but not sit down) if they need to.").padding()
                }
            
            Section(header: Text("4) Record the time taken to complete the test.")
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
                                    TimerButton2(label: "Start", buttonColor: .blue)
                                }.buttonStyle(PlainButtonStyle()).padding()
                                
                                Button(action: {}) {
                                    TimerButton2(label: "Pause", buttonColor: .red)
                                }.buttonStyle(PlainButtonStyle()).padding()
                                
                            }
                            if stopWatchManager.mode == .running {
                                Button(action: {}) {
                                    TimerButton2(label: "Start", buttonColor: .blue)
                                }.buttonStyle(PlainButtonStyle()).padding()
                                
                                Button(action: {self.stopWatchManager.pause()}) {
                                    TimerButton2(label: "Pause", buttonColor: .red)
                                }.buttonStyle(PlainButtonStyle()).padding()
                                
                            }
                            if stopWatchManager.mode == .paused {
                                Button(action: {self.stopWatchManager.start()}) {
                                    TimerButton2(label: "Start", buttonColor: .blue)
                                }.buttonStyle(PlainButtonStyle()).padding()
                                
                                Button(action: {self.stopWatchManager.stop()}) {
                                    TimerButton2(label: "Reset", buttonColor: .red)
                                }.buttonStyle(PlainButtonStyle()).padding()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    //                    HStack {
                    //                        Text("Select Gender:").bold()
                    //                        Picker("", selection: $selectedGender) {
                    //
                    //                            ForEach(0..<genders.count) { index in
                    //                                Text(self.genders[index]).tag(index).font(.title)
                    //                            }
                    //                        }.pickerStyle(SegmentedPickerStyle())
                    //                    }
                    
                    HStack
                    {Text("Time taken to complete test:").bold()
                        TextField("15 seconds", text: $TugTime)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .onReceive(Just(TugTime)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.TugTime = filtered
                                }
                            }
                    }
                }
            
            NavigationLink(destination: TUGResults(timeTug: $TugTime)){
                Text("Click here for TUG test result:").bold().foregroundColor(.blue)
            }
        }
        .modifier(AdaptsToKeyboard()) // allows for bottom keyboard to move accordingly, see specific file for details
        .navigationBarTitle(("Timed Up & Go (TUG)"))
    }
}


