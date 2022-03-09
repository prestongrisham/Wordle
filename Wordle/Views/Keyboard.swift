//
//  Keyboard.swift
//  Wordle
//
//  Created by Preston Grisham on 3/9/22.
//

import SwiftUI

struct Keyboard: View {
    
    @EnvironmentObject var dm: WordleDataModel
    var topRowArray = "QWERTYUIOP".map { String($0) }
    var secondRowArray = "ASDFGHJKL".map { String($0) }
    var thirdRowArray = "ZXCVBNM".map { String($0) }
    
    var body: some View {
        VStack {
            HStack(spacing: 2) {
                ForEach(topRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disableKeys)
                .opacity(dm.disableKeys ? 0.6 : 1)
            }
            HStack(spacing: 2) {
                ForEach(secondRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disableKeys)
                .opacity(dm.disableKeys ? 0.6 : 1)
            }
            HStack(spacing: 2) {
                
                EnterButton()
                
                ForEach(thirdRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disableKeys)
                .opacity(dm.disableKeys ? 0.6 : 1)
                
                DeleteButton()
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
            .environmentObject(WordleDataModel())
            .scaleEffect(Global.keyboardScale)
    }
}


// MARK: - Special Buttons Views

struct EnterButton: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        Button {
            dm.enterWord()
        } label: {
            Text("Enter")
                .font(.system(size: 20))
                .frame(width: 60, height: 50)
                .foregroundColor(.primary)
                .background(Color.unused)
                .disabled(dm.currentWord.count < 5 || !dm.inPlay)
                .opacity((dm.currentWord.count < 5 || !dm.inPlay) ? 0.6 : 1)
        }
        .buttonStyle(.plain)
    }
}

struct DeleteButton: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        Button {
            dm.removeLetterFromCurrentWord()
        } label: {
            Image(systemName: "delete.backward.fill")
                .font(.system(size: 20))
                .frame(width: 40, height: 50)
                .foregroundColor(.primary)
                .background(Color.unused)
                .disabled(dm.currentWord.count == 0 || !dm.inPlay)
                .opacity((dm.currentWord.count == 0 || !dm.inPlay) ? 0.6 : 1)
        }
        .buttonStyle(.plain)
    }
}
