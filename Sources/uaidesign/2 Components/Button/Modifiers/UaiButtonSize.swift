import SwiftUI



///Modifiers

public struct UaiButtonSize: ViewModifier {
    
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
                .padding(.leading, Spacing.uaiSmall2)
                .padding(.trailing, Spacing.uaiSmall2)
                .frame(height: Spacing.uaiMedium3)
            
        case .regular: return
            content
                .uaiFont(.button2)
                .imageScale(.small)
                .padding(.leading, Spacing.uaiSmall)
                .padding(.trailing, Spacing.uaiSmall)
                .frame(height: Spacing.uaiMedium4)
            
        case .big: return
            content
                .uaiFont(.button)
                .imageScale(.small)
                .padding(.leading, Spacing.uaiMedium2)
                .padding(.trailing, Spacing.uaiMedium2)
                .frame(height: Spacing.uaiLarge2)
            
        }
        
    }
    
}



///Extensions

public extension View {
    
    func uaiButtonSize(_ style: UaiButtonSize.Style) -> some View {
        self
            .modifier(UaiButtonSize(style: style))
    }
    
}


