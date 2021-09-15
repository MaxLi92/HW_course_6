//
//  ContentView.swift
//  HW_course_6
//
//  Created by Max Li on 15.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var login = ""
    @State private var password = ""

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
