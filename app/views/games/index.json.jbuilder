json.games @games do |game|
  json.extract! game, :id, :name, :store, :status

  json.employees game.employees.by_speciality
end
