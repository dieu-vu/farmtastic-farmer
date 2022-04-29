//
//  AnalyticsCard.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 28.4.2022.
//

import SwiftUI

struct AnalyticsCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(Color(UIColor.lightGray)).opacity(0.1)
            .frame(width: .infinity, height: 450)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
    }
}

struct AnalyticsCard_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsCard()
    }
}
