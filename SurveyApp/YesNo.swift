//
//  YesNo.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 7/13/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

//Yes No Button Function + Logic for counting number of yeses
struct YesNo: View {
    @Binding var numberOfYeses: Int
    @State private var didTapYes:Bool = false
    @State private var didTapNo:Bool = false
    @State private var firstTapYes = 0

    var body: some View {
    
        HStack{
            Button(action: {
                self.didTapYes = true
                self.didTapNo = false
                self.firstTapYes += 1
                if self.firstTapYes == 1 {
                    self.numberOfYeses += 1}
            }){
            Text("Yes")}
            .padding(10)
            .buttonStyle(BorderlessButtonStyle())
            .background(didTapYes ? Color.blue : Color.red)
            .foregroundColor(Color.white)
            .cornerRadius(10)
        
            Button(action: {
                self.didTapNo = true
                self.didTapYes = false
                if self.firstTapYes > 0 {
                    self.numberOfYeses -= 1
                    }
                self.firstTapYes = 0

            }){
            Text("No")}
            .padding(10)
            .buttonStyle(BorderlessButtonStyle())
            .background(didTapNo ? Color.blue : Color.green)
            .foregroundColor(Color.white)
            .cornerRadius(10)
        }
    }
}


struct YesNo_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
