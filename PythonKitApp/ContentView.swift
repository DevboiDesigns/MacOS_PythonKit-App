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
    
    var body: some View {
        VStack {
            Text("Hello World")
                .padding()
        }
        .onAppear {
            print(Python.version)
            runPythonCode()
        }
    }
    
    func runPythonCode() {
        let sys = Python.import("sys")
        sys.path.append(dirPath)
        let example = Python.import("sample")
        let result = example.hello()
        print(result)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
