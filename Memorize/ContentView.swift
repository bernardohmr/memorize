//
//  ContentView.swift
//  Memorize
//
//  Created by Bernardo Rodrigues on 09/10/21.
//

import SwiftUI

struct ContentView: View {
    var vehiclesEmojis = ["✈️", "🚂", "🚀", "🚜", "🚲", "🛺", "🚘", "🛵", "🚚", "🚐", "🚒", "🚌", "🚓", "🏎", "🚁", "🛶", "⛵️", "🚤", "🛥", "🛳", "🛩", "🛸", "🎡", "🎠"]
    var animalsEmojis = ["🐶", "🐱", "🐭", "🐰", "🐹", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐍", "🐙", "🦇", "🐝"]
    var foodsEmojis = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🥦", "🍆", "🥑", "🥥", "🥩", "🍔", "🍟", "🍕", "🍖", "🍗", "🥙", "🌭"]
    
    let minimalCardsCount = 8
    @State var cardCount = 0
    @State var emojis: [String] = []
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: 65))
                    ]) {
                    ForEach(emojis[0..<cardCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            
            Spacer()
            
            HStack {
                Button(action: {
                    emojis = vehiclesEmojis.shuffled()
                    cardCount = Int.random(in: minimalCardsCount..<emojis.count)
                }, label: {
                    VStack {
                        Image(systemName: "car.2.fill")
                            .font(.largeTitle)
                        
                        Text("Vehicles")
                            .font(.caption)
                    }
                })
                    .padding(.horizontal)
                
                Button(action: {
                    emojis = animalsEmojis.shuffled()
                    cardCount = Int.random(in: minimalCardsCount..<emojis.count)
                }, label: {
                    VStack {
                        Image(systemName: "hare.fill")
                            .font(.largeTitle)
                        
                        Text("Animals")
                            .font(.caption)
                    }
                })
                    .padding(.horizontal)
                
                Button(action: {
                    emojis = foodsEmojis.shuffled()
                    cardCount = Int.random(in: minimalCardsCount..<emojis.count)
                }, label: {
                    VStack {
                        Image(systemName: "leaf.fill")
                            .font(.largeTitle)
                        
                        Text("Foods")
                            .font(.caption)
                    }
                })
                    .padding(.horizontal)
            }
        }
    }
    
//
//    struct ThemeChoserButton: View {
//        var title: String
//        var icon: String
//
//        var body: some View {
//            Button(action: {
//
//            }, label: {
//                VStack {
//                    Image(systemName: icon)
//                        .font(.largeTitle)
//
//                    Text(title)
//                        .font(.caption)
//                }
//            })
//                .padding(.horizontal)
//
//        }
//    }
}

func widthThatBestFits(cardCount: Int) -> CGFloat {
    return 65
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                
                shape
                    .strokeBorder(lineWidth: 3)
                
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}




























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
