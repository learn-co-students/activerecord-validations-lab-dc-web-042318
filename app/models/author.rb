class Author < ActiveRecord::Base

    # app/models/property.rb

    validates :name, presence: true, uniqueness: true
    validates :phone_number, length: { is: 10 }
    

end
