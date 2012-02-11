Seedly::Application.routes.draw do
  root :to => 'content#index'
  match "/choose_kit" => "content#choose_kit"
  match "/about" => "content#about"
  match "/how_this_works" => "content#how_this_works"
end
