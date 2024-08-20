//
//  ExpandFloatButtonTest.swift
//  TestCommonUI
//
//  Created by James Thang on 26/06/2024.
//

import SwiftUI
import CommonSwiftUI

struct ExpandFloatButtonTest: View {
    
    let actions: [FloatingAction] = [
        FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .red) {
            print("Tray")
        },
        FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .orange) {
            print("Spark")
        },
        FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .yellow) {
            print("Share")
        },
        FloatingAction(image: Image(systemName: "heart.fill"), tint: .green) {
            print("Heart")
        },
        FloatingAction(image: Image(systemName: "paperplane"), tint: .cyan) {
            print("Plane")
        }
    ]
    
    var body: some View {
        VStack {
            HStack {
                ExpandFloatButton(alignment: .top, actions: actions) { isExpanded in
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.black, in: .circle)
                }
                
                Spacer()
            }
            
            ExpandFloatButton(alignment: .leading, actions: actions, shape: .rect(cornerRadius: 8)) { isExpanded in
                Image(systemName: "plus")
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black, in: .rect(cornerRadius: 8))
            }
            
            ExpandFloatButton(alignment: .trailing, actions: actions) { isExpanded in
                Image(systemName: "plus")
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black, in: .circle)
            }
            
            HStack {
                Spacer()
                
                ExpandFloatButton(alignment: .bottom, actions: actions) { isExpanded in
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.black, in: .circle)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ExpandFloatButtonTest()
}

