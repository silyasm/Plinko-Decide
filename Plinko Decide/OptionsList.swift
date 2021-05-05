//
//  OptionsList.swift
//  Plinko Decide
//
//  Created by Student on 4/12/21.
//

import Foundation
class OptionsList : ObservableObject {
    @Published var options : [OptionItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(options) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    
    @Published var presets = [Preset(name: "Cuisine", optionSet: [OptionItem(name: "American"),
                                                                  OptionItem(name: "Chinese"),
                                                                  OptionItem(name: "Italian"),
                                                                  OptionItem(name: "Mexican")]),
                              Preset(name: "Movies", optionSet: [OptionItem(name: "Star Wars"),
                                                                 OptionItem(name: "Titanic"),
                                                                 OptionItem(name: "Avengers"),
                                                                 OptionItem(name: "The Departed"),
                                                                 OptionItem(name: "Inception")]),
                              Preset(name: "Colors", optionSet: [OptionItem(name: "Blue"),
                                                                 OptionItem(name: "Red"),
                                                                 OptionItem(name: "Green"),
                                                                 OptionItem(name: "Yellow"),
                                                                 OptionItem(name: "Purple")]),
                              Preset(name: "Music", optionSet: [OptionItem(name: "Hip Hop"),
                                                                 OptionItem(name: "Country"),
                                                                 OptionItem(name: "Pop"),
                                                                 OptionItem(name: "Rock"),
                                                                 OptionItem(name: "Jazz")]),
                              Preset(name: "Animals", optionSet: [OptionItem(name: "Rabbit"),
                                                                 OptionItem(name: "Duck"),
                                                                 OptionItem(name: "Bear"),
                                                                 OptionItem(name: "Eagle"),
                                                                 OptionItem(name: "Deer")]),
                              Preset(name: "Cities", optionSet: [OptionItem(name: "Sydney"),
                                                                 OptionItem(name: "Paris"),
                                                                 OptionItem(name: "Beijing"),
                                                                 OptionItem(name: "Karachi"),
                                                                 OptionItem(name: "Budapest"),
                                                                 OptionItem(name: "Lima")]),
                              Preset(name: "Toms", optionSet: [OptionItem(name: "Tom Hanks"),
                                                                 OptionItem(name: "Tom Cruise"),
                                                                 OptionItem(name: "Tom Brady"),
                                                                 OptionItem(name: "Tom Holland"),
                                                                 OptionItem(name: "Tom Petty"),
                                                                 OptionItem(name: "Tom Hiddleston")]),
                              Preset(name: "Trees", optionSet: [OptionItem(name: "Maple"),
                                                                 OptionItem(name: "Spruce"),
                                                                 OptionItem(name: "Oak"),
                                                                 OptionItem(name: "Red Birch"),
                                                                 OptionItem(name: "Pine"),
                                                                 OptionItem(name: "Willow")])]
    
    init() {
        if let options = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([OptionItem].self, from: options) {
                self.options = decoded
                return
            }
        }
        options = []
    }
}
