//
//  OnboardingView.swift
//  SwiftUI-AnimatedApp
//
//  Created by Malyadri Reddy on 10/03/25.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    
    let button = RiveViewModel(fileName: "button")
    @State var showModel  = false
    @Binding var show: Bool
    
    var body: some View {
        
        ZStack {
            background
            content
                .offset(y: showModel ? -50 : 0)
            
            Color("Shadow")
                .opacity(showModel ? 0.4 : 0).ignoresSafeArea()
            
            if showModel {
                
                SigninView(showModel: $showModel)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .overlay(Button {
                        withAnimation(.spring()){
                            showModel.toggle()
                        }
                    } label: {
                        
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundColor(.black)
                            .background(.white)
                            .mask(Circle())
                            .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
                    }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .zIndex(1)
            }
            
            Button {
                withAnimation {
                    show.toggle()
                }
                
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 36, height: 36)
                    .background(.black)
                    .foregroundColor(.white)
                    .mask(Circle())
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .offset(y: showModel ? -200 :  80)
                
            }
    }
    
    var content: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Learn design & code")
                .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                .frame(width: 260, alignment: .leading)
            
            Text("Don't skip design. learn design and code, by building real apps with React and Swift. Complete courses about the best tools.")
                .customFont(textStyle: .body)
                .opacity(0.7)
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            button.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Start the course", systemImage: "arrow.forward")
                        .offset(x:4, y: 4)
                        .font(.headline)
                )
                .background(
                    Color.black
                        .cornerRadius(10)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()){
                            showModel.toggle()
                        }
                    }
                }
            
            Text("Purchase includes access to 30+ courses, 248+ premium tutorials, 120+ hours of videos , source files and certificates.")
                .customFont(textStyle: .footnote)
                .opacity(0.7)
        }
        .padding(40)
        .padding(.top, 40)
    }
    
    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x:200 , y:100)
            )
    }
}

#Preview {
    OnboardingView(show: .constant(true))
}
