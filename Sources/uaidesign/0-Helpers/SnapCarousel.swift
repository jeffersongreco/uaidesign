import SwiftUI

//

public struct SnapCarousel<Content: View, T: Identifiable>: View {
    
    var content: (T) -> Content
    var list: [T]
    
    var spacing: CGFloat = 14
    var trailingSpace: CGFloat = 56
    @Binding var index: Int
    
    public init(spacing: CGFloat = 14, trailingSpace: CGFloat = 56, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.list = items
        self.content = content
    }
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    
    public var body: some View {
        
        GeometryReader { proxy in
                        
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustmentWidth = (trailingSpace / 2) - spacing
            
            LazyHStack (spacing: spacing) {
                
                ForEach(list) { item in
                    
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                    
                }
                
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + (adjustmentWidth) + offset)
            .gesture(
            
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        
                        out = value.translation.width
                        
                    })
                    .onEnded({ value in
                        
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        currentIndex = index
                        
                    })
                    .onChanged({ value in
                        
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                    })
            
            )
            
        }
        .animation(.easeInOut, value: offset == 0)
        
    }
    
}
