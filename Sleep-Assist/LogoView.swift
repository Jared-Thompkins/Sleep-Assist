import SwiftUI
import Foundation


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
    @State var wakeUp = Date()

    
    var body: some View {
        VStack {
            DatePicker("Wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .padding([.leading, .trailing], 40.0)
                .padding([.top, .bottom], 15.0)
              
            Text("\(hoursRemainingToWakeup(from: wakeUp).hours) hours and \(hoursRemainingToWakeup(from: wakeUp).minutes) minutes until it is time to wakeup.")
    

            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 150.0, height: 30.0).zIndex(-3).foregroundColor(.white)
                NavigationLink(destination: WakeupTimeDetailView(selectedWakeupTime: $wakeUp)) {
                    Text("Sleep Outlook")
                        .foregroundColor(Color.blue)
                }
            }
        }
    }
    func hoursRemainingToWakeup(from selectedDate: Date) -> (hours: Int, minutes: Int) {
        let currentDate = Date()
        let timeInterval = selectedDate.timeIntervalSince(currentDate)
        let hours = Int(timeInterval / 3600)
        let minutes = Int((timeInterval.truncatingRemainder(dividingBy: 3600)) / 60)
        return (hours, minutes)
    }
    
}


struct WakeupTimeDetailView: View {
    @Binding var selectedWakeupTime: Date
    
    var body: some View {
        ZStack  {
            VStack {
                DatePicker("Rise & Shine", selection: $selectedWakeupTime, displayedComponents: .hourAndMinute)
                    .padding(40.0)
            
                // Future For loop below.
                Text("For 6 sleep cycles, fall asleep at: \(WakeupTimeDetailView.timeRemainingToCycle(tomorrowWakeTime: selectedWakeupTime))")
                Text("For 5 sleep cycles, fall asleep at: ")
                Text("For 4 sleep cycles, fall asleep at: ")
                
                Spacer()
                Image("Moon").resizable().aspectRatio(contentMode: .fit)
                

            }
            Color.purple.edgesIgnoringSafeArea(.all).zIndex(-1)
        }
    }
    static func timeRemainingToCycle(tomorrowWakeTime: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let tomorrowWakeTimeDt = dateFormatter.string(from: tomorrowWakeTime)
        let tomorrowWakeTimeDate = dateFormatter.date(from:tomorrowWakeTimeDt)
        let bedtimeDT = Calendar.current.date(byAdding: .hour, value: -9, to: tomorrowWakeTimeDate!)
        dateFormatter.dateFormat = "h:mm a"
        let sleepTime = dateFormatter.string(from: bedtimeDT!)
        
        return sleepTime
        }
    }








































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
