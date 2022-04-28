//
//  FilmesTableViewCell.swift
//  DesafioCustomViewTableCell2
//
//  Created by André N. dos Santos on 27/04/22.
//

import UIKit

class FilmesTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var cartazFilmeImageView: UIImageView!
    @IBOutlet weak var tituloFilmeLabel: UILabel!
    @IBOutlet weak var generoFilmeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func mudarTitulo(titulo: String) {
        tituloFilmeLabel.text = titulo
    }
    
    func mudarGenero(genero: String) {
        generoFilmeLabel.text = genero
    }
    
    func mudarImagemCartaz(nomeImagem: String) {
        cartazFilmeImageView.image = UIImage.init(named: nomeImagem)
    }

    func setupData(titulo: String, genero: String, nomeImagem: String) {
        tituloFilmeLabel.text = titulo
        generoFilmeLabel.text = genero
        cartazFilmeImageView.image = UIImage.init(named: nomeImagem)
    }
}
