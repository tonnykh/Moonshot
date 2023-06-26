//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Khumbongmayum Tonny on 26/06/23.
//

import SwiftUI

struct ListLayoutView: View {
    let columns = [
            GridItem(.adaptive(minimum: 150))
        ]
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}


struct ListLayoutView_Previews: PreviewProvider {
    static var astronauts: [String : Astronaut] = Bundle.main.decode("astronauts.json")
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListLayoutView(missions: missions, astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
