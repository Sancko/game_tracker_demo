json.game do
  json.extract! @game, :id, :name, :store
  json.employees @game.employees.by_speciality
end
