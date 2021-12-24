import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    /// Generates a custom URLRequest that we'll use to perform the web requests of the app
    /// - Parameters:
    ///   - route: the backend endpoint we wanna call
    ///   - method: the type of the request
    ///   - parameters: additional params that may be required in the url in some requests
    /// - Returns: URLRequest
    private func createURLRequest(
        route: Route,
        method: Method,
        parameters: [String: Any]? = nil
    ) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        
        guard let url = urlString.asURL else { return nil }
        
        ///
        /// create the url request we wanna customize and use in the requests
        ///
        var urlRequest = URLRequest(url: url)
        
        ///
        /// customize the headers and the method type of the url request
        ///
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        ///
        /// customize the body of the request based on the type of its method
        ///
        if let params = parameters {
            switch method {
                case .GET:
                    ///
                    /// in this get case we wanna attach the params to the url so we creaated
                    /// url component for that, attached each param to it as a query item
                    /// then updated the url of the urlrequest to be the url of the urlcomponent we created
                    ///
                    var urlComponent = URLComponents(string: urlString)
                    urlComponent?.queryItems = params.map {
                        URLQueryItem(name: $0, value: "\($1)")
                    }
                    urlRequest.url = urlComponent?.url
                    
                case .POST, .DELETE, .PATCH:
                    let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                    urlRequest.httpBody = bodyData
            }
        }
        
        return urlRequest
    }
    
    /// This function makes the actual web request to the api using the createRequest() function above
    /// - Parameters:
    ///   - route: the path of the api resource we gonna call
    ///   - method: the type of the requst we wanna make
    ///   - parameters: extra information we wanna pass to the api
    ///   - type: the type of data that the api response should be decoded as
    ///   - completion: gets called when we're done decoding the api response, and to tell the caller
    ///     that we're done
    /// - Returns: Void
    private func request<T: Decodable>(
        route: Route,
        method: Method,
        parameters: [String: Any]? = nil,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard
            let urlRequest = createURLRequest(route: route, method: method, parameters: parameters)
        else {
            completion(.failure(NetworkError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            var result: Result<Data, Error>?
            
            if let data = data {
                result = .success(data)
            } else if let error = error {
                result = .failure(error)
            }
            
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    ///
    /// - this method takes the result that comes from the request and then decode it to a swift object
    ///
    /// - this method will be excuted on the main thread cause it returned the decoded data to the ui
    ///   to be used in there
    ///
    private func handleResponse<T: Decodable>(
        result: Result<Data, Error>?,
        completion: (Result<T, Error>) -> Void
    ) {
        guard let result = result else {
            completion(.failure(NetworkError.unknownError))
            return
        }
        
        switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                
                guard
                    let response = try? decoder.decode(ApiResponse<T>.self, from: data)
                else {
                    completion(.failure(NetworkError.errorDecoding))
                    return
                }
                
                if let error = response.error {
                    completion(.failure(NetworkError.serverError(error)))
                    return
                }
                
                if let decodedData = response.data {
                    completion(.success(decodedData))
                } else {
                    completion(.failure(NetworkError.unknownError))
                }
                
            case .failure(let error):
                completion(.failure(error))
        }
    }
    
    ///
    /// fetch all the deshies
    ///
    func fetchAllCategories(completion: @escaping (Result<AllDishes, Error>) -> Void) {
        request(
            route: .fetchAllCategories,
            method: .GET,
            completion: completion
        )
    }
}
