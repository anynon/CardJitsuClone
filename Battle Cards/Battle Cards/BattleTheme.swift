//
//  BattleTheme.swift
//  Battle Cards
//
//  Created by Vincent on 10/24/20.
//

import Foundation
import SwiftUI

struct BattleTheme: Identifiable, Hashable {
    var title: String
    private(set) var id: UUID
    var colorPicker: [UIColor.RGB]
    var elementPicker: [String]
    var themeBackground: UIColor.RGB
    
    init(name: String = "Untitled", colors: [UIColor.RGB], elements: [String], background: UIColor.RGB) {
        title = name
        id = UUID()
        colorPicker = colors
        elementPicker = elements
        themeBackground = background
    }
    
    static func == (lhs: BattleTheme, rhs: BattleTheme) -> Bool {
            return lhs.id == rhs.id
    }
    
    static var all: [BattleTheme] = [.art, .murica, .pastel, .noir, .covid, .pacman, .wildwest, .physics, .math, .idk]
    
    static var art: BattleTheme = BattleTheme(
        name: "artistic",
        colors: [UIColor.systemOrange.rgb, UIColor.gold.rgb, UIColor.systemBlue.rgb, UIColor.systemPurple.rgb],
        elements: ["🔥", "☘️", "💧"],
        background: UIColor.darkBrown.rgb
    )
    
    static var murica: BattleTheme = BattleTheme(
        name: "murica",
        colors: [UIColor.visibleWhite.rgb, UIColor.systemIndigo.rgb, UIColor.black.rgb, UIColor.systemPink.rgb],
        elements: ["🔫", "🔪", "💸"],
        background: UIColor.red.rgb
    )
    
    static var pastel: BattleTheme = BattleTheme(
        name: "tropical",
        colors: [UIColor.gold.rgb, UIColor.pastelGreen.rgb, UIColor.pastelCream.rgb, UIColor.pastelCyan.rgb],
        elements: ["🥵", "🥶", "😰"],
        background: UIColor.pastelCream.rgb
    )
    
    static var noir: BattleTheme = BattleTheme(
        name: "noir",
        colors: [UIColor.black.rgb, UIColor.darkGray.rgb, UIColor.visibleWhite.rgb, UIColor.lightGray.rgb],
        elements: ["✂️", "📃", "🌑"],
        background: UIColor.black.rgb
    )
    
    static var covid: BattleTheme = BattleTheme(
        name: "Outbreak",
        colors: [UIColor.systemOrange.rgb ,UIColor.systemRed.rgb, UIColor.varus.rgb, UIColor.varus2.rgb],
        elements: ["🦠", "👤", "💉"],
        background: UIColor.varus.rgb
    )
    
    static var pacman: BattleTheme = BattleTheme(
        name: "Retro",
        colors: [UIColor.systemIndigo.rgb, UIColor.lightGray.rgb, UIColor.black.rgb ,UIColor.gold.rgb],
        elements: ["😶", "👾", "👻"],
        background: UIColor.systemIndigo.rgb
    )
   
    static var wildwest: BattleTheme = BattleTheme(
        name: "Cowboys",
        colors: [UIColor.spruceBrown.rgb, UIColor.gold.rgb, UIColor.systemOrange.rgb ,UIColor.brown.rgb],
        elements: ["🤠", "🐎", "💰"],
        background: UIColor.brown.rgb
    )
    
    static var physics: BattleTheme = BattleTheme(
        name: "Physics",
        colors: [UIColor.gold.rgb, UIColor.systemOrange.rgb, UIColor.systemRed.rgb, UIColor.pastelRed.rgb],
        elements: ["💎", "🧪", "💨"],
        background: UIColor.darkPurple.rgb
    )
    
    static var math: BattleTheme = BattleTheme(
        name: "Maths",
        colors: [UIColor.violet.rgb, UIColor.systemPurple.rgb, UIColor.lavender.rgb, UIColor.mediumPurple.rgb],
        elements: ["✖️", "➗", "➕"],
        background: UIColor.mediumPurple.rgb
    )
    
    static var idk: BattleTheme = BattleTheme(
        name: "I gave up",
        colors: [UIColor.black.rgb, UIColor.systemRed.rgb, UIColor.gold.rgb, UIColor.systemBlue.rgb],
        elements: ["🌀", "🔆", "💢"],
        background: UIColor.systemBlue.rgb
    )
}
