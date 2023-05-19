import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: CountryManager
    
    var body: some View {
        NavigationStack {
            Section(header: Text("Current member")){
                    List(manager.countries) {
                        country in
                        if(country.isMember){
                            HStack {
                                Image(country.code.lowercased())
                                    .resizable()
                                    .scaledToFit()
                                    .border(Color.black, width: 0.25)
                                    .frame(maxWidth: 20)
                                Spacer()
                                NavigationLink(country.name) {
                                    CountryView(country: country)
                                }
                                Spacer()
                                MembershipView(country: country)
                            }
                        }
                    }
                }
                Section(header: Text("Past member")){
                List(manager.countries) { country in
                    if(country.isMember == false){
                        HStack {
                            Image(country.code.lowercased())
                                .resizable()
                                .scaledToFit()
                                .border(Color.black, width: 0.25)
                                .frame(maxWidth: 20)
                            Spacer()
                            NavigationLink(country.name) {
                                CountryView(country: country)
                            }
                            Spacer()
                            MembershipView(country: country)
                        }
                    }
                }
            }
            .navigationTitle("EU Members")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CountryManager())
    }
}

