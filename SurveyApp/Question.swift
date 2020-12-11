//
//  Question.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/13/20.
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

struct QuestionView: View {
    @Binding var fetcher: [Question]
    @Binding var scores: [Int]
    @Binding var sum: Int
    @State var isPressed: Array<Array<Bool>> = Array(repeating: Array(repeating: false, count: 10), count: 10)



    var body: some View {
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
                            self.sum = (self.scores.reduce(0, +))
                            }
                    }, label: {
                    Text("\(result.text)")
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(10)
                        .foregroundColor(Color.white)
                        .background(self.isPressed[question.id][result.id] ? Color.blue : Color.gray)
                    }

                    )
                    .lineLimit(nil)
                    .cornerRadius(10)
                    .buttonStyle(BorderlessButtonStyle())
                    }
                .padding(5)
           // .multilineTextAlignment(.center)
            }
        }

    }
}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
