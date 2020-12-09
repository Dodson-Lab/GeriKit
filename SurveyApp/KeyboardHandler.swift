//
//  KeyboardHandler.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/13/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI
import Combine

final class KeyboardHandler: ObservableObject{
    @Published private(set) var keyboardHeight: CGFloat = 0
    
    private var cancellable: AnyCancellable?
    
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .compactMap{ ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height}
    
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .compactMap{_ in CGFloat.zero}
    
    init() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.self.keyboardHeight, on:self)
    }
}

//struct KeyboardHandler_Previews: PreviewProvider {
//    static var previews: some View {
//        KeyboardHandler()
//    }
//}

struct KeyboardHandler_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
