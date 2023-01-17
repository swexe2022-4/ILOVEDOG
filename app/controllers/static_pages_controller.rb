class StaticPagesController < ApplicationController
  def home
    return @items = Item.all.limit(3) unless current_user

    dog = User.find(current_user.id)&.dogs.first
    if dog
      dog_age = (Date.today.strftime("%Y%m%d").to_i - dog.birthday.strftime("%Y%m%d").to_i) / 10000
      if dog_age == 0
        @items = Item.all.where(target_age: '幼時期／成長期用フード').limit(3)
      elsif 1 <= dog_age && 6 >= dog_age
         @items = Item.all.where(target_age: '維持期フード').limit(3)
      else
         @items = Item.all.where(target_age: 'シニア期用フード').limit(3)
      end
    else
      @items = Item.all.limit(3)
    end
  end

  def help; end

  def about; end

  def contact; end
end
