//
//  CustomListRowView.swift
//  miniProjectUI
//
//  Created by ÖMER  on 21.08.2024.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: PROPERTIES
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    var body: some View {
        LabeledContent{
            if rowContent != nil{
                Text(rowContent!)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
            }else if (rowLinkLabel != nil && rowLinkDestination != nil){
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundStyle(.pink)
                    .fontWeight(.heavy)
            }else{
                EmptyView()
            }
            
        }label: {
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Application",
            rowIcon: "apps.iphone",
            rowContent: "Plant",
            rowTintColor: .colorGreenDark,
            rowLinkLabel: "Github",
            rowLinkDestination: "https://github.com/omerrcakar"
        )
    }
}
