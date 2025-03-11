//
//  CustomFont.swift
//  SwiftUI-AnimatedApp
//
//  Created by Malyadri Reddy on 10/03/25.
//

import SwiftUI

struct CustomFont: ViewModifier {
    
    var textStyle : TextStyle
    var name: String {
        
        switch textStyle {
        case .largeTitle, .title, .title1, .title2, .title3:
            return "Poppin Bold"
        case .body, .subheadline, .footnote, .caption:
            return "Inter Regular"
        case .headline, .subheadline2, .footnote2, .caption2:
            return "Inter SemiBold"
        }
    }
    
    var size: CGFloat {
        switch textStyle {
        case .largeTitle:
            return 34
        case .title:
            return 28
        case .title1:
            return 28
        case .title2:
            return 24
        case .title3:
            return 20
        case .body:
            return 17
        case .subheadline:
            return 15
        case .footnote:
            return 13
        case .caption:
            return 12
        case .headline:
            return 17
        case .subheadline2:
            return 15
        case .footnote2:
            return 13
        case .caption2:
            return 12
        }
    }
    
    var relative: Font.TextStyle {
        switch textStyle {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title
        case .title1:
            return .title
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .body:
            return .body
        case .subheadline:
            return .subheadline
        case .footnote:
            return .footnote
        case .caption:
            return .caption
        case .headline:
            return .headline
        case .subheadline2:
            return .subheadline
        case .footnote2:
            return .footnote
        case .caption2:
            return .caption2
        }
    }
    
    func body(content: Content) -> some View {
        
        content.font(.custom(name, size: size, relativeTo: relative))
        
    }
}

extension View {
    
    func customFont(textStyle: TextStyle) -> some View {
        modifier(CustomFont(textStyle: textStyle))
    }
}

enum TextStyle {
    case largeTitle
    case title
    case title1
    case title2
    case title3
    case body
    case subheadline
    case footnote
    case caption
    case headline
    case subheadline2
    case footnote2
    case caption2
}
