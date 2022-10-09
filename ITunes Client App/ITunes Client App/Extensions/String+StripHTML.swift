//
//  String+StripHTML.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import Foundation

extension String {
    func stripHTML() -> String {
        var text = self.replacingOccurrences(of: "<br />", with: "\n")
        text = text.replacingOccurrences(of: "&#xa0;", with: " ")
        text = text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        return text
    }
}
