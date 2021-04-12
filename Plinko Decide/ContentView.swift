//
//  ContentView.swift
//  Plinko Decide
//
//  Created by Student on 4/9/21.
//

import SwiftUI

struct ContentView: View {
    @State var optionsList = OptionsList()

    var body: some View {
        NavigationView {
            List {
                ForEach(optionsList.options) { option in
                    Text(option.name)
                }
                .onMove(perform: { indices, newOffset in
                    optionsList.options.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    optionsList.options.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Plinko Decide")
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OptionItem : Identifiable{
    var id = UUID()
    var name = ""
}
