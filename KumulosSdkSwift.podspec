
Pod::Spec.new do |s|
  s.name = "KumulosSdkSwift"
  s.version = "8.8.0"
  s.license = "MIT"
  s.summary = "Official Swift SDK for integrating Kumulos services with your mobile apps"
  s.homepage = "https://github.com/Kumulos/KumulosSdkSwift"
  s.authors = { "Kumulos Ltd" => "support@kumulos.com" }
  s.source = { :git => "https://github.com/Kumulos/KumulosSdkSwift.git", :tag => "#{s.version}" }

  s.swift_version = "5.0"
  s.ios.deployment_target = "9.0"

  s.source_files = "KumulosSdkObjC/**/*.{h,m}", "Sources/**/*.swift"
  s.exclude_files = "Carthage", "Sources/Extension", "Sources/Exports.swift"
  s.module_name = "KumulosSDK"
  s.preserve_path = 'upload_dsyms.sh'

  s.prepare_command = 'chmod +x upload_dsyms.sh'

  s.dependency "KumulosKSCrash", "1.15.21-kumulos1"

end
