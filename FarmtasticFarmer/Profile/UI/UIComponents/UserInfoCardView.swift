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
//    let user = UserProfileViewController
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            HStack{
                Text("profile.username".localized(language: language))
                    .bold()
                Button (action: {print("Hi")}, label: {
                    Image.init(systemName: "pencil")
                        .accentColor(.black)
                })
            }
            HStack{
                Image.init(systemName: "mappin.circle" )
                Text("profile.address".localized(language: language))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            HStack{
                Image.init(systemName: "phone" )
                Text("profile.phone".localized(language: language))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
         
        }
        .padding()
        
    }
}

struct UserInfoCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoCardView()
    }
}
