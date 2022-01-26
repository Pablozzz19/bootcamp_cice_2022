//
//  PostCell.swift
//  MyAppIntroductionTableView
//
//  Created by cice on 25/01/2022.
//

import UIKit

protocol PostCellProtocoll {
    func setupPostCell(data: UserDataModel?)
}

class PostCell: UITableViewCell, ReuseIdentifierView {

    // MARK: - IBOutlets
    @IBOutlet weak var miImagenPerfilPost: UIImageView!
    @IBOutlet weak var miNombrePerfilPost: UILabel!
    @IBOutlet weak var miPuestoTrabajoPerfilPost: UILabel!
    @IBOutlet weak var miFechaActualPost: UILabel!
    @IBOutlet weak var miDescripcionPost: UILabel!
    @IBOutlet weak var miTituloPostLBL: UILabel!
    @IBOutlet weak var miNumeroLikesLBL: UILabel!
    @IBOutlet weak var miComentariosLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuraionUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configuraionUI() {
        self.miImagenPerfilPost.layer.cornerRadius =
            self.miImagenPerfilPost.frame.width / 2
    }
    
}

extension PostCell: PostCellProtocoll {
    
    func setupPostCell(data: UserDataModel?) {
        self.miImagenPerfilPost.image = UIImage(named: data?.imagePerfil ?? "thor")
        self.miNombrePerfilPost.text = data?.nombrePerfil
        self.miPuestoTrabajoPerfilPost.text = data?.puestoActualPerfil
        self.miFechaActualPost.text = "\(Date())"
        self.miDescripcionPost.text = data?.descripcionPerfil
        self.miTituloPostLBL.text = "Estamos lanzando la App"
        self.miNumeroLikesLBL.text = "Likes: 1k"
        self.miComentariosLBL.text = "Comentarios: 2k"
    }
    
}
