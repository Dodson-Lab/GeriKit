
//  testJSON.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/12/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct Question: Decodable, Identifiable {
    let id: Int
    let text: String
    let answers: [Answers]

    struct Answers: Decodable{
        let id: String
        let score: Int
        let text : String
    }
}


struct NutritionView: View {
    var fetcher = Bundle.main.decode("MiniNutritional.json")
    @State var scores: Array<Int> = Array(repeating: 0, count: 100)


    var body: some View {
        List(fetcher) { question in
                VStack (alignment: .leading){
                    Text(question.text)
                    .padding(5)
                    ForEach(question.answers, id: \.id) {result in
                        Button(action: {
                            if(result.score != self.scores[question.id]){
                                self.scores[question.id] = result.score
                                }
                        }, label: {
                        Text("\(result.text)")})
                        .contentShape(Rectangle())
                        .buttonStyle(BorderlessButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)

                }
                .padding(5)

            }
            Text("\(self.scores.reduce(0, +))")

        }
    }
}



struct testJSON_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}
