workspace 'Loodos.workspace'
# platform :ios, '9.0'

project 'Loodos', {
	'Development' => :debug,
	'Production' => :release
}

$alamofire_version = '~> 5.2'
$kingfisher_version =  '~> 6.0'

def my_pods
	pod 'Alamofire', $alamofire_version
	pod 'Firebase/Core'
	pod 'Firebase/RemoteConfig'
	pod 'Kingfisher', $kingfisher_version
end

target 'Loodos' do
	project 'Loodos.xcodeproj'
	use_frameworks!
	my_pods
	
	target 'LoodosTests' do
		inherit! :search_paths
	end
end
