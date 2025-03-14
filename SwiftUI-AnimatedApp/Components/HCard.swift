//
//  HCard.swift
//  SwiftUI-AnimatedApp
//
//  Created by Malyadri Reddy on 11/03/25.
//

import SwiftUI

struct HCard: View {
    var section: CourseSection
    
    var body: some View {
        HStack (spacing: 20){
            VStack (alignment: .leading, spacing: 8){
                Text(section.title)
                    .customFont(textStyle: .title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(section.caption)
                    .customFont(textStyle: .body)
            }
            Divider()
            section.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(section.color)
        .foregroundColor(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

#Preview {
    HCard(section: courseSections[0])
}
