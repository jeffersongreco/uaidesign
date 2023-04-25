import SwiftUI

public struct UaiImageCard<Background: View>: View {
    
    public enum Aspect {
        case square, wide
    }
    
    var aspect: Aspect
    var background: () -> Background
    
    public init(aspect: Aspect, @ViewBuilder background: @escaping () -> Background) {
        self.aspect = aspect
        self.background = background
    }
    
    public var body: some View {
        
        if self.aspect == .square {
            
            ZStack {
                background().padding(1)
            }
            .frame(width: (UIScreen.screenWidth - 28 * 2) + 2, height: (UIScreen.screenWidth - 28 * 2) + 2)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .uaiInnerShadow(24, x: 0, y: 1, blur: 1, color: Color.uaiShadeStroke)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .strokeBorder(Color.uaiShadeStroke, lineWidth: 1)
            )
            
        }
        
        if self.aspect == .wide {
            
            ZStack {
                background().padding(1)
            }
            .frame(width: (UIScreen.screenWidth - 28 * 2) + 2, height: (UIScreen.screenWidth - 28 * 2) / 1.78 + 2)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .uaiInnerShadow(24, x: 0, y: 1, blur: 1, color: Color.uaiShadeStroke)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .strokeBorder(Color.uaiShadeStroke, lineWidth: 1)
            )
            
        }
        
    }
    
}

struct UaiImageCard_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack{
            
            UaiImageCard(aspect: .wide, background: {Color.blue}).padding()
            
            UaiImageCard(aspect: .square, background: {Color.blue})
            
        }
        
    }
}
