//
//  Profile.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 7.4.2022.
//

import SwiftUI

struct ProfileScreen: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    @State var showLanguageBottomSheet: Bool = false
    @State var showUpdateProfile: Bool = false
    @State var showChangePassword: Bool = false
    @EnvironmentObject var authentication: AuthenticationController
    @ObservedObject var userController = UserDataController()

    
    var body: some View {
        ScrollView {
            Color("AppBackground")
            HeaderImage()
            UserInfoCardView(currentUser: $userController.currentUser)
            actionButtonGroup
            ButtonView(buttonText: "Log out", buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen",
                       buttonAction: {authentication.logout()})
            Spacer()
        }.edgesIgnoringSafeArea(.top).halfSheet(showSheet: $showLanguageBottomSheet) {
            LanguagePicker(showLanguageBottomSheet: $showLanguageBottomSheet)
                .cornerRadius(32).ignoresSafeArea()
        } onEnd: {
            print("Dismissed")
        }
        .halfSheet(showSheet: $showUpdateProfile) {
            UpdateProfileView(showUpdateProfile: $showUpdateProfile).cornerRadius(32).ignoresSafeArea()
        } onEnd: {
            print("Dismissed")
        }
        .halfSheet(showSheet: $showChangePassword) {
            ChangePasswordView(showChangePassword: $showChangePassword).cornerRadius(32).ignoresSafeArea()
        } onEnd: {
            print("Dismissed")
        }
        .onAppear{
            userController.fetchUser{
                result in
                switch result {
                case .success(let user):
                    userController.currentUser = user
                case .failure(let error):
                    print("ERROR \(error)")
                    fatalError(error.localizedDescription)
                    
                }
            }
            print("LOGGED IN USER: \($userController.currentUser)")
        }
    }
    
    var actionButtonGroup: some View {
        VStack {
            ActionButton(icon: "clock", title: "profile.orderList".localized(language: language), onClick: {})
            ActionButton(icon: "t.bubble", title: "profile.changeLanguage".localized(language: language), onClick: { showLanguageBottomSheet.toggle()})
            ActionButton(icon: "pencil", title: "profile.update".localized(language: language), onClick: { showUpdateProfile.toggle() })
            ActionButton(icon: "person.circle", title: "profile.changePassword".localized(language: language), onClick: { showChangePassword.toggle() })
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
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
