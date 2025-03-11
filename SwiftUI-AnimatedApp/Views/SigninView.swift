//
//  SigninView.swift
//  SwiftUI-AnimatedApp
//
//  Created by Malyadri Reddy on 10/03/25.
//

import SwiftUI
import RiveRuntime

struct SigninView: View {
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @Binding var showModel: Bool
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
 
    
    func loggin() {
        
        isLoading = true
        if email != "" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Check")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
                confetti.triggerInput("Trigger explosion")
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation{
                    showModel.toggle()
                }
            }
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isLoading = false
                check.triggerInput("Error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
    }
    
    var body: some View {
        VStack (spacing: 24){
            Text("Sign In")
                .customFont(textStyle: .largeTitle)
            Text("Access to 240+ hours of content. learn design and code, by building real app with React and Swift.")
                .customFont(textStyle: .headline)
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(textStyle: .headline)
                    .foregroundColor(.secondary)
                
                TextField("", text: $email)
                    .customeTextField()
            }
            
            VStack(alignment: .leading) {
                Text("Password")
                    .customFont(textStyle: .headline)
                    .foregroundColor(.secondary)
                
                SecureField("", text: $password)
                    .customeTextField(image: Image("Icon Lock"))
            }
            
            Button{
              loggin()
              
            } label: {
                Label("Sign In", systemImage: "arrow.right")
                    .customFont(textStyle: .headline)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "F77D8E"))
                    .foregroundColor(.white)
                    .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                    .cornerRadius(8, corners: [.topLeft])
                    .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 20, x: 0, y: 10)
            }
            
            HStack {
                Rectangle()
                    .frame(height: 1).opacity(0.1)
                
                Text("OR").customFont(textStyle: .subheadline2).foregroundColor(.black.opacity(0.3))
                Rectangle()
                    .frame(height: 1).opacity(0.1)
            }
            
            //Divider()
           
            Text("Sign up with Email, Appr Google")
                .customFont(textStyle: .subheadline)
                .foregroundColor(.secondary)
            HStack {
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
                
            }
        }
        .padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomLeading)))
        .padding()
        .overlay(
            ZStack {
                if isLoading {
                    check.view()
                        .frame(width: 100, height: 100)
                        .allowsHitTesting(false)
                }
                
                confetti.view()
                    .scaleEffect(3)
                    .allowsHitTesting(false)
                
            }
          
        )
    }
}

#Preview {
    SigninView(showModel: .constant(true))
}
