//
//  fourButtonChoices.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 7/13/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

//Yes No Button Function + Logic for counting number of yeses
struct fourButtonChoices: View {
    @Binding var questionScore: Int
    @State private var buttonOne:Bool = false
    @State private var buttonTwo:Bool = false
    @State private var buttonThree:Bool = false
    @State private var buttonFour: Bool = false
    @State private var buttonPressed: Int = 0
    @State private var toBeAdded: Int = 0
    

//    mutating func score(butPressed: Int)-> Int{
//        if butPressed == 1{
//            return (1)
//        }
//        else if(butPressed == 2){
//            return(2)
//        }
//        else if(butPressed == 3){
//            return(3)
//        }
//        else{
//            return(0)
//        }
//    }

    var body: some View {
        VStack{
            //button one
            Button(action: {
                if(self.buttonPressed != 0){self.questionScore -= self.toBeAdded
                    self.toBeAdded = 1;
                }
                self.buttonOne = true
                self.buttonTwo = false
                self.buttonThree = false
                self.buttonFour = false
                self.buttonPressed = 1
            }, label: {Text("Not at all")}).frame(maxWidth: .infinity)
            .padding(10)
            .buttonStyle(BorderlessButtonStyle())
            .background(buttonOne ? Color.blue : Color.gray)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            Spacer(minLength: 2)

            //button two
            Button(action: {
                if(self.buttonPressed != 2){self.questionScore -= self.toBeAdded;
                    self.toBeAdded = 1;
                    self.questionScore += self.toBeAdded
                }
                self.buttonOne = false
                self.buttonTwo = true
                self.buttonThree = false
                self.buttonFour = false
                self.buttonPressed = 2
            },label: {
                Text("Several days")}).frame(maxWidth: .infinity)
                .padding(10)
                .buttonStyle(BorderlessButtonStyle())
                .background(buttonTwo ? Color.blue : Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            Spacer(minLength: 2)
//
//            //button three
            Button(action: {
                if(self.buttonPressed != 3){self.questionScore -= self.toBeAdded;
                    self.toBeAdded = 2;
                    self.questionScore += self.toBeAdded
                }
                self.buttonOne = false
                self.buttonTwo = false
                self.buttonThree = true
                self.buttonFour = false
                self.buttonPressed = 3;

                }, label: {
                Text("More than half the days")}).frame(maxWidth: .infinity)
                .padding(10)
                .buttonStyle(BorderlessButtonStyle())
                .background(buttonThree ? Color.blue : Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(10)

            Spacer(minLength: 2)
            
//
//            //button four
            Button(action: {
                if(self.buttonPressed != 4){self.questionScore -= self.toBeAdded;
                    self.toBeAdded = 4;
                    self.questionScore += self.toBeAdded
                }
                self.buttonOne = false
                self.buttonTwo = false
                self.buttonThree = false
                self.buttonFour = true
                self.buttonPressed = 3;
                }, label: {
                Text("Nearly every day")}).frame(maxWidth: .infinity)
                .padding(10)
                .buttonStyle(BorderlessButtonStyle())
                .background(buttonFour ? Color.blue : Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }.padding()
    }
}

//struct fourButtonChoices_Previews: PreviewProvider {
//    static var previews: some View {
//       @State var num = 5
//        fourButtonChoices(questionScore: num)
//    }
//}

struct fourButtonChoices_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
