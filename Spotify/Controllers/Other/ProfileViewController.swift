//
//  ProfileViewController.swift
//  Spotify
//
//  Created by Neddy Ksenia Gonzalez Siles on 3/10/23.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {
    
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var models = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Profile"
        fetchProfile()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func fetchProfile() {
        APICaller.shared.getCurrentUserProfile { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    print("model gg: ", model)
                    self.updateUI(with: model)
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    self.failedToGetProfile()
                    break
                }
            }
        }
    }
    
    func updateUI(with model: UserProfile) {
        tableView.isHidden = false
        models.append("Full name: \(model.displayName)")
        models.append("Email Adress: \(model.email)")
        models.append("User ID: \(model.id)")
        models.append("Plan: \(model.product)")
        createTableHeader(with: model.userImages[1].url)
        tableView.reloadData()
    }
    
    private func failedToGetProfile() {
        let errorLabel = UILabel(frame: .zero)
        errorLabel.text = "Failed to load profile."
        errorLabel.sizeToFit()
        errorLabel.textColor = .secondaryLabel
        view.addSubview(errorLabel)
        errorLabel.center = view.center
    }
    
    private func createTableHeader(with imageUrl: String?) {
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else {
            return
        }
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.width/1.5))
        let imageSize: CGFloat = headerView.height/2
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        headerView.addSubview(imageView)
        imageView.center = headerView.center
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageSize/2
        imageView.sd_setImage(with: url, completed: nil)
        tableView.tableHeaderView = headerView
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
