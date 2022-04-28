//
//  HeaderImage.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 10.4.2022.
// Struct to create the header Image component in Profile view

import SwiftUI

struct HeaderImage: View {
    
    @Binding var currentUser: User

    var body: some View {
        headerImage
        avatar
    }
    
    var headerImage: some View {
        Image("headerImage").resizable().scaledToFit().overlay(Rectangle().foregroundColor(.black).opacity(0.4)).offset(y: -20)
    }
    
    var avatar: some View {
        ZStack {
            Circle().frame(width: 100, height: 100)
                .foregroundColor(Color("LightGreen"))
            
            Text("\(String(currentUser.username.prefix(1)).uppercased())").foregroundColor(.white).font(.system(size: 60)).fontWeight(.medium)
        }.offset(y: -80).padding(.bottom, -70)
    }
}

//struct HeaderImage_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderImage()
//    }
//}
