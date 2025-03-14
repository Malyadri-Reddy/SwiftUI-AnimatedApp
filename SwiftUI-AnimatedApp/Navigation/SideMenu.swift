//
//  SideMenu.swift
//  SwiftUI-AnimatedApp
//
//  Created by Malyadri Reddy on 11/03/25.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")
    @State var selectedMenu: SelectedMenu = .home
    @State var isDarkMode = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .padding(12)
                    .background(.white.opacity(0.2))
                    .mask(Circle())
                VStack (alignment: .leading, spacing: 2){
                    Text("Malyadri")
                        .customFont(textStyle: .body)
                    Text("Mobile App Developer")
                        .customFont(textStyle: .subheadline)
                        .opacity(0.7)
                    
                }
                Spacer()
            }
            .padding()
            
            Text("BROWSE")
                .customFont(textStyle: .subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            VStack(alignment: .leading, spacing: 0) {
                
                ForEach(menuItems) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    MenuRow(selectedMenu: $selectedMenu, item: item)
                }
            }
            .padding(8)
            
            Text("HISTORY")
                .customFont(textStyle: .subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            VStack(alignment: .leading, spacing: 0) {
                
                ForEach(menuItems2) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    MenuRow(selectedMenu: $selectedMenu, item: item)
                }
            }
            .padding(8)
            
            Spacer()
            HStack {
                
                menuItems3[0].icon.view()
                    .frame(width: 32, height: 32)
                    .opacity(0.6)
                    .onChange(of: isDarkMode) { oldValue, newValue in
                        if newValue {
                            menuItems3[0].icon.setInput("active", value: true)
                        }
                        else {
                            menuItems3[0].icon.setInput("active", value: false)
                        }
                    }
                Text(menuItems3[0].text)
                    .customFont(textStyle: .headline)
               
                Toggle("", isOn: $isDarkMode)
            }
            .padding(20)
           
        }
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

#Preview {
    SideMenu()
}

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
    var menu: SelectedMenu
}

var menuItems = [
    MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), menu: .home),
    MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), menu: .search),
    MenuItem(text: "Favourites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), menu: .favourites),
    MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), menu: .help)
]

var menuItems2 = [
    MenuItem(text: "History", icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), menu: .home),
    MenuItem(text: "Notifications", icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), menu: .search)
]

var menuItems3 = [
    MenuItem(text: "Dark Mode", icon: RiveViewModel(fileName: "icons", stateMachineName: "SETTINGS_Interactivity", artboardName: "SETTINGS"), menu: .home)
]

enum SelectedMenu: String {
    case home
    case search
    case favourites
    case help
    case history
    case notifictions
    case darkMode
}
