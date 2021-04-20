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
                                                                 OptionItem(name: "Inception")])]
    
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
