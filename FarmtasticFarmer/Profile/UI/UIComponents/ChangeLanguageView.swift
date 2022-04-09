//
//  ChangeLanguageView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 6.4.2022.
//

import SwiftUI

struct ChangeLanguageView: View {
    var body: some View {
        Profile(chosenLanguage: .constant(.english))
    }
}

struct ChangeLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLanguageView()
    }
}

struct Profile: View {
    @Binding var chosenLanguage: Language
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Update profile")
                }
                LanguagePicker(selectedLanguage: $chosenLanguage)
            }
            .navigationTitle("Profile")
            .halfSheet(showSheet: $showSheet) {
                ZStack {
                    Color.white
                    VStack{
                        FormView(formTitle: "Update profile")
                        ButtonView(buttonText: "Apply", buttonAction: { showSheet.toggle() })
                    }
                }
                .cornerRadius(32)
                .ignoresSafeArea()
            } onEnd: {
                print("Dismissed")
            }
        }
    }
}

extension View {
    
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping () -> SheetView, onEnd: @escaping () -> ()) -> some View {
        
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet, onEnd: onEnd)
            )
    }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    
    var sheetView: SheetView
    @Binding var showSheet: Bool
    var onEnd: () -> ()
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
        if showSheet {
            
            let sheetController = CustomHostingController(rootView: sheetView)
            sheetController.presentationController?.delegate = context.coordinator
            uiViewController.present(sheetController, animated: true)
        } else {
            uiViewController.dismiss(animated: true )
        }
    }
    
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        
        var parent: HalfSheetHelper
        
        init(parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.showSheet = false
            parent.onEnd()
        }
    }
}

class CustomHostingController<Content: View>: UIHostingController<Content> {
    
    override func viewDidLoad() {
        
        view.backgroundColor = .clear
        
        if let presentationController = presentationController as? UISheetPresentationController {
            
            presentationController.detents = [
                .medium()
            ]
        }
    }
}
