module SearchesHelper
  def option_for_select_person
    options_for_select Person.all.map{ |person| [person.name, person.id] }
  end
end
