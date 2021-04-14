//
//  AddOptionView.swift
//  Plinko Decide
//
//  Created by Student on 4/12/21.
//

import SwiftUI

struct AddOptionView: View {
    @ObservedObject var optionsList : OptionsList
    @State private var name = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Add New Option")
            .navigationBarItems(trailing: Button("Save") {
                if name.count > 0 {
                    let option = OptionItem(id: UUID(), name: name)
                    optionsList.options.append(option)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
}
}

struct AddOptionView_Previews: PreviewProvider {
    static var previews: some View {
        AddOptionView(optionsList: OptionsList())
    }
}
