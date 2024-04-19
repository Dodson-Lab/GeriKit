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
    @State var q31 = false
    @State var q32 = false
    @State var q33 = false
    @State var q34 = false
    @State var q35 = false
    @State var q36 = false
    @State var q37 = false
    @State var q38 = false
    @State var q39 = false
    @State var q40 = false


    var body: some View {
        List{
            Section(header: Text("Part 1: Patient Assessment").font(.title)) {
                //SECTION 1
                //LOCK ON TOP OF SCREEN
                
                // To administer the CAM you will interview your patient as you normally would. Some of the answers are obtained through the history. Other questions provided below are direct questions to ask the patient.
                
                Text("A positive sign for delirium is any incorrect, don't know, non-response, or non-sensical response.").font(.subheadline).bold()
                
                Text("CAM respones are based on history taking as well as direct questions below.")

                VStack{
                    Text("3. Assess Disorganized Thinking").bold()

                    Text("Stop, and go to section 4 after the first positive sign (error) of Disorganized Thinking.").font(.subheadline)
                }
                
                HStack{
                    Spacer()
                    Text("Click if sign positive").italic().font(.footnote)
                }
     
                    
                HStack {
                    Toggle("Carry forward: Was the patient unable to correctly identify the day of the week?", isOn: $q31)
                }
                

                VStack{
                    HStack {
                        Text("Ask the patient the following questions:").font(.subheadline).italic()
                        Spacer()
                    }
                    HStack {
                        Toggle("Please tell me the year we are in right now", isOn: $q32).disabled(q31 == true)

                    }
                }
                HStack {
                    Toggle("Please tell me what type of place is this [hospital, rehab, home, etc.]", isOn: $q33).disabled(q32 == true || q31 == true)

                }
                Spacer()
                
                VStack {
                    Text("4. Assess Attention").bold()
                    Text("Stop, and go to section 5 after the first positive sign (error) of Inattention .").font(.subheadline)
                }
                HStack{
                    Spacer()
                    Text("Click if sign positive").italic().font(.footnote)
                }
                HStack {
                    Toggle("Carry forward: Was the patient unable to correctly name the months of the year backwards", isOn: $q34)
                }
                VStack{
                    HStack {
                        Text("Ask the patient the following questions:").font(.subheadline).italic()
                        Spacer()
                    }
                    HStack {
                        Toggle("Please tell me the days of the week backwards, say 'Saturday' as your first day", isOn: $q35).disabled(q34 == true)
                    }
                }
                HStack {
                    Toggle("Repeat these numbers in backwards order: '7‐5‐1'", isOn: $q36).disabled(q35 == true || q34 == true)
                }
                HStack {
                    Toggle("Repeat these numbers in backwards order: '8‐2‐4‐3'", isOn: $q37).disabled(q36 == true || q35 == true || q34 == true)
                }
                
                // PART THREE
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
                        Toggle("Over the past day have you felt confused?", isOn: $q38)
                    }
                }
                HStack {
                    Toggle("Over the past day did you think that you were not really in the hospital [or location of interview]?", isOn: $q39).disabled(q38 == true)
                }
                HStack {
                    Toggle("Over the past day did you see things that were not really there?", isOn: $q40).disabled(q39 == true || q38 == true)
                }
                
            }
            Section {
                NavigationLink(destination: ThreeDCamView2())
                        {Text("Next").bold()
                        }.foregroundColor(.blue)
                }
        }
    .navigationBarTitle(("3D CAM"))
    }
}

struct ThreeDCamView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeDCamView()
    }
}
                
                
//
//                if (q31 == 0){
//                    VStack{
//                        Text("Ask the patient the following questions").italic()
//                        HStack {
//                            Text("Please tell me the year we are in right now")
//                            YesNoBool(isTrue:$q32)
//                            //Toggle("Please tell me the year we are in right now", isOn: $q32)
//                        }
//                        if (q32 == 0){
//                            HStack{
//                                Text("Please tell me what type of place is this [hospital, rehab, home, etc.]")
//                                YesNoBool(isTrue:$q33)
//                                // Toggle("Please tell me what type of place is this [hospital, rehab, home, etc.]", isOn: $q33)
//                            }
//                        }
//                    }
//                }
//                //SECTION 2
//                Spacer()
//                VStack {
//                    Text("Assess Attention").bold()
//                }
//                HStack {
//                    Text("Carry forward: Was the patient unable to correctly name the months of the year backwards (")
//                    YesNoBool(isTrue:$q34)
//                    //Toggle("Carry forward: Was the patient unable to correctly identify the day of the week?", isOn: $q31)
//                }
//                if (q34 == 0){
//                    VStack{
//                        Text("Ask the patient the following questions").italic()
//                        HStack {
//                            Text("Please tell me the days of the week backwards, say 'Saturday' as your first day")
//                            YesNoBool(isTrue:$q35)
//                            //Toggle("Please tell me the year we are in right now", isOn: $q32)
//                        }
//                        if (q35 == 0){
//                            HStack{
//                                Text("Repeat these numbers in backwards order: '7‐5‐1']")
//                                YesNoBool(isTrue:$q36)
////                                // Toggle("Please tell me what type of place is this [hospital, rehab, home, etc.]", isOn: $q33)
////                            }
//                            if (q36 == 0){
//                                HStack{
//                                    Text("Repeat these numbers in backwards order: '8‐2‐4‐3'")
//                                    YesNoBool(isTrue:$q37)
//                                    // Toggle("Please tell me what type of place is this [hospital, rehab, home, etc.]", isOn: $q33)
//                                }
//                            }
//                        }
//                    }
//                }
                /// NEXT SECTION
//                Spacer()
//                VStack {
//                    Text("Assess Acute change or Fluctuation").bold()
//                }
//                VStack{
//                    Text("Ask the patient the following questions").italic()
//                    HStack {
//                            Text("Over the past day have you felt confused?")
//                            YesNoBool(isTrue:$q38)
//                            //Toggle("Please tell me the year we are in right now", isOn: $q32)
//                        }
//                if (q38 == 0){
//                    HStack {
//                        Text("Over the past day did you think that you were not really in the hospital [or location of interview]?")
//                        YesNoBool(isTrue:$q39)
//                            //Toggle("Please tell me the year we are in right now", isOn: $q32)
//                        }
//                        if (q39 == 0){
//                            HStack{
//                                Text("Over the past day did you see things that were not really there?")
//                                YesNoBool(isTrue:$q40)
//                                // Toggle("Please tell me what type of place is this [hospital, rehab, home, etc.]", isOn: $q33)
//                            }
//                        }
//                    }
//                }
//
//                // PART THREE
//            }
//        }
//    .navigationBarTitle(("3D CAM"))
//    }
//}
//
//struct ThreeDCamView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThreeDCamView()
//    }
//}

