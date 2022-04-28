//
//  SeriesTableViewCell.swift
//  DesafioCustomViewTableCell2
//
//  Created by André N. dos Santos on 27/04/22.
//

import UIKit

class SeriesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cartazSerieImageView: UIImageView!
    @IBOutlet weak var tituloSerieLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func mudarTitulo(titulo: String) {
        tituloSerieLabel.text = titulo
    }
    
    func mudarImagemCartaz(nomeImagem: String) {
        cartazSerieImageView.image = UIImage.init(named: nomeImagem)
    }
    
    func setupData(titulo: String, nomeImagem: String) {
        tituloSerieLabel.text = titulo
        cartazSerieImageView.image = UIImage.init(named: nomeImagem)
    }
}
