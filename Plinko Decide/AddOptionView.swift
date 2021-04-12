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
        }
}
}

struct AddOptionView_Previews: PreviewProvider {
    static var previews: some View {
        AddOptionView(optionsList: OptionsList())
    }
}
