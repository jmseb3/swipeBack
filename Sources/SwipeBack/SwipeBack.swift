import SwiftUI

struct SwipeBack : ViewModifier {
    let option :SwipeBackOption
    let iconOption :SwipeBackIconOption
    
    public init(option: SwipeBackOption, iconOption: SwipeBackIconOption) {
        self.option = option
        self.iconOption = iconOption
        print("init option : \(option)")
        print("init iconOption : \(iconOption)")
    }
    
    public init(option: SwipeBackOption) {
        self.init(option: option, iconOption: SwipeBackIconOption())
    }

    //check Is Drag
    @State private var isOnDrag = false
    //Offset for Button X
    @State private var buttonOffestX : CGFloat = 0
    //Offset for Button Y
    @State private var buttonOffestY : CGFloat = 0
    //Offset for Button Additinal Y
    @State private var buttonOffestYAdd : CGFloat = 0
    //check Impact
    @State private var ignoreImpact :Bool = false
    
    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            Color.white
                .zIndex(0)
            
            content
                .zIndex(1)
            
            if(isOnDrag) {
                HStack(alignment: .center){
                    ZStack{
                        Circle()
                            .fill(Color(hex: 0xF8F8F8))
                            .frame(width: iconOption.circeSize,height: iconOption.circeSize)
                        Image(systemName: iconOption.systemImage)
                            .frame(width: iconOption.iconSize,height: iconOption.iconSize)
                    }
                    .frame(width: iconOption.circeSize,height: iconOption.circeSize,alignment: .top)
                    Spacer()
                }
                .offset(x: min(buttonOffestX,option.maxMove),y:buttonOffestY + buttonOffestYAdd)
                .zIndex(999)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gesture(
            DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                .onChanged{ value in
                    if (value.startLocation.x < 30) {
                        isOnDrag = true
                        buttonOffestY = value.startLocation.y
                        withAnimation {
                            buttonOffestX = value.location.x
                            let new = value.location.y - buttonOffestY
                            if(new > option.maxMove) {
                                buttonOffestYAdd = option.maxMoveY
                            } else if( new < -option.maxMoveY) {
                                buttonOffestYAdd = -option.maxMoveY
                            } else {
                                buttonOffestYAdd = new
                            }
                        }
                        if(buttonOffestX > option.maxMove) {
                            if(ignoreImpact) {
                                return
                            }
                            self.ignoreImpact = true
                            HapticManager.shared.hapticImpact(style: .rigid)
                        } else {
                            self.ignoreImpact = false
                        }
                    }
                }
                .onEnded { value in
                    if (value.startLocation.x < 30 && buttonOffestX > option.maxMove) {
                        option.confirmAction()
                    }
                    isOnDrag = false
                    buttonOffestX = 0
                    buttonOffestY = 0
                    buttonOffestYAdd = 0
                }
        )
    }

}
