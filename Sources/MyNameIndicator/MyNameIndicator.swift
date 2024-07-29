// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  MyNameIndicator.swift
//  MYNameIndicator
//
//  Created by Apple on 29/07/24.
//

import SwiftUI

public struct MYNameIndicator: View {
    
    let allFonts:[String] = ["Al Nile",
                             "Bodoni Ornaments",
                             "Savoye LET",
                             "Snell Roundhand",
                             "Noteworthy",
                             "Marker Felt", "Impact",
                             "Didot",
                             "Chalkduster",
                             "Academy Engraved LET"]
    
    @State public var text = "Loading"

    public var animateTimeInterval: Double = 0.3
    public var unstopable: Bool = true
    
    @State private var timer: Timer?
    
    @State private var fontIndex = 0
    @State private var fontName: String = ""
        
   public var body: some View {
                    
       Text(text)
           .font(.custom(fontName, size: 40))
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: animateTimeInterval, repeats: true) { _ in
                fontIndex = (fontIndex + 1) % allFonts.count
                self.fontName = allFonts[fontIndex]
                if !unstopable {
                    if validation() {
                        timer?.invalidate()
                    }
                }
            }
        }
    }
    
    private func validation() -> Bool {
        if fontIndex == 0 {
            self.fontName = "Al Nile"
            return true
        }
        return false // Initially false to start the timer
    }
}

/*
#Preview {
    
    List(content: {

        Section("Plain Style") {
            MYNameIndicator(text: "KATHIRESAN", animateTimeInterval: 0.5, unstopable: true)
        }

        Section("Customized") {
            HStack {
                Spacer(minLength: 4)
                MYNameIndicator(text: "KATHIRESAN", animateTimeInterval: 0.5, unstopable: true)
                Spacer(minLength: 4)
            }
            .padding(.vertical)
            .background(content: {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.black)
                    .stroke(.black)
                    .frame(height: 80)
            })
            .foregroundStyle(Color.white)
            .frame(height: 80)
            .padding()
        }
    })
}

*/
