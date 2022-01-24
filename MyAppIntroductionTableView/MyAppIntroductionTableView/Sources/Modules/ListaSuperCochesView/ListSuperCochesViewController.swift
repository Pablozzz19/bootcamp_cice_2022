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
    var imageCoche = UIImage(named: "Audi")
    
    // MARK: - IBOutlet
    @IBOutlet weak var miListaCochesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationUI()
        // Do any additional setup after loading the view.
    }

    // MARK: - Metodos privados
    private func configurationUI() {
        
    }
    
    private func configuracionTableView() {
        self.miListaCochesTableView.delegate = self
        self.miListaCochesTableView.dataSource = self
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
        return UITableViewCell()
    }
    
}

extension ListSuperCochesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
