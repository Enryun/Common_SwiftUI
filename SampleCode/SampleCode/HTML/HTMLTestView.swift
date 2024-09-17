//
//  HTMLTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 22/08/2024.
//

import SwiftUI
import CommonSwiftUI

struct HTMLTestView: View {
    let htmlString = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sample HTML</title>
    </head>
    <body>
        <h1>Welcome to SwiftUI HTML Rendering</h1>
        <p>This is an example of rendering <strong>HTML content</strong> within a <em>SwiftUI</em> application using a <code>UIViewRepresentable</code>.</p>
        
        <h2>Features:</h2>
        <ul>
            <li>Rendering of <strong>bold</strong> and <em>italic</em> text.</li>
            <li>Support for <a href="https://www.linkedin.com/in/jamesthang/">links</a>.</li>
            <li>Display of <u>underlined</u> and <s>strikethrough</s> text.</li>
            <li>Embedding of images:</li>
        </ul>
        <p><img src="https://picsum.photos/200" alt="Placeholder Image" /></p>
        <h2>Conclusion</h2>
        <p>This demonstrates the ability to <strong>customize</strong> the display of complex HTML content within a SwiftUI app.</p>
    </body>
    </html>
    """

    let htmlString2 = """
        <ul>
            <li>Rendering of <strong>bold</strong> and <em>italic</em> text.</li>
            <li>Support for <a href="https://www.linkedin.com/in/jamesthang/">links</a>.</li>
            <li>Display of <u>underlined</u> and <s>strikethrough</s> text.</li>
            <li>Embedding of images:</li>
        </ul>
"""
    
    var body: some View {
        HTMLTextView(
            content: htmlString,
            font: UIFont(name: "HelveticaNeue", size: 16) ?? UIFont.systemFont(ofSize: 16),
            textColor: .label
        )
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.2))
        .padding()
        
        HTMLTextView(content: "<h1>James Thang</h1>")
    }
}

#Preview {
    HTMLTestView()
}

