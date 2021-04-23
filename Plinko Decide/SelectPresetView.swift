//
//  SelectPresetView.swift
//  Plinko Decide
//
//  Created by Student on 4/20/21.
//

import SwiftUI

struct SelectPresetView: View {
    @ObservedObject var optionsList : OptionsList
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                ForEach(optionsList.presets) {preset in
                    HStack {
                        Text(preset.name)
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            optionsList.options = preset.optionSet
                        }, label: {
                            Text("Select")
                                .foregroundColor(.blue)
                        })
                    }
                }
                
                NavigationLink(destination: PlinkoBoardView()) {
                    Text("Let's Plinko!")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            .navigationBarTitle(Text("Select Preset"))
        }
    }
}

struct SelectPresetView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPresetView(optionsList: OptionsList())
    }
}
