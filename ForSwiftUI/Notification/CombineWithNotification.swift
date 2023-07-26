//
//  CombineWithNotification.swift
//  ForSwiftUI
//
//  Created by Kevin on 2023/7/25.
//

import SwiftUI
import Combine

// Combine with notification and timer

var subscriptions = Set<AnyCancellable>()

struct CombineWithNotification: View {
    
    @State private var inputText: String = ""
    @State private var recevieText: String = "recevieText"

    
    @State private var alignmentProp: HorizontalAlignment = .center
    
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @State private var countdownTiming: Int = 60
    
    var body: some View {
        VStack () {
            VStack(alignment: alignmentProp) {
                HStack {
                    TextField("输入关键字", text: $inputText)
                    Button("Post") {
                        let newEvent = Event(title: inputText, scheduleOn: Date())
                        NotificationCenter.default.post(name: .newEvent, object: newEvent)
                    }
                }
                HStack {
                    Text("收到的信息在这里: ")
                    Text(recevieText)
                        .onReceive(NotificationCenter.Publisher(center: .default, name: .newEvent)) { object in
                            if let aEvent = object.object as? Event {
                                recevieText = aEvent.title
                            } else {
                                recevieText = "recevieText2"
                            }
                        }
                }.padding(.top, 20)
                
                HStack {
                    Text("倒计时在这里: ")
                    Text(String(countdownTiming))
                        .onReceive(timer) { time in
                            if countdownTiming > 0 {
                                countdownTiming -= 1
                            } else {
                                countdownTiming = 60
                            }
                        }
                }.padding(.top, 20)
                
                
                Spacer()
                    .frame(height: 40.0)
                Capsule()
                    .fill(.blue)
                    .frame(width: UIScreen.main.bounds.width*0.5, height: 50.0)
                Capsule()
                    .fill(.orange)
                    .frame(height: 50.0)
                Capsule()
                    .fill(.red)
                    .frame(width: 120, height: 50)
            }
            
            Spacer()
                .frame(height: 20.0)
            
            HStack(spacing: 20.0) {
                Button("Leading") {
                    alignmentProp = .leading
                }
                Button("Center") {
                    alignmentProp = .center
                }
                Button("Trailing") {
                    alignmentProp = .trailing
                }
            }
            
            Spacer()
        }
//        .border(Color.red)
        .padding()

    }
}

struct CombineWithNotification_Previews: PreviewProvider {
    static var previews: some View {
        CombineWithNotification()
    }
}

extension Notification.Name {
    static let newEvent = Notification.Name("new_event")
    
}

struct Event {
    let title: String
    let scheduleOn: Date
}


