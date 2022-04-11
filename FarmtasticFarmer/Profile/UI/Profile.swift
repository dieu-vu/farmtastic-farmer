//
//  Profile.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 7.4.2022.
//

import SwiftUI

struct ProfileScreen: View {
    @State var showLanguageBottomSheet: Bool = false
    
    var body: some View {
        VStack {
            Color("AppBackground")
                .ignoresSafeArea()
            HeaderImage()
            Text("Name")
            actionButtonGroup
            ButtonView(buttonText: "Log out", buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen",
                       buttonAction: {})
        }.halfSheet(showSheet: $showLanguageBottomSheet) {
                LanguagePicker()
                .cornerRadius(32)
                .ignoresSafeArea()
            } onEnd: {
                print("Dismissed")
            }
    }
    
    var actionButtonGroup: some View {
        VStack {
            ActionButton(icon: "clock", title: "Order list", onClick: {})
            ActionButton(icon: "t.bubble", title: "Change language", onClick: { showLanguageBottomSheet.toggle()})
            ActionButton(icon: "pencil", title: "Update profile", onClick: {})
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
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
