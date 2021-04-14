//
//  OptionsList.swift
//  Plinko Decide
//
//  Created by Student on 4/12/21.
//

import Foundation
class OptionsList : ObservableObject {
    @Published var options = [OptionItem(name: "Korean"),
                              OptionItem(name: "American"),
                              OptionItem(name: "Chinese")]
}
