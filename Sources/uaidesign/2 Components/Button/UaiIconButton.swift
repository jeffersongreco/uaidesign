import SwiftUI



struct UaiIconButton: View {
    
    var label: String
    var icon: String
    var size: UaiIconButtonSize.Style
    var role: UaiButtonRole.Style
    var action: () -> Void = {}
    

    
    public var body: some View {
        
        Button(action: action) {
            
            HStack (alignment: .center) {
                Label(label, systemImage: icon).labelStyle(.iconOnly)
            }
            
        }
        .uaiIconButtonSize(size)
        .uaiButtonRole(role)
        
    }
    
}



struct UaiIconButton_Previews: PreviewProvider {
    static var previews: some View {
        
        UaiIconButton(label: "Label", icon: "chevron.forward", size: .regular, role: .primary)
        
    }
}
