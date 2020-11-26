server '52.196.130.10', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/tomitakeisuke/.ssh/id_rsa'
