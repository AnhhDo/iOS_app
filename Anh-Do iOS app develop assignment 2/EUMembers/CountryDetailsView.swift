import SwiftUI

struct CountryDetailsView: View {
    @State var country: Country
    // You could use @State, but remember that if you
    // want to make a view for editing, you will need @Binding.
    var body: some View {
        let name:String = country.name
        let nameInUrl = name.replacingOccurrences(of: " ",with: "_")
        
        VStack {
            MembershipView(country: country)
            
            Text("Population: \(country.population)")
            Text("Area: \(country.area) km\u{B2}")
            Text("Population density: \(country.populationDensity) persons per km\u{B2}")
            Link(destination: URL(string: "https://en.wikipedia.org/wiki/\(nameInUrl)")!, label: {
                Text("Wikipedia about \(name)")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(12)
            })
        }
    }
    
    struct CountryDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            CountryDetailsView(country: finland)
        }
    }
    
}
