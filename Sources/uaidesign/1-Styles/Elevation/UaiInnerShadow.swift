import SwiftUI



struct UaiInnerShadow: ViewModifier {
    
    var contentCorner: CGFloat
    var x: CGFloat
    var y: CGFloat
    var blur: CGFloat
    var color: Color
    
    public func body(content: Content) -> some View {
        
        content
            .overlay(
            
                RoundedRectangle(cornerRadius: contentCorner)
                    .stroke(Color.white, lineWidth: 2)
                    .shadow(color: color, radius: blur, x: x, y: y)
                    .clipShape(RoundedRectangle(cornerRadius: contentCorner))
                    .blendMode(.multiply)
            
            )
        
    }
    
}



public extension View {
    
    func uaiInnerShadow(_ contentCorner: CGFloat, x: CGFloat, y: CGFloat, blur: CGFloat, color: Color) -> some View {
        self
            .modifier(UaiInnerShadow(contentCorner: contentCorner, x: x, y: y, blur: blur, color: color))
    }
    
}

