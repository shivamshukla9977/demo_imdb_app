module MoviesHelper
  def option_for_select_role
    options_for_select Role.all.map{ |role| [role.title, role.id] }
  end

  def option_for_select_genre
    options_for_select Genre.all.map{ |genre| [genre.title, genre.id] }
  end
end
