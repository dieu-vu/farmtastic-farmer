//
//  ProductMainScreen.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
// Screen showing all the products arranged by category

import SwiftUI
import AVFoundation

struct ProductMainScreen: View {
        
    @EnvironmentObject var productDataController: ProductDataController
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var tabSelection: Int
    
    @State var products: [ProductFetched]
    @State var searchText: String = ""
    @State private var isRecording: Bool = false
    @State var isOn: Bool = false
    @StateObject var speechRecognizer = SpeechRecognizer()
    
    @State var screenTitle = "product.allCategories"
    @State var hasBackButton = false
    @State var navigateToAddProduct: Bool = false
    
    
    // Build the view
    var body: some View {
        
        VStack {
            // View header
            ScreenLayout(screenTitle: $screenTitle, hasBackButton: $hasBackButton).padding(.bottom, 30)
            
            // Search bar with speech recognition
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
                    NavigationLink(destination: SearchResults(searchText: searchText)
                        .navigationBarBackButtonHidden(true)
                        .onAppear{
                            // call function to search product
                            print("SEARCH PHRASE", searchText)
                            productDataController.getProductBySearchPhrase(searchPhrase: searchText)
                        }
                    
                    ){
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
            
            // Products by category view
            ScrollView {
                VStack {
                    CategoryProductListView(products: productDataController.meatProductList, category: "Meat")
                    CategoryProductListView(products: productDataController.vegeProductList, category: "Vegetables")
                    CategoryProductListView(products: productDataController.fruitProductList, category: "Fruit")
                    CategoryProductListView(products: productDataController.dairyProductList, category: "Egg & Dairy")
                }
                .onAppear{
                    
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
            .onAppear{
                productDataController.loadProducts {
                    result in
                    switch result {
                    case .success(let products):
                        productDataController.allProducts = products
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
        
}

//struct ProductMainScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductMainScreen(tabSelection: Binding.constant(Constants.productTab), products: Product.sampleProductsList)
//    }
//}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
