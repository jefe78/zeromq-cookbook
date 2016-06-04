libsodium_tar = "libsodium-#{node['zeromq']['libsodium_version']}.tar.gz"
libsodium_tar_path = "/usr/local/src/#{libsodium_tar}"
libsodium_src_url = node['zeromq']['libsodium_src_url']
libsodium_src_dir = "/usr/local/src/libsodium-#{node['zeromq']['libsodium_version']}"

remote_file libsodium_tar_path do
  source libsodium_src_url
  checksum node['zeromq']['libsodium_sha256_sum']
  mode 0644
  action :create_if_missing
end

directory libsodium_src_dir do
  action :create
end

execute "tar --no-same-owner -zxf #{libsodium_tar} -C #{libsodium_src_dir} --strip-components 1" do
  cwd "/usr/local/src"
  creates File.join(libsodium_src_dir, 'configure')
end

execute 'libsodium compile and install' do
  environment({'PATH' => '/usr/local/bin:/usr/bin:/bin'})
  command "./autogen.sh && ./configure --prefix=#{node['zeromq']['dir']} && make && make install"
  cwd libsodium_src_dir
  creates File.join(node['zeromq']['dir'], 'lib', 'libsodium.so')
end
