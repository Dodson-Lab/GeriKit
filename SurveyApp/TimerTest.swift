//
//  TimerTest.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 4/12/24.
//  Updated 4/18/24
//  Copyright © 2024 Ambika Viswanathan. All rights reserved.
//

import Foundation
import SwiftUI

enum timerMode {
    case running
    case stopped
    case paused
}

class TimerManager: ObservableObject {
    
    @Published var mode: timerMode = .stopped
    @Published var timeRemaining = 30.0

    var timer = Timer()
    
    func startTimer() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true)
        {timer in
            if self.timeRemaining > 0.1 {
                self.timeRemaining -= 0.1
            } else {
                self.pauseTimer()
                self.timeRemaining = 0.0
            }
        }
    }
    
    func pauseTimer() {
        timer.invalidate()
        mode = .paused
    }
    
    
    func stopTimer() {
        timer.invalidate()
        self.timeRemaining = 30.0
        mode = .stopped
    }
    
    func voided() {

    }
    
}


struct TimerTest: View {
    @State private var enableLogging = false
    @ObservedObject var timerManager = TimerManager()
    
    var body: some View {
        VStack{
        Text("\n")
            Text("\(String(format: "%.1f", timerManager.timeRemaining as Double))")
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.green)
            .cornerRadius(20)
            .onAppear{timerManager.stopTimer()}
            
            HStack(alignment: .center){
                if timerManager.mode == .stopped {
                    Button(action: {self.timerManager.startTimer()}) {
                        TimerButton(label: "Start", buttonColor: .blue)
                    }.buttonStyle(PlainButtonStyle()).padding()
                    
                    Button(action: {}) {
                        TimerButton(label: "Pause", buttonColor: .red)
                    }.buttonStyle(PlainButtonStyle()).padding()
                    
                }
                if timerManager.mode == .running {
                    Button(action: {}) {
                        TimerButton(label: "Start", buttonColor: .blue)
                    }.buttonStyle(PlainButtonStyle()).padding()
                    
                    Button(action: {self.timerManager.pauseTimer()}) {
                        TimerButton(label: "Pause", buttonColor: .red)
                    }.buttonStyle(PlainButtonStyle()).padding()
                    
                }
                if timerManager.mode == .paused {
                    Button(action: {self.timerManager.startTimer()}) {
                        TimerButton(label: "Start", buttonColor: .blue)
                    }.buttonStyle(PlainButtonStyle()).padding()
                    
                    Button(action: {self.timerManager.stopTimer()}) {
                        TimerButton(label: "Reset", buttonColor: .red)
                    }.buttonStyle(PlainButtonStyle()).padding()
                }
            }
        }
    }
}




struct TimerTest_Previews: PreviewProvider {
    static var previews: some View {
        TimerTest()
    }
}
