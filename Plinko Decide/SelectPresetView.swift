//
//  SelectPresetView.swift
//  Plinko Decide
//
//  Created by Student on 4/20/21.
//

import SwiftUI

struct SelectPresetView: View {
    @ObservedObject var optionsList : OptionsList
    @State private var showingPlinkoBoardView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(optionsList.presets) { preset in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(preset.name)
                                .font(.headline)
                                .fontWeight(.bold)
                            ForEach(preset.optionSet) { option in
                                Text(option.name)
                                    .font(.body)
                            }
                        }
                        Spacer()
                        Button(action: {
                            optionsList.options = preset.optionSet
                            showingPlinkoBoardView = true
                        }, label: {
                            Text("Select")
                                .foregroundColor(.blue)
                                .font(.headline)
                        })
                    }
                }
            }
            .sheet(isPresented: $showingPlinkoBoardView, content: {
                PlinkoBoardView()
            })
            .navigationBarTitle(Text("Select Preset"))
        }
    }
}

struct SelectPresetView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPresetView(optionsList: OptionsList())
    }
}
