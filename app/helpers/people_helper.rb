module PeopleHelper
  def option_for_select_member(selected = nil)
    options = Person.all.map{ |person| [person.name, person.id] }
    if selected
      options_for_select(options, selected)
    else
      options_for_select(options)
    end  
  end
end
