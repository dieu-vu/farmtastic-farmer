//
//  Profile.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 7.4.2022.
//  Ui for Profile screen, handling different actions and forms for user.
// - User information displayed on the top
// - See active orders (JSON data)
// - See pickup points list
// - Change app language on fly
// - Update user info
// - change account password

import SwiftUI

struct ProfileScreen: View {
    @State var showLanguageBottomSheet: Bool = false
    @State var showUpdateProfile: Bool = false
    @State var showChangePassword: Bool = false
    @EnvironmentObject var authentication: AuthenticationController
    @EnvironmentObject var userController: UserDataController
    @State private var presentAlert = false
    @State var navigateToOrder = false
    @State var navigateToPickup = false
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: []) var loggedInUser: FetchedResults<UserFetched>
    
    //make the navigation bar transparent
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()

        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        ScrollView {
            HeaderImage(currentUser: $userController.currentUser)
            UserInfoCardView(currentUser: $userController.currentUser)
            actionButtonGroup
            ButtonView(buttonText: Translation().LogoutButton, buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen",
                       buttonAction: {authentication.logout()})
            Spacer()
        }.edgesIgnoringSafeArea(.top)
            .halfSheet(showSheet: $showLanguageBottomSheet) {
                LanguagePicker(showLanguageBottomSheet: $showLanguageBottomSheet)
                    .cornerRadius(32).ignoresSafeArea()
            } onEnd: {
                print("Dismissed")
            }
            .halfSheet(showSheet: $showUpdateProfile) {
                UpdateProfileView(showUpdateProfile: $showUpdateProfile)
                    .cornerRadius(32)
                    .ignoresSafeArea()
                // Inject Managed Object context to the sub view
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(userController)
                    .onDisappear{
                        refetchUser()
                    }
                
            } onEnd: {
                print("Dismissed")
            }
            .halfSheet(showSheet: $showChangePassword) {
                ChangePasswordView(showChangePassword: $showChangePassword).cornerRadius(32).ignoresSafeArea()
            } onEnd: {
                print("Dismissed")
            }
    }
    
    
    // Actions buttons to handle different forms
    var actionButtonGroup: some View {
        VStack {
            NavigationLink(destination: ActiveOrderScreen(), isActive: $navigateToOrder) {
                //using Translation(translatedLanguage: language) triggers changing language immediately
                ActionButton(icon: "clock", title: Translation(translatedLanguage: language).OrderList, onClick: {
                    self.navigateToOrder = true
                })
            }
            NavigationLink(destination: PickupPointScreen(), isActive: $navigateToPickup) {
                ActionButton(icon: "clock", title: Translation().PickupList, onClick: {
                    self.navigateToPickup = true
                })
            }
            ActionButton(icon: "t.bubble", title: Translation().ChangeLanguage, onClick: { showLanguageBottomSheet.toggle()})
            ActionButton(icon: "pencil", title: Translation().ProfileUpdate, onClick: { showUpdateProfile.toggle() })
            ActionButton(icon: "person.circle", title: Translation().ProfileChangePassword, onClick: { showChangePassword.toggle() })
        }
    }
    
    // Fetch user data again
    func refetchUser() {
        userController.fetchUser{
            result in
            switch result {
            case .success(let user):
                userController.currentUser = user
            case .failure(let error):
                print(error.localizedDescription)
            }
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
