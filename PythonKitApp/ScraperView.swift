//
//  ScraperView.swift
//  PythonKitApp
//
//  Created by Christopher Hicks on 7/7/22.
//

import SwiftUI
import PythonKit

struct ScraperView: View {
    
    let dirPath: String = "/Users/omboi/Xcode/PythonKitApp/"
    let sys = Python.import("sys")
    
    @State private var websiteUrl: String = ""
    
    
    var body: some View {
        VStack {
            
            TextField("Website", text: $websiteUrl)
                .padding()
                .cornerRadius(12)
            
            
            Button {
                self.getHtml()
            } label: {
                Text("Grab html")
                //                    .font(.title)
                //                    .padding(.horizontal, 16)
                //                    .padding(.vertical, 8)
                //                    .foregroundColor(.white)
                //                    .background(Color.gray)
                //                    .cornerRadius(12)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity + 20)
        .onAppear {
            sys.path.append(dirPath)
            
        }
    }
    
    func getHtml() {
        let scraperScript = Python.import("scraper")
        scraperScript.getHtml(websiteUrl)
    }
}

//struct ScraperView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScraperView()
//    }
//}
