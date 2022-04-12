//
//  HeaderImage.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 10.4.2022.
//

import SwiftUI

struct HeaderImage: View {
    var body: some View {
        headerImage
        avatar
    }
    
    var headerImage: some View {
        Image("headerImage").overlay(Rectangle().foregroundColor(.black).opacity(0.4)).offset(y: -20)
    }
    
    var avatar: some View {
        ZStack {
            Circle().frame(width: 100, height: 100)
                .foregroundColor(Color("LightGreen"))
            
            Text("A").foregroundColor(.white).font(.system(size: 60)).fontWeight(.medium)
        }.offset(y: -80).padding(.bottom, -70)
    }
}

struct HeaderImage_Previews: PreviewProvider {
    static var previews: some View {
        HeaderImage()
    }
}
