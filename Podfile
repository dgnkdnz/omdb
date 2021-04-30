workspace 'Loodos.workspace'
# platform :ios, '9.0'

project 'Loodos', {
	'Development' => :debug,
	'Production' => :release
}

$alamofire_version = '~> 5.2'

def my_pods
	pod 'Alamofire', $alamofire_version
end

target 'Loodos' do
	project 'Loodos.xcodeproj'
  use_frameworks!
	my_pods
end
