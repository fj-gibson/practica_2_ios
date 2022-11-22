//
//  ViewController.swift
//  Practica_2
//
//  Created by Francisco Padilla on 22/11/22.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarAudio()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("Se mueve")
        inicializaInterfaz()
        audioPlayer.play()
    }
    
    func cargarAudio(){
        guard let laURL = Bundle.main.url(forResource: "loud_bang", withExtension: "mp3")
        else{
            print ("Error al cargar archivo")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: laURL)
            inicializaInterfaz()
        }catch{
            print("Ocurrio un error")
        }
        
    }
    
    func inicializaInterfaz(){
        audioPlayer.delegate = self
        audioPlayer.volume = 0.5
    }


}

