Pod::Spec.new do |s|
  s.name     = 'MAFlowLayout'
  s.version  = '1.0.1'
  s.license  = 'MIT'
  s.summary  = 'MACollectionViewFlowLayout is a subclass of UICollectionViewLayout that could position cell via various cell's height.'
  s.homepage = 'https://github.com/oenius/MAFlowLayout'
  s.author   = { 'oenius.jou' => 'jou@oenius.com' }
  s.source   = { :git => 'https://github.com/oenius/MAFlowLayout.git', :tag => '1.0.1' }
  s.description = 'Lays out cells with various heights on the page.  The cells are positioned in a patch-work layout so each fits next to the other, leaving no extra spaces when possible'
  s.source_files = 'MAFlowLayout'
  s.platform = :ios, '6.0'
  s.requires_arc = true
end
