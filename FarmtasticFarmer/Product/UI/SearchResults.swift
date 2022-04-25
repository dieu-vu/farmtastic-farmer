//
//  SearchResults.swift
//  FarmtasticFarmer
//
//  Created by Trung on 7.4.2022.
//

import SwiftUI
struct SearchResults: View {
    @Binding var searchText: String
    
    var body: some View {
        Text("\(searchText)")
    }
}

/*struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults()
    }
}*/
