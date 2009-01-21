module ArtistNameHelper
  def name_not_empty?(stripped_name)
    if stripped_name == '' || stripped_name.length < 1
      [false, "Please enter a sensible name with at least 3 significant characters"]
    else
      true
    end
  end
end