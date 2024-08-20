//
//  DropDownTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 30/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct DropDownTestView: View {
    
    enum DropDownOptions: String, CaseIterable {
        case north = "North"
        case south = "South"
        case east = "East"
        case west = "West"
    }
    
    @State private var selectedOption: DropDownOptions = .east
    @State private var selectedOption2: DropDownOptions = .east

    private var options: [String] = ["Option 1", "Option 2", "Option 3", "Option 4"]
    @State private var selectedOption3: String = "Option 1"
    @State private var selectedOption4: String = "Option 1"
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                DropDown(options: DropDownOptions.allCases, selection: $selectedOption) { item, isSelected, isPlaceHolderShow, isExpand in
                    Text(item.rawValue)
                        .foregroundStyle(.black)
                        .font(.title3)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .background {
                            Rectangle()
                                .fill(isSelected && !isPlaceHolderShow ? .clear : .gray.opacity(0.5))
                        }
                } placeHolder: { isExpand in
                    HStack {
                        Text("Select the Direction")
                            .foregroundStyle(.primary)
                            .font(.title3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .rotationEffect(isExpand ? .degrees(90) : .zero)
                    }
                }
                
                DropDown(options: options, selection: $selectedOption3) { item, isSelected, isPlaceHolderShow, isExpand in
                    Text(item)
                        .foregroundStyle(isSelected ? .black : .white)
                        .font(.title3)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .background {
                            Rectangle()
                                .fill(isSelected ? .green : .gray)
                        }
                }

                DropDown(options: options, selection: $selectedOption4, rowHeight: 68) { item, isSelected, isPlaceHolderShow, isExpand in
                    Text(item)
                        .foregroundStyle(.black)
                        .font(.title3)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(isSelected ? .green : .gray, lineWidth: 2)
                                .padding(2)
                        }
                        .padding(.top, 8)
                }

                DropDown(options: DropDownOptions.allCases, selection: $selectedOption, rowHeight: 60) { item, isSelected, isPlaceHolderShow, isExpand in
                    Text(item.rawValue)
                        .foregroundStyle(isSelected && !isPlaceHolderShow ? .blue : .gray)
                        .font(.title3)
                } placeHolder: {_ in
                    Text("Select an option")
                        .foregroundStyle(.gray)
                        .font(.title3)
                }

                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    DropDownTestView()
}



