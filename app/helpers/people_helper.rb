module PeopleHelper
  def option_for_select_member
    options_for_select Person.all.map{ |person| [person.name, person.id] }
  end
end
