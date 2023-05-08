import Foundation

// MARK: - ServiceError

enum ServiceError: Error {
    case serverError
    case noData
    case decodeError
}

// MARK: - NetworkService

final class NetworkService {
    
    // MARK: - Properties

    private var session: URLSession
    private var components = URLComponents()
    
    // MARK: - Init

    init() {
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration)
        self.components.scheme = Constants.scheme
        self.components.host = Constants.host
    }
    
    // MARK: - Private methods

    private func getURL(path: String, params: [String: String]) -> URL? {
        components.path = path
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1)}
        
        return components.url
    }
    
    // MARK: - Public methods

    public func getObjectsData(completion: @escaping (Result<ResponseData, ServiceError>) -> Void) {
        let path = Constants.placesPath
        let params = ["id": Constants.placesId]
        
        guard let url = getURL(path: path, params: params)
        else { return }
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(.serverError))
                }
                debugPrint(String(describing: error))
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
                debugPrint(String(describing: error))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response.data))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.decodeError))
                }
                debugPrint("Failed to decode...")
            }
        }
        
        task.resume()
    }
}

// MARK: - Constants

extension NetworkService {
    enum Constants {
        static let scheme = "https"
        static let host = "rsttur.ru"
        static let placesPath = "/api/base-app/map/"
        static let placesId = "117"
    }
}
