import SwiftUI

public struct UaiButton: View {
    
    var label: String
    var icon: String = ""
    var textAndIcon: Bool { !label.isEmpty && !icon.isEmpty }
    var size: UaiButtonSize.Style
    var role: UaiButtonRole.Style
    var action: () -> Void = {}
    
    public init(label: String, icon: String, size: UaiButtonSize.Style, role: UaiButtonRole.Style, action: @escaping () -> Void) {
        self.label = label
        self.icon = icon
        self.size = size
        self.role = role
        self.action = action
    }
    
    public var body: some View {
        
        Button(action: action) {
            
            HStack(spacing: textAndIcon ? 6 : 0) {
                Text(label)
                Image(systemName: icon)
            }
            .padding(.leading, textAndIcon ? 2 : 0)
            
        }
        .uaiButtonSize(size)
        .uaiButtonRole(role)
        
    }
    
}

struct UaiButton_Previews: PreviewProvider {
    static var previews: some View {
        
        UaiButton(label: "Label", icon: "chevron.forward", size: .regular, role: .primary, action: {})
        
    }
}
