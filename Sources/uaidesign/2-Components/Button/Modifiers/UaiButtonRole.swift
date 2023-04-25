import SwiftUI



///Modifiers

public struct UaiButtonAccent: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .foregroundColor(Color.uaiHeadingWhite)
            .background(
                ZStack {
                    Capsule()
                        .fill(Color.uaiSurfaceAccent)
                    Capsule()
                        .fill(Color.white)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 2, y: 2)
                        .blendMode(.multiply)
                }
            )
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(Color.uaiShadeStroke)
            )
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 2, y: 2)
    }
    
}

public struct UaiButtonPrimary: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .foregroundColor(Color.uaiHeadingWhite)
            .background(
                ZStack {
                    Capsule()
                        .fill(Color.uaiSurfacePrimary)
                    Capsule()
                        .fill(Color.white)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 2, y: 2)
                        .blendMode(.multiply)
                }
                
            )
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(Color.uaiShadeStroke)
            )
    }
    
}

public struct UaiButtonSecondary: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .foregroundColor(Color.uaiHeading)
            .background(
                Capsule()
                    .fill(Color.white)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 2, y: 2)
                    .blendMode(.multiply)
            )
            .overlay(
                Capsule()
                    .stroke(Color.uaiShadeStroke, lineWidth: Spacing.uaiMicro)
            )
        
    }
    
}

public struct UaiButtonGlass: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .foregroundColor(Color.uaiHeading)
            .background(
                ZStack {
                    UaiGlassBackground()
                        .clipShape(Capsule())
                    Capsule()
                        .fill(Color.white)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 2, y: 2)
                        .blendMode(.multiply)
                }
            )
            .overlay(
                Capsule()
                    .stroke(Color.uaiShadeStroke, lineWidth: Spacing.uaiMicro)
            )
    }
    
}


///

public struct UaiButtonRole: ViewModifier {
    
    public enum Style {
        case accent, primary, secondary, glass
    }
    
    var style: Style
    
    public func body(content: Content) -> some View {
        
        if self.style == .accent {
            content.uaiButtonAccent()
        }
        
        if self.style == .primary {
            content.uaiButtonPrimary()
        }
        
        if self.style == .secondary {
            content.uaiButtonSecondary()
        }
        
        if self.style == .glass {
            content.uaiButtonGlass()
        }
        
    }
    
}



///Extensions

public extension View {
    
    func uaiButtonAccent() -> some View {
        self
            .modifier(UaiButtonAccent())
    }
    
}

public extension View {
    
    func uaiButtonPrimary() -> some View {
        self
            .modifier(UaiButtonPrimary())
    }
    
}

public extension View {
    
    func uaiButtonSecondary() -> some View {
        self
            .modifier(UaiButtonSecondary())
    }
    
}

public extension View {
    
    func uaiButtonGlass() -> some View {
        self
            .modifier(UaiButtonGlass())
    }
    
}


///

public extension View {
    
    func uaiButtonRole(_ style: UaiButtonRole.Style) -> some View {
        self
            .modifier(UaiButtonRole(style: style))
    }
    
}


