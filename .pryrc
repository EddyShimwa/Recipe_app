Pry.config.color = true if Pry::Helpers::BaseHelpers.respond_to?(:in_term?) && Pry::Helpers::BaseHelpers.in_term?
