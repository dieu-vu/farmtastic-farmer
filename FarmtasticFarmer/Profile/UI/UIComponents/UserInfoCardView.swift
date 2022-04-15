//
//  UserInfoCardView.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/10/22.
//

import SwiftUI


struct UserInfoCardView: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    let screenSize: CGRect = UIScreen.main.bounds
    @Binding var currentUser: User

    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            HStack{
                Text(currentUser.username.localized(language: language))
                    .bold()
            }
            HStack{
                Image.init(systemName: "mappin.circle" )
                Text(currentUser.full_name.address.localized(language: language))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            HStack{
                Image.init(systemName: "phone" )
                Text(currentUser.full_name.phone.localized(language: language))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
         
        }
        .padding()
    }
}

struct UserInfoCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoCardView(currentUser: .constant(User.initData))
    }
}
