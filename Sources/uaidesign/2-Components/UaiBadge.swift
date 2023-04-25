import SwiftUI

public struct UaiBadge: View {
    
    enum Role {
        case informative, positive, warning, critical
    }
    
    var icon: String = ""
    var label: String
    var role: Role?
    
    public var BaseBadge: some View {
        Group {
            if icon.isEmpty {
                
                HStack (spacing: Spacing.uaiTiny4) {
                    
                    Text(label)
                    
                }
                .uaiFont(.caption)
                .padding(.horizontal, Spacing.uaiTiny2)
                .frame(height: Spacing.uaiSmall)
                
            }
            
            else {
                
                HStack (spacing: Spacing.uaiTiny4) {
                    
                    Label("icon", systemImage: icon).labelStyle(.iconOnly)
                    Text(label)
                    
                }
                .uaiFont(.caption)
                .padding(.leading, Spacing.uaiTiny3)
                .padding(.trailing, Spacing.uaiTiny2)
                .frame(height: Spacing.uaiSmall)
                
            }
            
        }
    }
    
    public var BadgeInformative: some View {
        
        BaseBadge
            .foregroundColor(Color.uaiHeading)
            .background(Color.uaiSurfaceInformative)
            .clipShape(Capsule())
        
    }
    
    public var BadgePositive: some View {
        
        BaseBadge
            .foregroundColor(Color.uaiHeading)
            .background(Color.uaiSurfacePositive)
            .clipShape(Capsule())
        
    }
    
    public var BadgeWarning: some View {
        
        BaseBadge
            .foregroundColor(Color.uaiHeading)
            .background(Color.uaiSurfaceWarning)
            .clipShape(Capsule())
        
    }
    
    public var BadgeCritical: some View {
        
        BaseBadge
            .foregroundColor(Color.uaiHeadingWhite)
            .background(Color.uaiSurfaceCritical)
            .clipShape(Capsule())
        
    }
    
    public var body: some View {
        switch role {
        case .informative:
            return AnyView(BadgeInformative)
        case .positive:
            return AnyView(BadgePositive)
        case .warning:
            return AnyView(BadgeWarning)
        case .critical:
            return AnyView(BadgeCritical)
        default:
            return AnyView(BadgeInformative)
        }
    }
    
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                UaiBadge(icon:  "circle.fill",label: "Label")
                UaiBadge(label: "Label", role: .positive)
                UaiBadge(label: "Label", role: .warning)
                UaiBadge(label: "Label", role: .critical)
            }
            .padding()
        }
    }
}
