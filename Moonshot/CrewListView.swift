//
//  CrewView.swift
//  Moonshot
//
//  Created by Khumbongmayum Tonny on 26/06/23.
//

import SwiftUI

struct CrewListView: View {
    var crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        CrewView(crewMember: crewMember)
                    }
                }
            }
        }
    }
}



struct CrewListView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static let crew: [CrewMember] = [
        CrewMember(role: "Commander", astronaut: astronauts["armstrong"]!),
        CrewMember(role: "Commander", astronaut: astronauts["armstrong"]!),
        CrewMember(role: "Commander", astronaut: astronauts["armstrong"]!),
        ]
    
    static var previews: some View {
        CrewListView(crew: crew)
            .preferredColorScheme(.dark)
    }
}
