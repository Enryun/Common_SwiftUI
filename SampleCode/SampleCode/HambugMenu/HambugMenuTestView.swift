//
//  HambugMenuTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 24/08/2024.
//

import SwiftUI
import CommonSwiftUI

struct HambugMenuTestView: View {
    
    @State private var showMenu: Bool = false
    
    var body: some View {
        HambugSlideMenu(showMenu: $showMenu, rotatesWhenExpand: false, enableInteraction: true, background: .primary.opacity(0.85)) { safeArea in
            MainView()
        } menuView: { safeArea in
            SideBarMenuView(safeArea)
        }
    }
    
    @ViewBuilder
    func MainView() -> some View {
        NavigationView {
            List {
                NavigationLink("Detail View") {
                    Text("Hello world")
                        .navigationTitle("Detail")
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { showMenu.toggle() } , label: {
                        Image(systemName: showMenu ? "xmark" : "line.3.horizontal")
                            .foregroundStyle(Color.primary)
                    })
                }
            }
        }
    }
    
    @ViewBuilder
    func SideBarMenuView(_ safeArea: UIEdgeInsets) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Side Menu")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
                .padding(.bottom, 10)
            
            SideBarButton(.home)
            SideBarButton(.bookmark)
            SideBarButton(.favorites)
            SideBarButton(.profile)
            
            Spacer()
            
            SideBarButton(.logout)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 20)
        .padding(.top, safeArea.top)
        .padding(.bottom, safeArea.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .environment(\.colorScheme, .dark)
    }
    
    @ViewBuilder
    func SideBarButton(_ tab: Tab, onTap: @escaping () -> () = {}) -> some View {
        Button(action: onTap, label: {
            HStack(spacing: 12) {
                Image(systemName: tab.rawValue)
                    .font(.title3)
                
                Text(tab.title)
                    .font(.callout)
                
                Spacer(minLength: 0)
            }
            .padding(.vertical, 10)
            .contentShape(.rect)
            .foregroundStyle(.white)
        })
    }
    
    // Sample Tabs
    enum Tab: String, CaseIterable {
        case home = "house.fill"
        case bookmark = "book.fill"
        case favorites = "heart.fill"
        case profile = "person.crop.circle"
        case logout = "rectangle.portrait.and.arrow.forward.fill"
        
        var title: String {
            switch self {
            case .home:
                return "Home"
            case .bookmark:
                return "Bookmark"
            case .favorites:
                return "Favorites"
            case .profile:
                return "Profile"
            case .logout:
                return "Logout"
            }
        }
    }
}

#Preview {
    HambugMenuTestView()
}







