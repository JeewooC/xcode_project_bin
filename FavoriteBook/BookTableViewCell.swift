//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Jeewoo Chung on 9/17/19.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var lengthLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with book: Book) {
        genreLabel.text = book.genre
        authorLabel.text = book.author
        lengthLabel.text = book.length
        titleLabel.text = book.title
    }

}
