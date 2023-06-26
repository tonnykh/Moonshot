//
//  CrewView.swift
//  Moonshot
//
//  Created by Khumbongmayum Tonny on 26/06/23.
//

import SwiftUI

struct CrewView: View {
    let crewMember: CrewMember
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .foregroundColor(.white)
                    .font(.headline)
                Text(crewMember.role)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal)
    }
}

struct CrewView_Previews: PreviewProvider {
    static let sampleCrewMember = CrewMember(role: "Commander", astronaut: Astronaut(id: "armstrong", name: "Neil Armstrong", description: "Description"))

    static var previews: some View {
        CrewView(crewMember: sampleCrewMember)
            .preferredColorScheme(.dark)
    }
}
