//
//  HearingView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 4/12/24.
//  Updated 4/18/24
//  Copyright © 2024 Ambika Viswanathan. All rights reserved.
//

import Foundation
import SwiftUI

struct HearingView: View {
    //    @State private var questions: [String] = [
    //        "Does a hearing problem cause you to feel embarrassed when meeting new people?",
    //        "Does a hearing problem cause you to feel frustrated when talking to members of your family? ",
    //        "Do you have difficulty hearing when someone speaks in a whisper?",
    //        "Do you feel handicapped by a hearing problem?",
    //        "Does a hearing problem cause you difficulty when visiting friends, relatives, or neighbors?",
    //        "Does a hearing problem cause you to attend religious services less often than you would like?",
    //        "Does a hearing problem cause you to have arguments with family members?",
    //        "Does a hearing problem cause you difficulty when listening to TV or radio?",
    //        "Do you feel that any difficulty with your hearing limits or hampers your personal or social life?",
    //        "Does a hearing problem cause you difficulty when in a restaurant with relatives or friends?"
    //    ]
    
    @State var Hear = Bundle.main.decode("Hearing.json")
    @State var hearScore: Array<Int> = Array(repeating: 0, count: 100)
    @State var hearSelected: Array<Int> = Array(repeating: 0, count: 100)
    @State var hearSum = 0
    
    var body: some View{
        List{
            Section{
                Text("Please check “yes,” “no,” or “sometimes” in response to each of the following items. Do not skip a question if you avoid a situation because of a hearing problem. If you use a hearing aid, please answer the way you hear without the aid.").font(.subheadline)
                QuestionView(fetcher: $Hear, scores: $hearScore, sum: $hearSum, selected: $hearSelected)
                
                Section {
                    NavigationLink(destination: HearingResultsView(score: $hearSum)){
                        Text("Click here for HHIE-S result:").bold()
                    }.foregroundColor(.blue)
                }
            }
        }
            .navigationBarTitle("Hearing Handicap Inventory Assessment")
    }
}
    

    struct HearingView_Preview: PreviewProvider {
        static var previews: some View {
            HearingView()
        }
    
    }
