require_relative 'best3'

s3 = Best3('AKIAIB2MZTVHYNT4TJUA', open('.secret') { |f| f.read }.chomp).s3
puts s3.('GET', '/ryan-s3-testing?versions').body.to_s
#puts s3.('PUT', '/ryan-s3-testing?versioning', {}, '<VersioningConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/"><Status>Enabled</Status></VersioningConfiguration>').inspect
#puts s3.('GET', '/ryan-s3-testing?versioning').body.to_s

#puts s3.('GET', '/').body.css('Buckets Name').collect { |el| el.inner_html }.inspect
#puts s3.('HEAD', '/ryan-s3-testing/dog1.png').headers.inspect
#puts s3.('PUT', '/ryan-s3-testing/doggy.png', {'Content-Type' => 'image/png', 'x-amz-acl' => 'public-read'}, open('./dog.png') { |f| f.read }).headers.inspect
#puts s3.inspect
#(130..140).each do |n|
#  puts s3.('PUT', '/ryan-s3-testing/dog-versioned.png', {'x-amz-acl' => 'public-read', 'x-amz-meta-fark' => 'omgwtf', 'Content-Type' => 'image/png'}, open('./dog.png') { |f| f.read }).headers.inspect
#end
#puts s3.('head', '/dog1.png', {'host' => 'ryan-s3-testing.s3.amazonaws.com'}).inspect # why are they in an array?
#puts s3.('head', '/dog1.png', {'host' => 'ryan-s3-testing.s3.amazonaws.com'}).inspect # why are they in an array?
#puts s3.('head', '/ryan-s3-testing/dog1.png').headers_hash.inspect # why are they in an array?
#puts s3.('put', '/dog.png', {'x-amz-meta-rand' => (rand() * 1000).to_i.to_s, 'x-amz-acl' => 'public-read', 'x-amz-storage-class' => 'standard', 'x-amz-metadata-directive' => 'replace', 'x-amz-copy-source' => '/ryan-s3-testing/dog.png'}).inspect
#puts s3.('get', '/').inspect
#puts s3.('get', '/?versioning').inspect
#puts s3.('get', '/?policy').inspect
#puts s3.('get', '/?logging').inspect
#puts s3.('get', '/?location').inspect

#puts s3.('head', '/dog1.png', {'host' => 'ryan-s3-testing.s3.amazonaws.com'}).headers_hash.inspect

