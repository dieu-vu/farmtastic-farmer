//
//  SearchBar.swift
//  FarmtasticFarmer
//
//  Created by Trang on 13.4.2022.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.white))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search ..", text: $searchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
                Image(systemName: "mic.fill").padding(20)
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.black, lineWidth: 2)
        )
        .padding()
    }
}
