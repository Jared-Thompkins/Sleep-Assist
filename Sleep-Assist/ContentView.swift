//
//  ContentView.swift
//  Sleep-Assist
//
//  Created by Jared Thompkins on 1/5/23.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("SleepAssist")
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                    .padding(25)
                ContentView2()
            }
        }
    }
}



struct ContentView2: View {
    @State private var wakeUp = Date.now
    @State private var wakeupTime = Date()
    @State private var wakeupTimes = [Date]()
    
    var body: some View {
        VStack {
            DatePicker("Wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
            
            Button(action: {
                self.wakeupTimes.append(self.wakeupTime)
            }) {
                Text("Sleep Outlook")
            }
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
