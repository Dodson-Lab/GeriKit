//
//  3DCamView.swift
//  SurveyApp
//
//  Edited by Ambika Viswanathan on 12/5/23.
//  Copyright © 2023 Ambika Viswanathan. All rights reserved.
//

import Foundation
import SwiftUI

//View for PHQ-2 MEntal Health Exam
struct ThreeDCamView: View{
//code for just yes/no phq2

    @Binding var q2: [Bool]

    @State var q3_ans: Array<Bool> = Array(repeating: false, count: 3)
    @State var q4_ans: Array<Bool> = Array(repeating: false, count: 4)
    @State var q5_ans: Array<Bool> = Array(repeating: false, count: 4)
    
    var body: some View {
        List{
            Section(header: Text("Part 1: Patient Assessment").font(.title)) {
                //LOCK ON TOP OF SCREEN
                
                // To administer the CAM you will interview your patient as you normally would. Some of the answers are obtained through the history. Other questions provided below are direct questions to ask the patient.
                
                Text("A positive sign for delirium is any incorrect, don't know, non-response, or non-sensical response.").font(.subheadline).bold()
                
                Text("CAM respones are based on history taking as well as direct questions below.")
                
                //SECTION 3
                VStack{
                    Text("3. Assess Disorganized Thinking").bold()
                    
                    Text("Stop, and go to section 4 after the first positive sign (error) of Disorganized Thinking.").font(.subheadline)
                    
                }
                HStack{
                    Spacer()
                    Text("Click if sign positive").italic().font(.footnote)
                }
     
                    
                HStack {
                    Toggle("Carry forward: Was the patient unable to correctly identify the day of the week?", isOn: $q3_ans[0])
                }
                
                VStack{
                    HStack {
                        Text("Ask the patient the following questions:").font(.subheadline).italic()
                            .foregroundColor(q3_ans[0] ? .gray : .primary)
                        Spacer()
                    }
                    HStack {
                        Toggle("Please tell me the year we are in right now", isOn: $q3_ans[1])
                            .disabled(q3_ans[0] == true)
                            .foregroundColor(q3_ans[0] ? .gray : .primary)
                    }
                }
                    HStack {
                        Toggle("Please tell me what type of place is this [hospital, rehab, home, etc.]", isOn: $q3_ans[2])
                            .disabled(q3_ans[1] || q3_ans[0])
                            .foregroundColor((q3_ans[0] || q3_ans[2]) ? .gray : .primary)
                        
                    }
                
                Spacer()
                
                //SECTION 4
                VStack {
                    Text("4. Assess Attention").bold()
                    Text("Stop, and go to section 5 after the first positive sign (error) of Inattention .").font(.subheadline)
                }
                HStack{
                    Spacer()
                    Text("Click if sign positive").italic().font(.footnote)
                }
                HStack {
                    Toggle("Carry forward: Was the patient unable to correctly name the months of the year backwards", isOn: $q4_ans[0])
                }
                VStack{
                    HStack {
                        Text("Ask the patient the following questions:").font(.subheadline).italic()
                            .foregroundColor(q4_ans[0] ? .gray : .primary)

                        Spacer()
                    }
                    HStack {
                        Toggle("Please tell me the days of the week backwards, say 'Saturday' as your first day", isOn: $q4_ans[1])
                            .disabled(q4_ans[0])
                            .foregroundColor(q4_ans[0] ? .gray : .primary)

                    }
                }
                HStack {
                    Toggle("Repeat these numbers in backwards order: '7‐5‐1'", isOn: $q4_ans[2])
                        .disabled(q4_ans[0] || q4_ans[1])
                        .foregroundColor((q4_ans[0] || q4_ans[1]) ? .gray : .primary)

                }
                HStack {
                    Toggle("Repeat these numbers in backwards order: '8‐2‐4‐3'", isOn: $q4_ans[3])
                        .disabled(q4_ans[0] || q4_ans[1] || q4_ans[2])
                        .foregroundColor((q4_ans[0] || q4_ans[1] || q4_ans[2]) ? .gray : .primary)
                }
                
                // SECTION 5
                Spacer()
                VStack {
                    Text("5. Assess Acute change or Fluctuation").bold()
                    Text("Stop, and go to section 6 after the first positive sign (error) of Acute Change is noted .").font(.subheadline)
                }
                HStack{
                    Spacer()
                    Text("Click if sign positive").italic().font(.footnote)
                }
                VStack{
                    HStack {
                        Text("Ask the patient the following questions:").font(.subheadline).italic()
                        Spacer()
                    }
                    HStack {
                        Toggle("Over the past day have you felt confused?", isOn: $q5_ans[0])
                    }
                }
                HStack {
                    Toggle("Over the past day did you think that you were not really in the hospital [or location of interview]?", isOn: $q5_ans[1])
                        .disabled(q5_ans[0])
                        .foregroundColor(q5_ans[0] ? .gray : .primary)

                }
                HStack {
                    Toggle("Over the past day did you see things that were not really there?", isOn: $q5_ans[2])
                        .disabled(q5_ans[0] || q5_ans[1])
                        .foregroundColor((q5_ans[0] || q5_ans[1]) ? .gray : .primary)
                }
                
            }
            Section {
                
                NavigationLink(destination: ThreeDCamView2(q2: $q2, q3_ans: $q3_ans, q4_ans: $q4_ans, q5_ans: $q5_ans))
                        {Text("Next").bold()
                        }.foregroundColor(.blue)
                }
        }
    .navigationBarTitle(("3D-CAM"))
    }
}

