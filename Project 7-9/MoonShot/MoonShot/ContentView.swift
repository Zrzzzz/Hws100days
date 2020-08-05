//
//  ContentView.swift
//  MoonShot
//
//  Created by Zr埋 on 2020/6/18.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}


struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingCrewMember = true
    
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.showingCrewMember.toggle()
                }) {
                    Text("Touch ME")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                List(missions) { mission in
                    NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 44, height: 44)
                            
                            
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                if self.showingCrewMember {
                                    //                                        List {
                                    ForEach(0..<mission.crew.count) {
                                        Text(mission.crew[$0].name)
                                        //                                            }
                                    }
                                } else {
                                    Text(mission.formattedLaunchDate)
                                }
                            }
                            
                            
                            
                        }
                        
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
