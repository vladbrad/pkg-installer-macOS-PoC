//
//  ContentView.swift
//  Shared
//
//  Created by Vlad Brad on 2022-08-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		VStack {
			Text("Hello, world!")
				.padding()
			
			VStack (alignment: .leading) {
				HStack {
					Text("Command line arguments:")
					Spacer()
				}

				ForEach (1..<CommandLine.arguments.count, id: \.self) { index in
					Text(CommandLine.arguments[index])
						.padding(.horizontal)
				}
				
				Spacer()
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
