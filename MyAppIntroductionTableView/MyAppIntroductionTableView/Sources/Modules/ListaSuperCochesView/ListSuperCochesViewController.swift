//
//  ListSuperCochesViewController.swift
//  MyAppIntroductionTableView
//
//  Created by cice on 24/01/2022.
//

import UIKit

class ListSuperCochesViewController: UIViewController {

    // MARK: - Variables globales
    var dataSourceCoches: [CochesModel] = []
    var imageCoche = UIImage(named: "audi")
    
    // MARK: - IBOutlet
    @IBOutlet weak var miListaCochesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationUI()
        self.configuracionTableView()
        // Do any additional setup after loading the view.
    }

    // MARK: - Metodos privados
    private func configurationUI() {
        self.title = Utils.Constants().tituloListaCoches
        for item in 0..<23 {
            let modelData = CochesModel(nombre: "Audi",
                                        color: "Verde",
                                        imagen: imageCoche)
            dataSourceCoches.append(modelData)
            print("\(dataSourceCoches[item])")
        }
    }
    
    private func configuracionTableView() {
        self.miListaCochesTableView.delegate = self
        self.miListaCochesTableView.dataSource = self
        self.miListaCochesTableView.register(UINib(nibName: CochesCell.defaultReuseIdentifier,
                                                bundle: nil),
                                             forCellReuseIdentifier: CochesCell.defaultReuseIdentifier)
    }
}

extension ListSuperCochesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceCoches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellCoches = self.miListaCochesTableView.dequeueReusableCell(withIdentifier:
            CochesCell.defaultReuseIdentifier, for: indexPath) as! CochesCell
        cellCoches.setuptCell(data: self.dataSourceCoches[indexPath.row])
        return cellCoches
    }
    
}

extension ListSuperCochesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.dataSourceCoches[indexPath.row]
        print("\(model.nombre ?? "Liada")" + "\(self.dataSourceCoches[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
