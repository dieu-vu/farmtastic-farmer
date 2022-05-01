//
//  ScreenLayout.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 25.4.2022.
//

import SwiftUI

// Reusable screen header for the app
struct ScreenLayout: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    var screenTitle: String
    var hasBackButton: Bool
    var subTitle: String?
    var text: String?
    
    var body: some View {
        VStack {
            Rectangle().fill(Color("LightGreen")).frame(height: 150).opacity(0.5).overlay(
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 100)
                    .padding(.top, 15)
            )
            RoundedRectangle(cornerRadius: 50)
                .fill(.white)
                .frame(height: 70)
                .padding(.top, -50)
            HStack {
                if hasBackButton {
                    BackButton()
                }
                Spacer()
                VStack {
                    if let subTitle = subTitle {
                        Text("\(screenTitle)".localized(language: language))
                            .font(.title2)
                        Text(subTitle.localized(language: language))
                            .font(.title2)
                            .bold()
                        if let text = text {
                            Text(text)
                        }
                    } else {
                        Text("\(screenTitle)".localized(language: language))
                            .font(.title2)
                            .bold()
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, -50)
        }
        .edgesIgnoringSafeArea(.top)
        .padding(.bottom, -50)
    }
}

struct ScreenLayout_Previews: PreviewProvider {
    static var previews: some View {
        ScreenLayout(screenTitle: "Test screen", hasBackButton: true)
    }
}
