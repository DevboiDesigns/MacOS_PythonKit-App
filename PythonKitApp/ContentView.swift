//
//  ContentView.swift
//  PythonKitApp
//
//  Created by Christopher Hicks on 7/7/22.
//

import SwiftUI
import AVKit
import PythonKit

struct ContentView: View {
    
    let dirPath: String = "/Users/omboi/Xcode/PythonKitApp/"
    let sys = Python.import("sys")
    
    @State private var result: String = ""
    
    @State private var txt: String = ""
    @State private var videoPath: String? = ""
    
    @State private var swapA: Int = 2
    @State private var swapB: Int = 3
    
   
    
    var body: some View {
        VStack {
            
            TextField("Enter the video link", text: $txt)
            
            Button {
                self.downloadVideo(link: self.txt)
            } label: {
                Text("Download Video")
            }
            
            if let videoPath = videoPath {
                let url = URL(fileURLWithPath: dirPath + videoPath)
                VideoPlayer(player: AVPlayer(url: url))
            }

            
            
            HStack(alignment: .top) {
                VStack {
                    Button {
                        self.runPythonCode()
                    } label: {
                        Text("Run Python Script")
                    }
                    
                    Text("\(result)")
                }
                
                VStack {
                    Button {
                        self.swapNumbersInPython()
                    } label: {
                        Text("Swap Numbers")
                    }
                    
                    HStack {
                        Text("\(swapA)")
                        
                        Text("\(swapB)")
                    }
                    
                }
                
                
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity + 20)
        .onAppear {
            sys.path.append(dirPath)
            
        }
    }
    
    func downloadVideo(link: String) {
        let example = Python.import("sample")
        
        let response = example.downloadVideo(link, dirPath)
        videoPath = String(response)
    }
    
    func swapNumbersInPython() {
        let example = Python.import("sample")
        let response = example.swap(swapA, swapB)
        let arr: [Int] = Array(response) ?? []
        swapA = arr[0]
        swapB = arr[1]
    }
    
    func runPythonCode() {
        let example = Python.import("sample")
        result = String(example.hello()) ?? ""
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
