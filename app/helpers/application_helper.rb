module ApplicationHelper

  def separateur(arg)
    arg.to_s.split("").reverse.each_slice(3).map {|y| y.join("").reverse}.reverse.join(" ")
  end

  def share_assigned_percentage(viager)
    part_dispo = RenteShare.where(viager_id: viager.id, assign: false).count
    part_assign = RenteShare.where(viager_id: viager.id, assign: true).count
    part_total = RenteShare.where(viager_id: viager.id).count
    if part_total == part_dispo
      0
    else
      ((part_assign.to_f / part_total)*100).round(2)
    end
  end

  def part_available_count(viager)
    RenteShare.where(viager_id: viager.id, assign: false).count
  end

  def part_available_object(viager)
    RenteShare.where(viager_id: viager.id, assign: false)
  end

  def bouquet_available_object(viager)
    BouquetShare.where(viager_id: viager.id, assign: false)
  end

  #  utile pour le premier tableau d'épargne

  def number_of_mensuality(viager)
    acquisition_date = viager.acquisition
    ((Time.now-viager.acquisition)/(60*60*24))/30.4375
  end

  def number_of_share(user, viager)
    RenteShare.where(viager_id: viager.id, assign: true, user_id: user.id).count
  end

  def find_viagers_launched(user)
    id = user.id
    viagers = []
    viagers_launched_per_user = []
    Viager.all.each do |viager|
      if viager.acquisition != nil
        viagers << viager
      end
    end
    viagers.each do |viager|
      if RenteShare.where(viager_id: viager.id, assign: true, user_id: id).count != 0
        viagers_launched_per_user << viager
      end
    end
    viagers_launched_per_user
  end


  def find_viagers_not_launched_yet(user)
    id = user.id
    viagers = []
    viagers_launched_per_user = []
    Viager.all.each do |viager|
      if viager.acquisition == nil
        viagers << viager
      end
    end
    viagers.each do |viager|
      if RenteShare.where(viager_id: viager.id, assign: true, user_id: id).count != 0
        viagers_launched_per_user << viager
      end
    end
    viagers_launched_per_user
  end

end
