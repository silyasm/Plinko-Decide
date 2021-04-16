//
//  ContentView.swift
//  Plinko Decide
//
//  Created by Student on 4/9/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var optionsList = OptionsList()
    @State private var showingAddOptionView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(optionsList.options) { option in
                    HStack {
                        Text(option.name)
                    }
                }
                .onMove(perform: { indices, newOffset in optionsList.options.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    optionsList.options.remove(atOffsets: indexSet)
                })
            }
            .sheet(isPresented: $showingAddOptionView, content: {
                AddOptionView(optionsList: optionsList)
            })
            .navigationBarTitle("Plinko Decide")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button( action: {
                                    showingAddOptionView = true}) {
                                    Image(systemName: "plus")
                                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OptionItem : Identifiable, Codable {
    var id = UUID()
    var name = ""
}
