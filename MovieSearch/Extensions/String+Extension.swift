//
//  String+Extension.swift
//  MovieSearch
//
//  Created by Aaron Lee on 2020-11-29.
//

import Foundation

extension String {
    
    func trimmedAndEscaped() -> Self {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return
            trimmedString
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
