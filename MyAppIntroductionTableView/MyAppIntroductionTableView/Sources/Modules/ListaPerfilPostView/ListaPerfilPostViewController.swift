//
//  ListaPerfilPostViewController.swift
//  MyAppIntroductionTableView
//
//  Created by cice on 25/01/2022.
//

import UIKit

class ListaPerfilPostViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var miPerfilPostTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationTableView()
        // Do any additional setup after loading the view.
    }


    private func configurationTableView() {
        self.miPerfilPostTableView.delegate = self
        self.miPerfilPostTableView.dataSource = self
        self.miPerfilPostTableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
        self.miPerfilPostTableView.register(UINib(nibName: PostCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PostCell.defaultReuseIdentifier)
    }

}

extension ListaPerfilPostViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellPerfil = self.miPerfilPostTableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
            cellPerfil.delegate = self
            cellPerfil.setupCellPerfil(data: UserDataModel(nombrePerfil: "Pablo Tesheiner Moreno",
                                                           descripcionPerfil: "Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran",
                                                           puestoActualPerfil: "Estudiante CICE",
                                                           usuarioLinkedInPerfil: "@PabloTesheiner",
                                                           imagePerfil: "thor"))
            return cellPerfil
        default:
            let cellPost = self.miPerfilPostTableView.dequeueReusableCell(withIdentifier: PostCell.defaultReuseIdentifier, for: indexPath) as! PostCell
            cellPost.setupPostCell(data: UserDataModel(nombrePerfil: "Miranda",
                                                       descripcionPerfil: "Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran, Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran, Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran",
                                                       puestoActualPerfil: "Sebior Lead iOs Engineer",
                                                       usuarioLinkedInPerfil: "@Miranda_Lambert",
                                                       imagePerfil: "Miranda_Lambert"))
            return cellPost
        }
    }
    
}

extension ListaPerfilPostViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 266
        default:
            return UITableView.automaticDimension
        }
    }
    
}

extension ListaPerfilPostViewController: PerfilCellDelegate {
    
    func showAlertB1() {
        let alertVC = UIAlertController(title: "Explota la cabeza",
                                        message: "\(#function)",
                                        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok",
                                        style: .default,
                                        handler: nil))
        self.present(alertVC,
                     animated: true,
                     completion: nil)
    }
    
    func showAlertB2() {
        let alertVC = UIAlertController(title: "Explota la cabeza",
                                        message: "\(#function)",
                                        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok",
                                        style: .default,
                                        handler: nil))
        self.present(alertVC,
                     animated: true,
                     completion: nil)
    }
    
    func navigationToDetailView(withData: UserDataModel?) {
        let alertVC = UIAlertController(title: "Explota la cabeza",
                                        message: withData?.nombrePerfil,
                                        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok",
                                        style: .default,
                                        handler: nil))
        self.present(alertVC,
                     animated: true,
                     completion: nil)
    }
    
}
