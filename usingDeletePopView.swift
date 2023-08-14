
import SwiftUI

struct usingDeletePopView: View {
    
    @State private var isShowingPopup = false
    
    init(userProfileVM :UserProfileVM,imagePickerManger :ImagePickerManger ) {
        _userProfileVM = StateObject(wrappedValue: userProfileVM)
        _imagePickerManger = StateObject(wrappedValue: imagePickerManger)
    }
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Btn_deleteAccount
                }
            }
            if isShowingPopup{
                deletePopView
            }

        }
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
    }
}


extension PersonalInfoView{
    
    var Btn_deleteAccount :some View{
        AppButton(state: .constant(.normal), style: .plain) {
            isShowingPopup = true
        } builder: {
            Text("Delete account")
                .appFont(.body)
                .foregroundColor(.gray)
        }
    }
    
    var deletePopView : some View{
        ZStack{
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isShowingPopup = false
                }
            DeletePopView(
                closePopup: {isShowingPopup = false},
                content: {
                    AppTextField(data: $userProfileVM.TF_Password, placeholderText: "Password*".localized(),isSecure: true, validation: .password)
                        .padding()
                    
                    AppButton(state: $userProfileVM.changePassword_State, style: .stroke(primaryColor: .red)) {
                        userProfileVM.deleteAccount(password: userProfileVM.TF_Password.text)
                        isShowingPopup = false
                    } builder: {
                        Text("Delete account")
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.5)
                    .padding()
                },
                titel: "Delete account".localized(),
                mesaage: "By clicking delete account you will missing all data related to you, you cannot use ARBAHi or Qitaf points as payment methods. To use these features.To continue, please enter your password".localized())
            .padding()
            .frame(width: UIScreen.main.bounds.width)
        }
    }
    
}





