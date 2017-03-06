Rails.application.routes.draw do
  get 'game', to: 'games#game'

  get 'score', to: 'games#score'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# 1. Generate a controller, route, view for the page game ok
# 1.a controller will give the random letters with view. Form to take the guess of the user ok
# 1.b need to check that the guess is true (inclues only letters from the grid)
# 2 Same for the score part
# 2.b just display the score coming from the controller, add a backlink to play again
