//
//  SegmentControlTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 31/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct SegmentControlTestView: View {
    
    enum SegmentedTab: String, CaseIterable {
       case home = "Home"
       case favorite = "Love"
       case profile = "Profile"

       var imageName: String {
           switch self {
           case .home:
               return "house.fill"
          case .favorite:
               return "heart.fill"
           case .profile:
               return "person.crop.circle"
           }
       }
    }
    
    @State private var activeTab: SegmentedTab = .home
    @State private var activeTab2: SegmentedTab = .home
    @State private var activeTab3: SegmentedTab = .home
    
    var body: some View {
        VStack(spacing: 25) {
            
            SegmentControl(tabs: SegmentedTab.allCases, activeTab: $activeTab, height: 40, activeTint: .primary, inActiveTint: .gray.opacity(0.5), indicatorConfiguration: .init(tint: .blue, cornerRadius: 0, style: .bottom)) { item in
                HStack {
                    Image(systemName: item.imageName)
                    Text(item.rawValue)
                }
                .font(.title3)
            }
            
            SegmentControl(tabs: SegmentedTab.allCases, activeTab: $activeTab2, height: 40, activeTint: .primary, inActiveTint: .gray.opacity(0.5), indicatorConfiguration: .init(tint: .orange, cornerRadius: 4, style: .background)) { item in
                HStack {
                    Image(systemName: item.imageName)
                    
                    Text(item.rawValue)
                }
                .font(.title3)
            }
            
            SegmentControl(tabs: SegmentedTab.allCases, activeTab: $activeTab3, height: 40, activeTint: .primary, inActiveTint: .gray.opacity(0.5), indicatorConfiguration: .init(tint: .yellow, cornerRadius: 20, style: .background)) { item in
                HStack {
                    Image(systemName: item.imageName)
                    
                    Text(item.rawValue)
                }
                .font(.title3)
            }
        }
        .padding()
    }
}

#Preview {
    SegmentControlTestView()
}

//@State private var selectedSegment = 0
//
//Picker("Options", selection: $selectedSegment) {
//    Text("First")
//        .tag(0)
//    Text("Second")
//        .tag(1)
//    Text("Third")
//        .tag(2)
//}
//.pickerStyle(SegmentedPickerStyle())

//MARK: - Picker Style
// DefaultPickerStyle()
// SegmentedPickerStyle()
// WheelPickerStyle()
// MenuPickerStyle()

