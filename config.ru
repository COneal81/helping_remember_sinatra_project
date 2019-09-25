require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#Need this code in order to send PATCH and DELETE requests in CRUD
use Rack::MethodOverride

#Application is the controller class that inherits from Sinatra::Base, which is a ruby class.  It gives it 
# a rack compatable interface.
run ApplicationController

use CategoriesController
use MemoriesController
use UsersController

