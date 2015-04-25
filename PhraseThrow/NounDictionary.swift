//
//  NounDictionary.swift
//  PhraseThrow
//
//  Created by Tianyu Xu on 15/3/21.
//  Copyright (c) 2015年 Tianyu Xu. All rights reserved.
//

import UIKit

class NounDictionary: NSObject {
    
    var wordList : [String]?  // Think: why would we want this as an optional?
    
    override init() {
        super.init()  // Always call your superclass's init.
        
        // Get the file containing the words.
        var mainBundle = NSBundle.mainBundle()
        var filePath : String? = mainBundle.pathForResource(
            "nounlist", ofType: ".txt")
        // Make sure the file exists!
        if (filePath != nil) {
            var words: String? = String(contentsOfFile: filePath!,
                encoding: NSUTF8StringEncoding,
                error: nil)
            // Now, create an array by separating on newline characters.
            self.wordList = words!.componentsSeparatedByString("\n")
        }
    }
    
    // Is called when the Next Word button is pressed.
    // Randomly picks a word from the word list and returns it.
    func randomWord() -> String? {
        // Check to make sure we have a valid word list. If initialization failed,
        // we might not have one!
        if (self.wordList != nil) {
            // Picks a random UInt32 because 0 and self.wordList.count.
            var index = arc4random_uniform(UInt32(self.wordList!.count))
            var word: String = self.wordList![Int(index)]
            return word
        }
        // If we're here, then we don't have any words!
        return nil
    }
    
}