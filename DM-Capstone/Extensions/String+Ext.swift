//
//  String+Ext.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 7/31/23.
//

import Foundation

extension String {
    
    // takes in a word, ex: `sportsDrink` and returns the
    // spaced version of it `Sports Drink`
    func camelCaseToSpaced() -> String {
        var words: [String] = []
        
        var currentWord = ""
        for character in self {
            if character.isUppercase { // pop current word and continue
                words.append(currentWord)
            } else {
                currentWord.append(character)
            }
        }
        
        words.append(currentWord) // append last wrod
        
        return words.stringArrayToSentence()
    }
}
