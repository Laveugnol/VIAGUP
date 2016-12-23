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
      (part_assign / part_total)*100
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

end
