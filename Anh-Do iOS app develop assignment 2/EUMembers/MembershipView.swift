import SwiftUI

struct MembershipView: View {
    @State var country: Country
    
    var body: some View {
        HStack {
            if country.isMember {
                Image(systemName: "star")
                    .font(.system(size: 28.0))
                    .foregroundColor(.yellow)
            }
            
            if country.isEuroZone {
                Text("\u{20AC}")
                    .font(.system(size: 28.0))
            }
            
            if country.isSchengen {
                Image("eu")
                    .resizable()
                    .scaledToFit()
                    .border(Color.black, width: 0.25)
                    .frame(maxWidth: 20)
            }
        }
    }
}
