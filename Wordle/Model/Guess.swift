//
//  Guess.swift
//  Wordle
//
//  Created by Preston Grisham on 3/9/22.
//

import SwiftUI

struct Guess {
    
    let index: Int
    var word = "     "
    var bgColors = [Color](repeating: .systemBackground, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map { String($0) }
    }
    
}
