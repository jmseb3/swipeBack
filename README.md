# SwipeBack For Swiftui
swipeBack in swiftui

# Installation (SPM)
1. Go to File > Swift Packages > Add package dependency
2. Add it by pasting this link `https://github.com/jmseb3/swipeBack.git`
3. Select the Version you want to add, the Branch or even the single Commit

# How To Use

## import
~~~swift
import SwipeBack
~~~

## add Modifider
~~~swift

import SwiftUI
import SwipeBack

struct ContentView: View {
    @State var text = "Hello, world!"
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(text)
            Button("retry") {
                text = "Hello, world!"
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .modifier(
            SwipeBack(
                option: SwipeBackOption(
                    maxMove: 40,
                    maxMoveY: 7,
                    confirmAction: {
                        text = "back action confirm"
        })))
    }
}
~~~

# Preview
![preview](https://github.com/user-attachments/assets/9ef77448-8e54-4fff-aee7-a24696144447)
