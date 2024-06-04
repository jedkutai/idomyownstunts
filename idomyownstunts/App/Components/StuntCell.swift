//
//  StuntCell.swift
//  idomyownstunts
//
//  Created by Jed Kutai on 6/4/24.
//

import SwiftUI

struct StuntCell: View {
    let stunt: Stunt
    
    @Environment(\.colorScheme) var colorScheme
    
    let maxNumberWidth = UIScreen.main.bounds.width * 0.4
    
    var body: some View {
        HStack {
            Text(stunt.title)
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                .font(.title2.weight(.semibold))
                .lineLimit(1)
                .truncationMode(.tail)
            
            Spacer()
            
            Text("\(stunt.tally)")
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                .font(.largeTitle.weight(.bold))
                .minimumScaleFactor(0.1)
        }
        .padding(.horizontal, 5)
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(colorScheme == .dark ? .black : .white)
                .shadow(
                    color: colorScheme == .dark ? .white.opacity(0.33) : .black.opacity(0.33),
                    radius: 5
                )
        )
    }
}

#Preview {
    StuntCell(stunt: Stunt.MOCK_STUNTS[0])
}
