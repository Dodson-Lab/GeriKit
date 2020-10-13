//
//  Bundle-Decodable.swift
//  SurveyApp
//
//  Created by Ambika Viswanathan on 10/12/20.
//  Copyright © 2020 Ambika Viswanathan. All rights reserved.
//

import SwiftUI

struct Bundle_Decodable: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Bundle_Decodable_Previews: PreviewProvider {
    static var previews: some View {
        Bundle_Decodable()
    }
}

extension Bundle {
    func decode(_ file: String) -> [Question] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode([Question].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
