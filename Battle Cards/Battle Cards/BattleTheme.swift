//
//  BattleTheme.swift
//  Battle Cards
//
//  The MIT License (MIT)
//  Copyright © 2020 d-exclaimation
//

import Foundation
import SwiftUI

struct BattleTheme: Identifiable, Hashable, CustomStringConvertible, Codable {
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
    
    init?(json: Data?) {
        if json != nil, let theme = try? JSONDecoder().decode(BattleTheme.self, from: json!) {
            self = theme
        } else {
            return nil
        }
    }
    
    static func == (lhs: BattleTheme, rhs: BattleTheme) -> Bool {
            return lhs.id == rhs.id
    }
    
    public var description: String {
        ["Name: \(title)\n",
         "Colors: \(colorPicker)\n",
         "Elements: \(elementPicker)\n",
         "Background: \(themeBackground)\n"
        ].compressed
    }
    
    var json: Data? {
        try? JSONEncoder().encode(self)
    }
    
    static var all: [BattleTheme] = [.art, .murica, .pastel, .noir, .covid, .pacman, .wildwest, .physics, .math, .idk, .vehicle, .aircraft, .buildings]
    
    static let art: BattleTheme = BattleTheme(
        name: "artistic",
        colors: [UIColor.systemOrange.rgb, UIColor.gold.rgb, UIColor.systemBlue.rgb, UIColor.systemPurple.rgb],
        elements: ["🔥", "☘️", "💧"],
        background: UIColor.darkBrown.rgb
    )
    
    static let murica: BattleTheme = BattleTheme(
        name: "murica",
        colors: [UIColor.visibleWhite.rgb, UIColor.systemIndigo.rgb, UIColor.black.rgb, UIColor.systemPink.rgb],
        elements: ["🔫", "🔪", "💸"],
        background: UIColor.red.rgb
    )
    
    static let pastel: BattleTheme = BattleTheme(
        name: "tropical",
        colors: [UIColor.gold.rgb, UIColor.pastelGreen.rgb, UIColor.pastelCream.rgb, UIColor.pastelCyan.rgb],
        elements: ["🥵", "🥶", "😰"],
        background: UIColor.pastelCream.rgb
    )
    
    static let noir: BattleTheme = BattleTheme(
        name: "noir",
        colors: [UIColor.black.rgb, UIColor.darkGray.rgb, UIColor.visibleWhite.rgb, UIColor.lightGray.rgb],
        elements: ["✂️", "📃", "🌑"],
        background: UIColor.black.rgb
    )
    
    static let covid: BattleTheme = BattleTheme(
        name: "Outbreak",
        colors: [UIColor.systemOrange.rgb ,UIColor.systemRed.rgb, UIColor.varus.rgb, UIColor.varus2.rgb],
        elements: ["🦠", "👤", "💉"],
        background: UIColor.varus.rgb
    )
    
    static let pacman: BattleTheme = BattleTheme(
        name: "Retro",
        colors: [UIColor.systemIndigo.rgb, UIColor.lightGray.rgb, UIColor.black.rgb ,UIColor.gold.rgb],
        elements: ["😶", "👾", "👻"],
        background: UIColor.systemIndigo.rgb
    )
   
    static let wildwest: BattleTheme = BattleTheme(
        name: "Cowboys",
        colors: [UIColor.spruceBrown.rgb, UIColor.gold.rgb, UIColor.systemOrange.rgb ,UIColor.brown.rgb],
        elements: ["🤠", "🐎", "💰"],
        background: UIColor.brown.rgb
    )
    
    static let physics: BattleTheme = BattleTheme(
        name: "Physics",
        colors: [UIColor.gold.rgb, UIColor.systemOrange.rgb, UIColor.systemRed.rgb, UIColor.pastelRed.rgb],
        elements: ["💎", "🧪", "💨"],
        background: UIColor.darkPurple.rgb
    )
    
    static let math: BattleTheme = BattleTheme(
        name: "Maths",
        colors: [UIColor.violet.rgb, UIColor.systemPurple.rgb, UIColor.lavender.rgb, UIColor.mediumPurple.rgb],
        elements: ["✖️", "➗", "➕"],
        background: UIColor.mediumPurple.rgb
    )
    
    static let idk: BattleTheme = BattleTheme(
        name: "I gave up",
        colors: [UIColor.black.rgb, UIColor.systemRed.rgb, UIColor.gold.rgb, UIColor.systemBlue.rgb],
        elements: ["🌀", "🔆", "💢"],
        background: UIColor.systemBlue.rgb
    )
    
    static let vehicle: BattleTheme = BattleTheme(
        name: "Vehicles",
        colors: [UIColor.slate.rgb, UIColor.darkSlate.rgb, UIColor.darkerSlate.rgb, UIColor.lightPink.rgb],
        elements: ["🏎", "🚗", "🏍"],
        background: UIColor.slate.rgb
    )
    
    static let aircraft: BattleTheme = BattleTheme(
        name: "Aeronautical",
        colors: [UIColor.black.rgb, UIColor.systemTeal.rgb, UIColor.blueGray.rgb, UIColor.pastelCream.rgb],
        elements: ["🛰", "🚀", "🛸"],
        background: UIColor.systemTeal.rgb
    )
    
    static let buildings: BattleTheme = BattleTheme(
        name: "Building",
        colors: [UIColor.systemOrange.rgb, UIColor.pastelRed.rgb, UIColor.systemTeal.rgb, UIColor.visibleWhite.rgb],
        elements: ["🗼", "⛩", "🏯"],
        background: UIColor.systemOrange.rgb
    )
}
