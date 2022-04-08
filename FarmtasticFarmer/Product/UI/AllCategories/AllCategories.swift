//
//  AllCategories.swift
//  FarmtasticFarmer
//
//  Created by Trung on 7.4.2022.
//

import SwiftUI

struct AllCategories: View {
    var body: some View {
        Text("Hacking with Swift")
            .font(.system(size: 48))
            .padding(50)
            .background(
                Image("singapore")
                    .resizable()
            )
    }
}

struct AllCategories_Previews: PreviewProvider {
    static var previews: some View {
        AllCategories()
    }
}
