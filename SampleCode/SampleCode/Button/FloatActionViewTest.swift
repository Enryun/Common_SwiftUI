//
//  FloatActionViewTest.swift
//  TestCommonUI
//
//  Created by James Thang on 02/06/2024.
//

import SwiftUI
import CommonSwiftUI

struct FloatActionViewTest: View {
    
    private let actions = [
        FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .red, background: .white) {
            print("Tray")
        },
        FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .red, background: .white) {
            print("Spark")
        },
        FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .red, background: .white) {
            print("Share")
        }
    ]

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 15) {
                ForEach(0...7, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.gray.opacity(0.3))
                        .frame(height: 200)
                }
            }
            .padding(15)
        }
        .overlay(alignment: .topLeading) {
            ArcFloatingButton(alignment: .topLeading, actions: actions) { isExpanded in
                Image(systemName: "plus")
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                    .scaleEffect(1.02)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black, in: .circle)
                    // Scaling Effect when expanded
                    .scaleEffect(isExpanded ? 0.9 : 1)
            }
            .padding()
        }
        .overlay(alignment: .topTrailing) {
            ArcFloatingButton(alignment: .topTrailing, actions: actions) { isExpanded in
                Image(systemName: "plus")
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                    .scaleEffect(1.02)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black, in: .circle)
                    // Scaling Effect when expanded
                    .scaleEffect(isExpanded ? 0.9 : 1)
            }
            .padding()
        }
        .overlay(alignment: .bottomLeading) {
            ArcFloatingButton(alignment: .bottomLeading, actions: actions) { isExpanded in
                Image(systemName: "plus")
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                    .scaleEffect(1.02)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black, in: .circle)
                    // Scaling Effect when expanded
                    .scaleEffect(isExpanded ? 0.9 : 1)
            }
            .padding()
        }
        .overlay(alignment: .bottomTrailing) {
            ArcFloatingButton(alignment: .bottomTrailing, actions: actions) { isExpanded in
                Image(systemName: "plus")
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                    .scaleEffect(1.02)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black, in: .circle)
                    // Scaling Effect when expanded
                    .scaleEffect(isExpanded ? 0.9 : 1)
            }
            .padding()
        }
        .overlay(alignment: .center) {
            VStack {
                ArcFloatingButton(alignment: .halfmoonTop) {
                    FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .teal) {
                        print("Tray")
                    }
                    
                    FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .teal) {
                        print("Spark")
                    }
                    
                    FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .teal) {
                        print("Share")
                    }
                    
                    FloatingAction(image: Image(systemName: "heart.fill"), tint: .teal) {
                        print("Heart")
                    }
                    
                    FloatingAction(image: Image(systemName: "house.fill"), tint: .teal) {
                        print("Heart")
                    }
                } label: { isExpanded in
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                        .scaleEffect(1.02)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.black, in: .circle)
                        // Scaling Effect when expanded
                        .scaleEffect(isExpanded ? 0.9 : 1)
                }
                .padding(30)

                ArcFloatingButton(alignment: .halfmoonBottom) {
                    FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .orange) {
                        print("Tray")
                    }
                    
                    FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .orange) {
                        print("Spark")
                    }
                    
                    FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .orange) {
                        print("Share")
                    }
                    
                    FloatingAction(image: Image(systemName: "heart.fill"), tint: .orange) {
                        print("Heart")
                    }
                    
                    FloatingAction(image: Image(systemName: "house.fill"), tint: .orange) {
                        print("Heart")
                    }
                } label: { isExpanded in
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                        .scaleEffect(1.02)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.black, in: .circle)
                        // Scaling Effect when expanded
                        .scaleEffect(isExpanded ? 0.9 : 1)
                }
                .padding(30)
            }
        }
        .overlay(alignment: .center) {
            HStack {
                ArcFloatingButton(alignment: .halfmoonLeading) {
                    FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .yellow) {
                        print("Tray")
                    }
                    
                    FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .yellow) {
                        print("Spark")
                    }
                    
                    FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .yellow) {
                        print("Share")
                    }
                    
                    FloatingAction(image: Image(systemName: "heart.fill"), tint: .yellow) {
                        print("Heart")
                    }
                    
                    FloatingAction(image: Image(systemName: "house.fill"), tint: .yellow) {
                        print("Heart")
                    }
                } label: { isExpanded in
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                        .scaleEffect(1.02)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.black, in: .circle)
                        // Scaling Effect when expanded
                        .scaleEffect(isExpanded ? 0.9 : 1)
                }
                .padding(30)
                
                ArcFloatingButton(alignment: .halfmoonTrailing) {
                    FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .green) {
                        print("Tray")
                    }
                    
                    FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .green) {
                        print("Spark")
                    }
                    
                    FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .green) {
                        print("Share")
                    }
                    
                    FloatingAction(image: Image(systemName: "heart.fill"), tint: .green) {
                        print("Heart")
                    }
                    
                    FloatingAction(image: Image(systemName: "house.fill"), tint: .green) {
                        print("Heart")
                    }
                } label: { isExpanded in
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                        .scaleEffect(1.02)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.black, in: .circle)
                        // Scaling Effect when expanded
                        .scaleEffect(isExpanded ? 0.9 : 1)
                }
                .padding(30)
            }
        }
        .overlay(alignment: .center) {
            ArcFloatingButton(alignment: .fullmoon) {
                FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .red) {
                    print("Tray")
                }
                
                FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .orange) {
                    print("Spark")
                }
                
                FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .yellow) {
                    print("Share")
                }
                
                FloatingAction(image: Image(systemName: "heart.fill"), tint: .green) {
                    print("Heart")
                }
                
                FloatingAction(image: Image(systemName: "house.fill"), tint: .blue) {
                    print("Heart")
                }
                
                FloatingAction(image: Image(systemName: "paperplane"), tint: .cyan) {
                    print("Heart")
                }
            } label: { isExpanded in
                Image(systemName: "plus")
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                    .scaleEffect(1.02)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black, in: .circle)
                    // Scaling Effect when expanded
                    .scaleEffect(isExpanded ? 0.9 : 1)
            }
            .offset(y: -250)
        }
    }
    
}

#Preview {
    FloatActionViewTest()
}


