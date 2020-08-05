//
//  AstronautView.swift
//  MoonShot
//
//  Created by Zr埋 on 2020/6/19.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let mission: Mission
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Mission: \(self.mission.displayName)")
                        .font(.callout)
                        
                    
                    Text(self.astronaut.description)
                    .padding()
                    .layoutPriority(1)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0], mission: missions[0])
    }
}
