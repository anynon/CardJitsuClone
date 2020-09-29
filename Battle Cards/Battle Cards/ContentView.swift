//
//  ContentView.swift
//  Battle Cards
//
//  Created by Vincent on 9/24/20.
//

import SwiftUI

struct ContentView: View {
    
    // Primary Variables
    @ObservedObject var emojiCardGame: EmojiCardBattleGame
    var gameColor: Color
    
    // Game State Quick Memory variables
    @State private var showBank: Bool = false
    @State private var movement: CGFloat = 0
    @State private var showAlert: Bool = false
    
    // MARK: - Drawing constant
    private let textFontSize: CGFloat = 50
    private let tableOpacity: Color = Color.black.opacity(0.6)
    private let tablePads: CGFloat = 40
    private let cornerRad: CGFloat = 20
    private let gamePadding: [CGFloat] = [30, 5]
    private let cardSwing: CGFloat = 150
    
    // MARK: - Main View
    var body: some View {
        ZStack {
            setBackground() // Background method
            
            // Main UI/UX
            VStack {
                
                // Enemy Hand UI
                HStack{
                    ForEach(emojiCardGame.enemyHand) { card in
                        CardView(element: card.element, power: card.power, color: card.color, isFaceUp: false)
                    }
                    .transition(.scale)
                }
                
                // Table UI
                setBattleTable()
                
                // Player Hand UX
                HStack{
                    ForEach(emojiCardGame.playerHand) { card in
                        CardView(element: card.element, power: card.power, color: card.color, isFaceUp: card.isFaceUp)
                            .onTapGesture {
                                chooseCard(card: card)
                        }
                    }
                    .transition(.offset(x: movement, y: -cardSwing))
                }
                
                // Bank Buttons UX
                Button{
                    withAnimation(.easeInOut) {
                        showBank.toggle()
                        emojiCardGame.hidePlayer()
                    }
                } label: {
                    Text("My Bank")
                        .font(.body)
                        .buttonify(color: showBank ? Color.black : Color.white, size: .medium, fontColor: showBank ? Color.white : Color.black)
                }
                .offset(x: 0, y: 55)
                
                
            }
            .font(.system(size: textFontSize))
            .padding(gamePadding[0])
            .padding(.bottom, gamePadding[1])

            setUpBank()
        }
        
        // Alert and Hid Navigation bar
        .navigationBarHidden(true)
        .alert(isPresented: $showAlert) {
            showAlert(title: emojiCardGame.endGame == .win ? "Win" : "Lose", message: "Reset Game?")
        }
    }
    
    
    
    // MARK: - Methods
    
    // Background methods with given gameColor
    @ViewBuilder private func setBackground() -> some View {
        // 3 rectangles at different angles
        Rectangle().foregroundColor(gameColor).ignoresSafeArea(.all)
        Rectangle().foregroundColor(.white).opacity(0.2).rotationEffect(Angle.degrees(9)).ignoresSafeArea(.all)
        Rectangle().foregroundColor(.white).opacity(0.1).rotationEffect(Angle.degrees(-69)).ignoresSafeArea(.all)
    }
    
    
    // MARK: - Banks
    
    // Setup Player Bank UI
    private func setUpBank() -> some View {
        GeometryReader { geometry in
            bankDisplay(item: emojiCardGame.playerBank, color: gameColor)
                .frame(width: geometry.size.width*0.9, height: geometry.size.height*0.9)
                .offset(x: geometry.size.width*0.05, y: showBank ? geometry.size.height*0.05 : geometry.size.height * 1.2)
        }
    }
    
    // Reusable Bank UI
    private func bankDisplay(item: [BattleSystem<Color, String>.Card], color: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRad).foregroundColor(color).opacity(0.8)
            
            Grid(item) { card in
                CardView(element: card.element, power: card.power, color: card.color, isFaceUp: card.isFaceUp)
            }
        }
    }
    
   
    
    
    //  MARK: - Table View Methods
    
    // Table Logic
    private func tableLogo() -> some View {
        if emojiCardGame.wonRound {
            return tableAlert(systemName: "checkmark.circle.fill", color: .green)
        } else {
            return tableAlert(systemName: "xmark.circle.fill", color: .red)
        }
    }
    
    // Reuseable Table Indicator
    private func tableAlert(systemName: String, color: Color) -> some View {
        ZStack {
            Image(systemName: "circle.fill").imageScale(.medium).foregroundColor(.white)
            Image(systemName: systemName).imageScale(.medium).foregroundColor(color)
        }
    }
    
    // Table UI Setup
    private func setBattleTable() -> some View {
        VStack {
            Spacer()
            HStack {
                tableSet(index: 0)
                Spacer()
                tableLogo()
                Spacer()
                tableSet(index: 1)
            }.padding().background(tableOpacity).cornerRadius(cornerRad).padding(.horizontal, tablePads)
            Spacer()
        }
    }
    
    // Cards to display for the table
    private func tableSet(index: Int) -> CardView {
        CardView(element: emojiCardGame.currentTable[index].element, power:  emojiCardGame.currentTable[index].power, color:  emojiCardGame.currentTable[index].color, isFaceUp:  emojiCardGame.currentTable[index].isFaceUp)
    }
    
    
    
    
    //  MARK: - Game Misc
    
    // Alert Methods
    private func showAlert(title: String, message: String) -> Alert {
        Alert(title: Text(title), message: Text(message), dismissButton: Alert.Button.destructive(Text("Ok")) {
            // Show player current bank
            showBank.toggle()
            // Resets Game
            withAnimation(.easeInOut(duration: 0.2)) {
                emojiCardGame.resetGame()            }
        })
    }
    
    
    // MARK: - Action Methods
    
    private func chooseCard(card: BattleSystem<Color, String>.Card) {
        // Check if selected card is real
        guard let chosenCardIndex = emojiCardGame.playerHand.firstIndexOf(element: card) else {
            return
        }
        // Calculate card animation given index
        cardMovement(for: chosenCardIndex)
        // Flip Table for cool effects
        emojiCardGame.flipTable()
        // With animation, notify the model that player has chosen a card
        withAnimation(.easeInOut) {
            emojiCardGame.choose(card: card)
        }
        // Check whether game ended after model notified, and show bank and alert 
        let gameEnded = emojiCardGame.endGame == .win || emojiCardGame.endGame == .lose
        showBank = gameEnded
        showAlert = gameEnded
    }
    
    
    private func cardMovement(for id: Int) {
        // For each id specify x movement
        switch id {
            case 0:
                movement = 15
            case 1:
                movement = -10
            case 2:
                movement = -75
            case 3:
                movement = -150
            default:
                movement = 0
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiCardGame: EmojiCardBattleGame(), gameColor: Color.black)
    }
}