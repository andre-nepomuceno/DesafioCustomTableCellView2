//
//  ViewController.swift
//  DesafioCustomViewTableCell2
//
//  Created by André N. dos Santos on 27/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var filmesTableView: UITableView!

    var videos: [Video] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmesTableView.dataSource = self
        filmesTableView.delegate = self
        
        carregaVideos()        
    }
    
    private func carregaVideos() {
        let matrix = Filme(titulo: "Matrix", genero: "Ficção", poster: "cartazMatrix")
        let iluminado = Filme(titulo: "O Iluminado", genero: "Suspense", poster: "cartazOIluminado")
        let esefosse = Filme(titulo: "E Se Fosse Verdade", genero: "Romance", poster: "cartazESeFosseVerdade")
        
        let got = Serie(titulo: "Game Of Thrones", poster: "cartazGOT")
        let you = Serie(titulo: "You", poster: "cartazYou")
        let peacemaker = Serie(titulo: "O Pacificador", poster: "cartazPacificador")
        
        videos.append(contentsOf: [matrix, iluminado, esefosse, got, you, peacemaker])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return videos.filter { video in
                video.tipo == .Filme
            }.count
        } else {
            return videos.filter { video in
                video.tipo == .Serie
            }.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (TipoVideo.allCases.first(where: { tv in
            tv.index == section
        }))?.name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cellFilme = tableView.dequeueReusableCell(withIdentifier: "filmesCell", for: indexPath) as? FilmesTableViewCell {
                guard let filme = videos.filter({ video in
                    video.tipo == .Filme
                })[indexPath.row] as? Filme else { return UITableViewCell() }
                cellFilme.setupData(titulo: filme.titulo, genero: filme.genero, nomeImagem: filme.poster)
                alteraCorCelula(linha: indexPath.row, celula: cellFilme)
                alteraCorLabel(linha: indexPath.row, texto: cellFilme.generoFilmeLabel)
                return cellFilme
            }
        }
        else {
            if let cellSerie = tableView.dequeueReusableCell(withIdentifier: "seriesCell", for: indexPath) as? SeriesTableViewCell {
                guard let serie = videos.filter({ video in
                    video.tipo == .Serie
                })[indexPath.row] as? Serie else { return UITableViewCell() }
                
                cellSerie.setupData(titulo: serie.titulo, nomeImagem: serie.poster)
                alteraCorCelula(linha: indexPath.row, celula: cellSerie)
                return cellSerie
            }
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TipoVideo.allCases.count
    }
    
    private func alteraCorCelula(linha: Int, celula: UITableViewCell) {
        if linha % 2 != 0 {
            celula.backgroundColor = UIColor.red
        }
        else {
            celula.backgroundColor = UIColor.clear
        }
    }
    private func alteraCorLabel(linha: Int, texto: UILabel) {
        if linha % 2 != 0 {
            texto.textColor = UIColor.yellow
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

enum TipoVideo: String, CaseIterable {
    case Filme
    case Serie
    
    var name: String { self.rawValue.uppercased() }
    var index: Int { TipoVideo.allCases.firstIndex(of: self) ?? 0 }
}

public class Video {
    let titulo: String
    let poster: String
    let tipo: TipoVideo
    
    init(titulo: String, poster: String, tipo: TipoVideo) {
        self.titulo = titulo
        self.poster = poster
        self.tipo = tipo
    }
}

public class Serie : Video {
    init(titulo: String, poster: String) {
        super.init(titulo: titulo, poster: poster, tipo: .Serie)
    }
}

public class Filme: Video {
    let genero: String
    
    init(titulo: String, genero: String, poster: String) {
        self.genero = genero
        super.init(titulo: titulo, poster: poster, tipo: .Filme)
    }
}

