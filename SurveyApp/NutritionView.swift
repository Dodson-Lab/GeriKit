
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
        let id: Int
        let score: Int
        let text : String
    }
}


struct NutritionView: View {
    var fetcher = Bundle.main.decode("MiniNutritional.json")
    @State var scores: Array<Int> = Array(repeating: 0, count: 100)
    @State var isPressed: Array<Array<Bool>> = Array(repeating: Array(repeating: false, count: 10), count: 10)
    
    

    var body: some View {
        //List(fetcher) { question in
        //ForEach(fetcher.question, id: \.id) {result in
        List{
            VStack (alignment: .leading){
                ForEach(fetcher) {question in
                Text(question.text)
                    .padding(10)
                ForEach(question.answers, id: \.id) {result in
                    Button(action: {
                        if(result.score == 0 || result.score != self.scores[question.id]){
                            self.isPressed[question.id][self.scores[question.id]] = false
                            self.scores[question.id] = result.score
                            self.isPressed[question.id][result.id] = true
                            }
                    }, label: {
                    Text("\(result.text)")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .foregroundColor(Color.white)
                        .background(self.isPressed[question.id][result.id] ? Color.blue : Color.gray)
                    }

                    )
                    .cornerRadius(10)
                    .buttonStyle(BorderlessButtonStyle())
                    }
                .padding(5)
                }
           // .multilineTextAlignment(.center)
            }
            NavigationLink(destination: NutritionResults)
//                    {Text("\(self.scores.reduce(0, +))")
//                    }
        }
        .navigationBarTitle("Nutrition View")
        .padding()
    }
}



struct testJSON_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}
