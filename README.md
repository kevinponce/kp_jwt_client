# KpJwtClient
A simplistic jwt authentication for rails api.

# Getting Started

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'kp_jwt_client'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install kp_jwt_client
```

Run the install generator:
```
$ rails generate kp_jwt_client:install
```

It will create an initializers.


### Secure
Include the KpJwt::Auth module in your ApplicationController
```ruby
class ApplicationController < ActionController::Base
  include KpJwt::Auth
end
```

Simply add authenticate_user! before action to the actions you need to secure
```ruby
class SecuredController < ApplicationController
  before_action :authenticate_user!
end
```

## Contributing

1. Fork it ( https://github.com/kevinponce/kp_jwt_client )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
