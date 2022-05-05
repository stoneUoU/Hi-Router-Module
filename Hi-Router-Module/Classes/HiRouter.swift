//
//  HiRouter.swift
//  Hi-Router-Module
//
//  Created by stone on 2022/4/28.
//

import Foundation

//MARK: - 模块协议
public protocol HiRouterModuleProtocol {
    /// 模块名称
    var module: String { get }
    /// 标识
    var scheme: String { get }
    /// 路由列表 [path: className]
    var pathDic: [String: String] { get }
}

public extension HiRouterModuleProtocol {
    /**
     默认注册方法
     */
    func registerPages() {
        HiRouter.shared.registerModule(module, scheme: scheme, pathDic: pathDic)
    }
}

//MARK: - 路由
public class HiRouter: NSObject {
    public static let shared = HiRouter()
    // 错误通知
    public static let routerErrorNotificaiton = "RouterErrorNotificaiton"
    
    // [scheme: [path: className]]
    private lazy var schemeDic = [String: [String: String]]()
    // [scheme: moduleName]
    private lazy var moduleDic = [String: String]()
}

//MARK: - Public Action
public extension HiRouter {
    /**
     模块注册
     
     - 模块注册调用该方法
     
     - parameter module: 模块名称
     - parameter scheme: 标识
     - parameter pageClassName: 页面名称
     */
    func registerModule(_ module: String, scheme: String, pathDic: [String: String]) {
        if moduleDic[scheme] == nil {
            moduleDic[scheme] = module
        }
        
        if schemeDic[scheme] == nil {
            schemeDic[scheme] = [String: String]()
        }
            
        schemeDic[scheme] = pathDic
    }
    
    /**
     获取控制器
     
     - parameter url: 路由
     - parameter parameters: 传参
     - parameter callBackParameters: 目标参数回调
     
     - returns: 返回一个 UIViewController 控制器
     */
    func viewController(_ url: String, parameters: [String : Any]? = nil, callBackParameters: (([String: Any]) -> Void)? = nil) -> UIViewController? {
        guard let decoude = decoudeUrl(url),
              let module = moduleDic[decoude.scheme],
              let className = schemeDic[decoude.scheme]?[decoude.path] else {
            
            return nil
        }
        
        if let pageClass = HiRouter.moduleAnyClass(module, className: className),
           let pageType = pageClass as? UIViewController.Type {
            
            return pageType.routerController(parameters, callBackParameters: callBackParameters)
        }else {
            return nil
        }
    }
    
    /**
     发送路由跳转错误通知
     */
    func postRouterErrorNotification() {
        NotificationCenter.default.post(name: .init(HiRouter.routerErrorNotificaiton),
                                        object: nil,
                                        userInfo: nil)
    }
}

//MARK: - Private Action
private extension HiRouter {
    /**
     对 url 进行解码
     
     - parameter url: url
     - returns: (scheme: 标识, path: 路径)?
     */
    func decoudeUrl(_ url: String) -> (scheme: String, path: String)? {
        let urlAry = url.components(separatedBy: "://")
        guard urlAry.count >= 2 else {
            return nil
        }
        
        return (urlAry[0], urlAry[1])
    }
}

//MARK: - OtherAction
public extension HiRouter {
    /**
     通过类名获取一个类
     
     - parameter moduleName: 模块名称
     - parameter className: 类名称
     */
    class func moduleAnyClass(_ moduleName: String, className: String) -> AnyClass? {
        var frameworksUrl = Bundle.main.url(forResource: "Frameworks", withExtension: nil)
        frameworksUrl = frameworksUrl?.appendingPathComponent(moduleName)
        frameworksUrl = frameworksUrl?.appendingPathExtension("framework")

        guard let bundleUrl = frameworksUrl else { return nil }
        guard let bundleName = Bundle(url: bundleUrl)?.infoDictionary?["CFBundleName"] as? String  else {
            return nil
        }
        
        return NSClassFromString(bundleName + "." + className)
    }
}
