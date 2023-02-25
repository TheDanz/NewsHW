import ObjectMapper

class NewsList: Mappable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
    
    required init?(map: ObjectMapper.Map) { }
    
    func mapping(map: ObjectMapper.Map) {
        status <- map["status"]
        totalResults <- map["totalResults"]
        articles <- map["articles"]
    }
}

class Article: Mappable {
    var source: Source?
    var author: String?
    var title: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var description: String?
    
    required init?(map: ObjectMapper.Map) { }
    
    func mapping(map: ObjectMapper.Map) {
        source <- map["source"]
        author <- map["author"]
        title <- map["title"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        description <- map["description"]
    }
}

class Source: Mappable {
    var id: String?
    var name: String?
    
    required init?(map: ObjectMapper.Map) { }
    
    func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        name <- map ["name"]
    }
}
