//
//  Parser.swift
//  17_xml_parsing
//
//  Created by Admin on 6/4/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import Foundation

class Parser: XMLParser, XMLParserDelegate{
    var books: [Book] = []
    
    var elementString: String = ""
    
    var book: Book = Book()
    
    func parseBook() -> [Book]{
        self.delegate = self
        
        self.parse()
        
        return books
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "book" {
            if let book_id = attributeDict["id"] {
                self.book.id = book_id
            }
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        self.elementString = string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        switch elementName {
        case "author":
            self.book.author = elementString
        case "title":
            self.book.title = elementString
        case "genre":
            self.book.genre = elementString
        case "price":
            self.book.price = Double(elementString)
        case "publish_date":
            self.book.publish_date = elementString
        case "description":
            let tempBook = Book()
            self.book.description = elementString
            
            tempBook.id = self.book.id
            
            tempBook.author = self.book.author
            tempBook.title = self.book.title
            tempBook.genre = self.book.genre
            tempBook.price = self.book.price
            tempBook.publish_date = self.book.publish_date
            tempBook.description = self.book.description
            
            self.books.append(tempBook)
        default:
            print()
            //print("XML Element naming gone wrong \(elementName)")
        }
    }
}
