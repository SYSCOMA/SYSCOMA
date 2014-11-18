module CompetenceMatricesHelper
  def destroy? object
    object.id? && object.competences.empty?
  end
end
