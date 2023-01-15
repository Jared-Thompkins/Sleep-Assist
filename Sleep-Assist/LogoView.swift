//
//  ContentView.swift
//  Sleep-Assist
//
//  Created by Jared Thompkins on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack (alignment: .top) {
                Color.gray.edgesIgnoringSafeArea(.all).zIndex(-1)
                
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
}



struct ContentView2: View {
    @State private var wakeUp = Date.now
    @State private var wakeupTime: Date = Date()
    @State private var wakeupTimes = [Date]()
    
    var body: some View {
        VStack {
            DatePicker("Wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                
              
//            Button(action: {
//                let calendar = Calendar.current
//                let SixCycle = calendar.date(byAdding: .hour, value: -9, to: self.wakeupTime, wrappingComponents: false)!
//                self.wakeupTimes.append(SixCycle)
//            }) {
//                Text("Sleep Outlook")
//                    .foregroundColor(Color.black)
//            }
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 150.0, height: 30.0).zIndex(-3).foregroundColor(.white)
                NavigationLink(destination: WakeupTimeDetailView(selectedWakeupTime: $wakeupTime)) {
                    Text("Sleep Outlook")
                        .foregroundColor(Color.blue)
                }
            }
        }
    }
}


struct WakeupTimeDetailView: View {
    @Binding var selectedWakeupTime: Date
    
    var body: some View {
        ZStack  {
            VStack {
                Image("Moon").resizable().aspectRatio(contentMode: .fit)
                Text("Selected wakeup time: \(selectedWakeupTime)")
                    .multilineTextAlignment(.center)
            }
            Color.purple.edgesIgnoringSafeArea(.all).zIndex(-1)
        }
    }
}







































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
