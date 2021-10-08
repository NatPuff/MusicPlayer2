//
//  ContentView.swift
//  MusicPlayer2
//
//  Created by AMStudent on 9/28/21.
//


import SwiftUI
import AVKit

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var song = 1
    var body: some View {
        ZStack{
            Color("AccentColor").ignoresSafeArea()

        VStack{
            HStack{
        Text("Music Player")
            
            .font(.system(size: 45))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("Bruh"))
            }
            Image("Neonix")
                .resizable()
                .frame(width: 200, height: 200)
            HStack{
                Button(action: {
                    audioPlayer.play()
                }) {
                    Image("play")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("Bruh"))
                        .padding(.top)
                }
                Button(action: {
                    audioPlayer.pause()
                }) {
                    Image("pause")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("Bruh"))
                        .padding(.top)
               }
                Button(action: {
                    if self.song < 3 {
                        self.song += 1
                            
                        } else {
                            self.song = 1
                        }
                        let sound = Bundle.main.path(forResource: "song\(self.song)", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        self.audioPlayer.play()
                    
                    
                })  {
                    Image("next")
                        .renderingMode(.template)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color("Bruh"))
                        .padding(.top)
                    
                }
            }
        }
        .onAppear {
        let sound = Bundle.main.path(forResource: "song1", ofType: "mp3")
            audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
       }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



