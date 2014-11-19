module AbilitiesHelper
  def destroy? value
    value.competences.empty?
  end
end
