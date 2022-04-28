//
//  ProductMainScreen.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//

import SwiftUI
import AVFoundation

struct ProductMainScreen: View {
    
    @EnvironmentObject var productDataController: ProductDataController
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var tabSelection: Int
    
    let products: [Product]
    @State var searchText: String = ""
    @State private var isRecording: Bool = false
    @State var isOn: Bool = false
    @StateObject var speechRecognizer = SpeechRecognizer()
    
    @State var screenTitle = "product.allCategories"
    @State var hasBackButton = false
    @State var navigateToAddProduct: Bool = false
    
    
    let meatProductList = Product.sampleProductsList.filter {
        $0.Category.starts(with: "Meat")
    }
    let vegeProductList = Product.sampleProductsList.filter {
        $0.Category.starts(with: "Vegetables")
    }
    let fruitProductList = Product.sampleProductsList.filter {
        $0.Category.starts(with: "Fruit")
    }
    
    var body: some View {
        
        VStack {
            ScreenLayout(screenTitle: $screenTitle, hasBackButton: $hasBackButton).padding(.bottom, 30)
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .foregroundColor(Color("LightYellow")).opacity(0.2)
                HStack {
                    TextField("Search ..", text: $searchText)
                    Button(action: {
                        isOn.toggle()
                        if isOn {
                            speechRecognizer.reset()
                            speechRecognizer.transcribe()
                            isRecording = true
                            print("isRecording: \(isRecording)")
                        } else {
                            speechRecognizer.stopTranscribing()
                            isRecording = false
                            searchText = speechRecognizer.transcript
                            print("isRecording: \(isRecording)")
                            print("searchText: \(searchText)")
                        }
                    }) {
                        Image(systemName: isRecording ? "stop.circle" : "mic.fill").padding(.trailing, 8)
                    }
                    NavigationLink(destination: SearchResults(searchText: $searchText).navigationBarBackButtonHidden(true)){
                        Image(systemName: "magnifyingglass").padding(.trailing, 20)
                    }
                    .disabled(searchText.isEmpty)
                }
                .foregroundColor(.gray)
                .padding(.leading, 15)
            }
            .frame(height: 40)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.black, lineWidth: 2)
            )
            .padding()
            .onAppear {
                searchText = ""
            }
            
            ScrollView {
                VStack {
                    CategoryProductListView(products: meatProductList, category: "Meat")
                    CategoryProductListView(products: vegeProductList, category: "Vegetables")
                    CategoryProductListView(products: fruitProductList, category: "Fruit")
                }
                NavigationLink(destination: ProductAddScreen(tabSelection: $tabSelection), isActive: $navigateToAddProduct){}
                
            }
            .navigationBarHidden(true)
            .gesture(DragGesture()
                .onChanged({ _ in
                    UIApplication.shared.dismissKeyboard()
                })
            )
            .floatingActionButton(color: Color("LightYellow"),
                                  image: Image(systemName: "plus")
                .foregroundColor(.black)) {
                    navigateToAddProduct = true
                }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ProductMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductMainScreen(tabSelection: Binding.constant(Constants.productTab), products: Product.sampleProductsList)
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
