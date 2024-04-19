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
    @State var q41 = false
    @State var q42 = false
    @State var q43 = false
    @State var q44 = false
    @State var q45 = false
    @State var q46 = false
    @State var q47 = false
    @State var q48 = false
    @State var q49 = false
    @State var q50 = false


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
                    Toggle("Was the patient sleepy during the interview? (Requires that they actually fall asleep)", isOn: $q41)
                }
                HStack {
                    Toggle("Did the patient show hypervigilance?", isOn: $q42).disabled(q41 == true)
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
                    Toggle("Was the patient's flow of ideas unclear or illogical", isOn: $q43)
                }
                
                HStack {
                    Toggle("Was the patient's conversation rambling, inappropriately verbose, or tangential", isOn: $q44).disabled(q43 == true)
                }
                HStack {
                    Toggle("Was the patient's speech unusually limited or sparse?", isOn: $q45).disabled(q44 == true || q43 == true)
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
                    Toggle("Does the patient have trouble keeping track of what was said or following directions?", isOn: $q46)
                }
                HStack {
                    Toggle("Does the patient seem inappropriately distracted by external stimuli?", isOn: $q47).disabled(q46 == true)
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
                    Toggle("Did the patient's level of consciousness, level of attention or speech/thinking fluctuate during the interview?", isOn: $q48)
                }
                
                HStack {
                    Toggle("If no prior assessments, is there evidence an acute change in memory or thinking according to records, or informant?", isOn: $q49).disabled(q48 == true)
                }
                HStack {
                    Toggle("If prior assessments, are there any new signs of delirium based on above questions (new errors, positive ratings)?", isOn: $q50).disabled(q49 == false)
                }
                
            }
            Section {
                NavigationLink(destination: ThreeDCamView2())
                        {Text("Click here for 3D-CAM result:").bold()
                        }.foregroundColor(.blue)
                }
        }
    .navigationBarTitle(("3D CAM"))
    }
}

struct ThreeDCamView2_Previews: PreviewProvider {
    static var previews: some View {
        ThreeDCamView2()
    }
}
