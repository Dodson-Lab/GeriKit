//
//  MiniCogView.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/3/20.
//  Updated 4/18/2024
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//
import SwiftUI

struct MiniCogView: View {
    @State var selection = false
    @State private var name: String = ""
    @State private var name1: String = ""
    @State private var name2: String = ""
    @State private var list: String = ""

    @State private var numWordsCorrect: Int = 0
    @State private var value: CGFloat = 0
    var colors = ["1", "2", "3", "4"]
    @State private var selectedColor = "Red"

    
    var body: some View {
        Form{
        VStack(alignment:.leading){
            Text("Part 1: Three Word Recognition").font(.system(size: 20)).bold().foregroundColor(.red)
            Divider().frame(height: 3).background(Color.red)
            Group{
                Text("Look directly at person and say, “Please listen carefully. I am going to say three words that I want you to repeat back to me now and try to remember. The words are [select a list of words from the versions below]. Please say them for me now.” If the person is unable to repeat the words after three attempts, move on to Step 2 (clock drawing), and make sure to still score Part 1. \n\nThe following and other word lists have been used in one or more clinical studies. For repeated administrations, use of an alternative word list is recommended.\n")
                HStack(){
                    VStack{
                        Text("Version 1").bold()
                        Text("Banana\nSunrise\nChair")
                    }
                    VStack{
                        Text("Version 2").bold()
                        Text("Leader\nSeason\nTable")
                    }
                    VStack{
                        Text("Version 3").bold()
                        Text("Village\nKitchen\nBaby")
                    }
                    VStack{
                        Text("Version 4").bold()
                        Text("River\nNation\nFinger")
                    }
                }
            }
            Spacer().frame(height:20)
            Group{
                Text("Part 2: Clock Drawing").font(.system(size: 20)).bold().foregroundColor(.red)
                Divider().frame(height: 3).background(Color.red)
                Text("Say: \"Next, I want you to draw a clock for me. First, put in all of the numbers where they go.\" When that is completed, say: \"Now, set the hands to 10 past 11.\" \n\nUse predrawn circle (see link or draw one on a piece of paper) for this exercise. Repeat instructions as needed as this is not a memory test. Move to Step 3 if the clock is not complete within three minutes.\n")
            }
            Group{
                Text("Step 3: Three World Recall").font(.system(size: 20)).bold().foregroundColor(.red)
                Divider().frame(height: 3).background(Color.red)
                Text("Ask the person to recall the three words you stated in Step 1. Say: \"What were the three words I asked you to remember?\" Record the word list version number and the person’s answers below.")
            }
            }
//            Picker("World List Version", selection: $selection) {
//                Text("1").tag(1)
//                Text("2").tag(2)
//                Text("3").tag(3)
//                Text("4").tag(4)
//            }
            VStack{
                HStack{
                    
                    //Text("Word List Version: ")
                    Picker("Word List Version:", selection: $selectedColor) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    //TextField("Word List Version", text: $list)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    //   .keyboardType(.numberPad)
                }
                HStack{
                Text("Word 1:")
                TextField("Word 1", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack{
                Text("Word 2:")
                TextField("Word 2", text: $name1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack{
                Text("Word 3:")
                TextField("Word 3", text: $name2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                }
           
            }.frame(maxHeight: .infinity)

            
            NavigationLink(destination: MiniCogResults())
            {Text("Click here for MiniCogⒸ result").bold()}.foregroundColor(.blue)
            
            }.padding()
        .navigationBarTitle("MiniCogⒸ")
        . modifier(AdaptsToKeyboard())

    }
    
}

struct MiniCogView_Previews: PreviewProvider {
    static var previews: some View {
        MiniCogView()
    }
}
