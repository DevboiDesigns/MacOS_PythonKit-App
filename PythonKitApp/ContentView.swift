//
//  ContentView.swift
//  PythonKitApp
//
//  Created by Christopher Hicks on 7/7/22.
//

import SwiftUI
import PythonKit

struct ContentView: View {
    
    let dirPath: String = "/Users/omboi/Xcode/PythonKitApp/"
    @State private var result: String = ""
    
    @State private var swapA: Int = 2
    @State private var swapB: Int = 3
    
    let sys = Python.import("sys")
    
    var body: some View {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity + 20)
        .onAppear {
            sys.path.append(dirPath)
        
        }
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
