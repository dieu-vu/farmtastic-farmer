//
//  UserInfoCardView.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/10/22.
//

import SwiftUI


struct UserInfoCardView: View {
    let screenSize: CGRect = UIScreen.main.bounds
    let user = User.fetchUser()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            HStack{
                Text("Username")
                    .bold()
                Button (action: {print("Hi")}, label: {
                    Image.init(systemName: "pencil")
                        .accentColor(.black)
                })
            }
            HStack{
                Image.init(systemName: "mappin.circle" )
                Text("address")
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            HStack{
                Image.init(systemName: "phone" )
                Text("Phone")
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
