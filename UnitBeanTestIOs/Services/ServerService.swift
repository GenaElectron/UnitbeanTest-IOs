//
//  ServerService.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 30.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct ServerServiceError : Error {
    let description : String
    var localizedDesc: String {
        return NSLocalizedString(description, comment: "")
    }
}

protocol ServerServiceProtocol: class {
    func getAllPost(completion: @escaping OptionalItemClosureWithError<[Post]>)
    func getPost(withId id: Int, completion: @escaping OptionalItemClosureWithError<Post>)
    func getComments(withPostId id: Int, completion: @escaping OptionalItemClosureWithError<[Comment]>)
}

class ServerService: ServerServiceProtocol {
    private let host = "https://jsonplaceholder.typicode.com"
    
    private enum Resourse {
        case posts
        case comments
        var string : String {
            switch self {
            case .posts: return "/posts"
            case .comments: return "/comments"
            }
        }
    }
    
    private func URLGetPosts() -> String {
        return host + Resourse.posts.string
    }
    
    private func URLGetPost(withId id: Int) -> String {
        return host + Resourse.posts.string + "/\(id)"
    }
    
    private func URLGetComments(withPostId id: Int) -> String {
        return host + Resourse.comments.string + "?postId=\(id)"
    }
    
    // MARK: - ServerServiceProtocol methods
    
    func getAllPost(completion: @escaping OptionalItemClosureWithError<[Post]>) {
        if let URL = URL(string: URLGetPosts()) {
            getJSON(URL: URL) { (json, error) in
                if let arrayOfDict = json as? [Dictionary<String,Any>] {
                    var posts: [Post] = []
                    arrayOfDict.forEach({ posts.append(Post(fromDictionary: $0))})
                    completion(posts,error)
                } else {
                    let error = ServerServiceError(description: "[Post]. json decode error")
                    completion(nil,error)
                }
            }
        }
    }
    
    func getPost(withId id: Int, completion: @escaping OptionalItemClosureWithError<Post>) {
        let URLString = URLGetPost(withId: id)

        if let URL = URL(string: URLString) {
            getJSON(URL: URL) { (json, error) in
                if let dict = json as? Dictionary<String,Any> {
                    let post = Post(fromDictionary: dict)
                    completion(post,error)
                } else {
                    let error = ServerServiceError(description: "Post. json decode error")
                    completion(nil,error)
                }
            }
        }
    }

    func getComments(withPostId id: Int, completion: @escaping OptionalItemClosureWithError<[Comment]>) {
        let URLString = URLGetComments(withPostId: id)

        if let URL = URL(string: URLString) {
            getJSON(URL: URL) { (json, error) in
                if let arrayOfDict = json as? [Dictionary<String,Any>] {
                    var comments: [Comment] = []
                    arrayOfDict.forEach({ comments.append(Comment(fromDictionary: $0))})
                    completion(comments,error)
                } else {
                    let error = ServerServiceError(description: "[Comment]. json decode error")
                    completion(nil,error)
                }
            }
        }
    }
    
    // MARK: - Private methods
    
    private func getJSON(URL: URL, completion: @escaping OptionalItemClosureWithError<Any>) {
        let sharedSession = URLSession.shared
        
        let dataTask = sharedSession.dataTask(with: URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                completion(nil, error)
                return
            }
            if let dataResponse = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                    completion(json, nil)
                    return
                    
                } catch let error as NSError {
                    completion(nil, error)
                }
            }
        })
        dataTask.resume()
    }
    
    deinit {
        //print("deinit ServerService")
    }
}
