import SwiftUI



///Modifiers

public struct UaiIconButtonSize: ViewModifier {
    
    public enum Style {
        case small, regular, big
    }
    
    public var style: Style
    
    public func body(content: Content) -> some View {
        
        switch style {
            
        case .small: return
            content
                .uaiFont(.button3)
                .imageScale(.small)
                .frame(width: Spacing.uaiMedium3, height: Spacing.uaiMedium3)
            
        case .regular: return
            content
                .uaiFont(.button2)
                .imageScale(.small)
                .frame(width: Spacing.uaiMedium4, height: Spacing.uaiMedium4)
            
        case .big: return
            content
                .uaiFont(.button)
                .imageScale(.small)
                .frame(width: Spacing.uaiLarge2, height: Spacing.uaiLarge2)
            
        }
        
    }
    
}



///Extensions

public extension View {
    
    func uaiIconButtonSize(_ style: UaiIconButtonSize.Style) -> some View {
        self
            .modifier(UaiIconButtonSize(style: style))
    }
    
}


