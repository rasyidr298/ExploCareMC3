//
//  HomeVC.swift
//  ExploCare-ARKit
//
//  Created by cleanmac-ada on 20/08/22.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var soundStateButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var levelTableView: UITableView!
    
    init() {
        super.init(nibName: "HomeVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        levelTableView.delegate = self
        levelTableView.dataSource = self
        levelTableView.allowsSelection = false
        levelTableView.register(UINib(nibName: "LevelSectionCell", bundle: nil), forCellReuseIdentifier: LevelSectionCell.REUSE_IDENTIFIER)
    }
    
    @IBAction private func soundStateAction(_ sender: Any) {

    }
    
    @IBAction private func helpAction(_ sender: Any) {
        
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LevelSectionCell.REUSE_IDENTIFIER) as! LevelSectionCell
        cell.setupContents(title: indexPath.row == 0 ? "Finding the object" : "Have an adventure")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        LevelSectionCell.CELL_HEIGHT
    }
}
