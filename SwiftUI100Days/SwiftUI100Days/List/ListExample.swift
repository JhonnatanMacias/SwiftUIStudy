//
//  ListExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 21/03/24.
//

import SwiftUI

struct ListExample: View {
    
    let people = ["John", "Joe", "Paul", "Luke"]
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var showError: Bool = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    // aqui
    var body: some View {
        NavigationStack {
            List {
                Section("section 1") {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                .listRowBackground(Color.white)
                
                Section("section 2") {
                    ForEach(usedWords, id: \.self) { word in
                        Text(word)
                    }
                }
                .listRowBackground(Color.white)
            }
            .foregroundColor(.lightBackground)
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: {
                startGame()
            })
            .alert(errorTitle, isPresented: $showError) {
                Button("OK") {}
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isRealWord(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showError = true
    }
    
    func startGame() {
        if let startWorldURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWorldURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("could no load start.txt from bundle")
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word no possible", message: "You can't spell the word from \(rootWord) !")
            return
        }
        
        guard isRealWord(word: answer) else {
            wordError(title: "Word no recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
        
    }
    
    
    func testString() {
        let input = """
        a
        b
        c
        """
        let letters = input.components(separatedBy: "\n")
        
        let letter =  letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "Swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let missSpelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = missSpelledRange.location == NSNotFound
        
        //
        //        List {
        //            Section("section 1") {
        //                Text("Dynamic row 1")
        //            }
        //
        //            Section("section 2") {
        //                ForEach(people, id: \.self) {
        //                    Text($0)
        //                }
        //            }
        //
        //            Section("section 3") {
        //                Text("Dynamic row 1")
        //
        //            }
        //
        //        }
    }
    
    func testBundle() {
        if let url = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: url) {
                // we load the file into a string
            }
            
        }
    }
}

#Preview {
    ListExample()
}
