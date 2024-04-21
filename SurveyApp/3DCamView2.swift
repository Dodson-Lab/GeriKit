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
struct ThreeDCamView2: View{
//code for just yes/no phq2
    @Binding var q2: [Bool]
    @Binding var q3_ans: [Bool]
    @Binding var q4_ans: [Bool]
    @Binding var q5_ans: [Bool]

    @State var q3 = false
    @State var q4 = false
    @State var q5 = false
    
    @State var q6_ans: Array<Bool> = Array(repeating: false, count: 2)
    @State var q7_ans: Array<Bool> = Array(repeating: false, count: 3)
    @State var q8_ans: Array<Bool> = Array(repeating: false, count: 2)
    @State var q9_ans: Array<Bool> = Array(repeating: false, count: 3)

    var body: some View {
        List{
            Section(header: Text("Part 2: Interviewer Ratings").font(.title)) {
                //SECTION 6
                Text("A positive sign for delirium is any incorrect, don't know, non-response, or non-sensical response.").font(.subheadline)
                VStack{
                    Text("6. Ratings for Altered Level of Consciousness").bold()
                    Text("Stop, and go to section 7 after the sign of Altered Level of Consciousness .").font(.subheadline)
                }
                HStack{
                    Spacer()
                    Text("Click if sign positive").italic().font(.footnote)
                }
                HStack {
                    Toggle("Was the patient sleepy during the interview? (Requires that they actually fall asleep)", isOn: $q6_ans[0])
                    
                }
                HStack {
                    Toggle("Did the patient show hypervigilance?", isOn: $q6_ans[1])
                        .disabled(q6_ans[0])
                        .foregroundColor(q6_ans[0] ? .gray : .primary)
                }
                
                //SECTION 7
                Spacer()
                VStack{
                    Text("7. Ratings for Disorganized Thinking ").bold()
                    Text("Stop, and go to section 8 after the positive sign of Disorganized Thinking is noted.").font(.subheadline)
                    
}
                HStack{
                    Spacer()
                    Text("Click if sign positive").italic().font(.footnote)
                }
                
                HStack {
                    Toggle("Was the patient's flow of ideas unclear or illogical", isOn: $q7_ans[0])
                }
                
                HStack {
                    Toggle("Was the patient's conversation rambling, inappropriately verbose, or tangential", isOn: $q7_ans[1])
                        .disabled(q7_ans[0])
                        .foregroundColor(q7_ans[0] ? .gray : .primary)
                }
                HStack {
                    Toggle("Was the patient's speech unusually limited or sparse?", isOn: $q7_ans[2])
                        .disabled(q7_ans[0] || q7_ans[1])
                        .foregroundColor((q7_ans[0] || q7_ans[1]) ? .gray : .primary)
                    
                }

                Spacer()
                //SECTION 8
                VStack{
                    Text("8. Ratings for Attention").bold()
                    Text("Stop, and go to section 9 after the first sign of innatiention is noted .").font(.subheadline)

                }
                HStack{
                    Spacer()
                    Text("Click if sign positive").italic().font(.footnote)
                }
                HStack {
                    Toggle("Does the patient have trouble keeping track of what was said or following directions?", isOn: $q8_ans[0])
                }
                HStack {
                    Toggle("Does the patient seem inappropriately distracted by external stimuli?", isOn: $q8_ans[1])
                        .disabled(q8_ans[0] == true)
                        .foregroundColor(q8_ans[0] ? .gray : .primary)
                }

                Spacer()
                
                //SECTION 9
                VStack{
                    Text("9. Ratings for Acute Change or Fluctuation").bold()
                    Text("Stop, and go to the results page after the first positive sign of Acute Change or Fluctuation is noted .").font(.subheadline)

                }
                HStack{
                    Spacer()
                    Text("Click if sign positive").italic().font(.footnote)
                }
                HStack {
                    Toggle("Did the patient's level of consciousness, level of attention or speech/thinking fluctuate during the interview?", isOn: $q9_ans[0])
                }
                
                HStack {
                    Toggle("If no prior assessments, is there evidence an acute change in memory or thinking according to records, or informant?", isOn: $q9_ans[1])
                        .disabled(q9_ans[0])
                        .foregroundColor(q9_ans[0] ? .gray : .primary)

                }
                HStack {
                    Toggle("If prior assessments, are there any new signs of delirium based on above questions (new errors, positive ratings)?", isOn: $q9_ans[2])
                        .disabled(q9_ans[0] || q9_ans[1])
                        .foregroundColor((q9_ans[0] || q9_ans[1]) ? .gray : .primary)
                }
                
            }
            Section {
                NavigationLink(destination: ThreeDCamResultsView(q2: $q2, q3: $q3, q4:$q4, q5:$q5, q6_ans: $q6_ans, q7_ans: $q7_ans, q8_ans: $q8_ans, q9_ans: $q9_ans))
                        {Text("Click here for 3D-CAM result:").bold()
                        }.foregroundColor(.blue)
                }
        }
        .onAppear(perform:{
            for answer in self.q3_ans {
                if answer {
                    self.q3 = true
                    break // Exit the loop once q5s is set to true
                }
            }
            
            for answer in self.q4_ans {
                if answer {
                    self.q4 = true
                    break // Exit the loop once q5 is set to true
                }
            }
            
            for answer in self.q5_ans {
                if answer {
                    self.q5 = true
                    break // Exit the loop once q5 is set to true
                }
            }

        })
    .navigationBarTitle(("3D-CAM"))
    }
}

//struct ThreeDCamView2_Previews: PreviewProvider {
//    static var previews: some View {
//        ThreeDCamView2()
//    }
//}
