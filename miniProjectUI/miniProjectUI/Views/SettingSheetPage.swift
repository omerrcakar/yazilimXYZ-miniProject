//
//  SettingSheetPage.swift
//  miniProjectUI
//
//  Created by ÖMER  on 21.08.2024.
//

import SwiftUI

struct SettingSheetPage: View {
    // MARK: - PROPERTIES
    private let alternateAppIcons: [String] = [
        "plants-1",
        "plants-2",
        "plants-3"
    ]
    
    
    var body: some View {
        
        // MARK: - SECTION: HEADER
        
        List{
            Section{
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 70, weight: .black))
                    Text("Plant")
                        .font(.system(size: 56, weight: .black))
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 70, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 8){
                    Text("Identify any plant with your phone.")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("Identify plant, trees, shrubs and more! Identify plant diseases. Care and treatment tips.")
                        .font(.footnote)
                        .italic()
                    Text("It's time for a plant.")
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                
                
            }//: HEADER
            .listRowSeparator(.hidden)
            
            
            // MARK: - SECTION: ICONS
            
            Section(header: Text("Alternate Icons")){
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button{
                                // ICON SELECTED
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){ error in
                                    if error != nil{
                                        print("Failed : \(String(describing: error?.localizedDescription))")
                                    }else{
                                        print("Success!")
                                    }
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        .buttonStyle(.bordered)
                        }
                    }
                }//: SCROLL VIEW
                .padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }
            .listRowSeparator(.hidden)
            
            
            
            // MARK: - SECTION: ABOUT
            
            Section(
                header: Text("About The App"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ){
                // Labeled Content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Plant.", rowTintColor: .colorGreenDark)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "İOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "SwiftUI", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Ömer Çakar", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Github", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Github", rowLinkDestination: "https://github.com/omerrcakar")
                
                
            }//: SECTION
        }//: LIST
        
        
        
        
        
    }
}

#Preview {
    SettingSheetPage()
}
