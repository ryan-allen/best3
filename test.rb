require_relative 'best3'

#puts s3.inspect
#(130..140).each do |n|
#  puts s3.('PUT', "/ryan-s3-testing/dog#{n}.png", {'x-amz-acl' => 'public-read', 'x-amz-meta-fark' => 'omgwtf', 'Content-Type' => 'image/png'}, open('./dog.png')).code
#end
#puts s3.('HEAD', '/dog1.png', {'Host' => 'ryan-s3-testing.s3.amazonaws.com'}).inspect # why are they in an array?
#puts s3.('HEAD', '/dog1.png', {'Host' => 'ryan-s3-testing.s3.amazonaws.com'}).inspect # why are they in an array?
#puts s3.('HEAD', '/ryan-s3-testing/dog1.png').headers_hash.inspect # why are they in an array?
#puts s3.('PUT', '/dog.png', {'x-amz-meta-rand' => (rand() * 1000).to_i.to_s, 'x-amz-acl' => 'public-read', 'x-amz-storage-class' => 'STANDARD', 'x-amz-metadata-directive' => 'REPLACE', 'x-amz-copy-source' => '/ryan-s3-testing/dog.png'}).inspect
#puts s3.('GET', '/').inspect
#puts s3.('GET', '/?versioning').inspect
#puts s3.('GET', '/?policy').inspect
#puts s3.('GET', '/?logging').inspect
#puts s3.('GET', '/?location').inspect

#puts s3.('HEAD', '/dog1.png', {'Host' => 'ryan-s3-testing.s3.amazonaws.com'}).headers_hash.inspect

s3 = Best3('AKIAIB2MZTVHYNT4TJUA', open('.secret') { |f| f.read }.chomp).s3
puts s3.('GET', '/').body.css('Buckets Name').collect { |el| el.inner_html }.inspect
puts s3.('HEAD', '/ryan-s3-testing/dog1.png').headers.inspect
puts s3.('PUT', '/ryan-s3-testing/doggy.png', {'Content-Type' => 'image/png', 'x-amz-acl' => 'public-read'}, open('./dog.png') { |f| f.read }).headers.inspect
