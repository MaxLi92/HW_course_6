//
//  ContentView.swift
//  HW_course_6
//
//  Created by Max Li on 15.09.2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var keyboardHeight: CGFloat = 0
    
    private let kbHeightPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .compactMap { $0.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect }
            .map { $0.size.height },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ -> CGFloat in 0 })
        .removeDuplicates()


    var body: some View {
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                VStack{
                    ScrollView (showsIndicators: false) {
                        Text("It's new VK")
                            .font(.largeTitle)
                            .padding(.top, 150)
                        
                        HStack {
                            Label("", systemImage: "binoculars.fill")
                            Text("Login:")
                            Spacer()
                            TextField("", text: $login)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }.frame(maxWidth: 300)
                        
                        HStack {
                            Label("", systemImage: "key.fill")
                            Text("Password:")
                            Spacer()
                            TextField("", text: $password)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }.frame(maxWidth: 300)
                        
                        Button(action: {print("hello")}, label: {Text("Log in")})
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .disabled(login.isEmpty || password.isEmpty)
                        }
                    }
                    .padding(.bottom, keyboardHeight)
                    .onReceive(kbHeightPublisher) { height in
                        withAnimation(Animation.easeInOut(duration: 0.1)) {
                            self.keyboardHeight = height - 300
                        }
                    }
                }.onTapGesture {
                    UIApplication.shared.endEditing()
                }
        }
    }

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
