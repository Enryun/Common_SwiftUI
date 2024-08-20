//
//  TypeWriterTextView.swift
//  TestCommonUI
//
//  Created by James Thang on 30/05/2024.
//

import SwiftUI
import CommonSwiftUI

struct TypeWriterTextView: View {
    var body: some View {
        VStack(spacing: 16){
            TypeWriterText(text: "James Thang", font: .title, fontWeight: .regular)

            TypeWriterText(text: "iOS Developer | Author | Builder | Writer | Dreamer", font: .title2)

            TypeWriterText(text: "My journey through the tech world is a testament to the idea that anyone can follow their passion and acquire new skills. While my educational background lies in Finance and Economics, I felt a compelling drive to explore the dynamic realm of Apps development. The potentials of it that anyone in this modern world now have a smartphone with them and spend most of their daily time on it. With dedication and self-education, I transitioned into a seasoned iOS developer and then a professional one, accumulating over 3 years of valuable industry experience.", speed: .flash)
        }
    }
}

#Preview {
    TypeWriterTextView()
}

