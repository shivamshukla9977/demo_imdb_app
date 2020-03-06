module MoviesHelper
  def option_for_select_role(selected = nil)
    base_option_for_select(Role.all.map{ |role| [role.title, role.id] }, selected)
  end

  def option_for_select_genre(selected = nil)
    base_option_for_select(Genre.all.map{ |genre| [genre.title, genre.id] }, selected)
  end

  def option_for_select_filter(selected = nil)
    base_option_for_select(%w[Movies Genre Actor], selected)
  end

  def movie_cast
    #@movie.movie_casts.order(created_at: :asc).all.map { |cast| [cast.role.title, cast.person.name]}
  end

  def base_option_for_select(options, selected = nil)
    if selected
      options_for_select(options, selected)
    else
      options_for_select(options)
    end  
  end

end
