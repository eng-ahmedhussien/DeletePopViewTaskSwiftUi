//
//  PopView.swift
//
//  Created by ahmed hussien on 10/08/2023.
//

import SwiftUI

struct DeletePopView<Content:View>:View {
    
    var closePopup: () -> Void
    @ViewBuilder var  content:Content
    var titel = ""
    var mesaage = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                //close Btn
                Button(action: {
                    closePopup()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                }
            }
            
            Text(titel)
                .font(.headline)
                .padding()
            
            Text(mesaage)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            content
            
        }
        .padding()
        .background(Color.theme.bgWhite)
        .cornerRadius(20)
    }
}
