Seedly::Application.routes.draw do
  root :to => 'content#index'
  match "/about_kits" => "content#about_kits"
  match "/about" => "content#about"
  match "/how_this_works" => "content#how_this_works"
end
