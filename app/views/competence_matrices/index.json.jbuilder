json.array!(@competence_matrices) do |competence_matrix|
  json.extract! competence_matrix, :id, :name
  json.url competence_matrix_url(competence_matrix, format: :json)
end
