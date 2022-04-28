//
//  SearchResults.swift
//  FarmtasticFarmer
//
//  Created by Trung on 7.4.2022.
//

import SwiftUI
struct SearchResults: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    @Binding var searchText: String
    @State var screenTitle: String = "product.searchResults"
    
    var body: some View {
        VStack {
            VStack {
                Rectangle().fill(Color("LightGreen")).frame(height: 150).opacity(0.5).overlay(
                    Image("logo").resizable().scaledToFill().frame(width: 250, height: 100).padding(.top, 15)
                )
                RoundedRectangle(cornerRadius: 50).fill(.white).frame(height: 70).padding(.top, -50)
                HStack {
                    BackButton()
                    Spacer()
                    VStack {
                        Text("\(screenTitle)".localized(language: language)).font(.title2)
                        Text("\(searchText)").font(.title2).bold()
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, -50)
                List {
                    
                }
            }
            .edgesIgnoringSafeArea(.top)
            .padding(.bottom, -50)
        }
        
    }
}

//struct SearchResults_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResults(searchText: "")
//    }

