ActiveAdmin.register GrowingZone do
  actions :all, :except => [:destroy]
  index do
    column :name
    column :description
    column "Last Frost" do |growing_zone|
      growing_zone.last_frost.strftime("%b %d")
    end
    column "First Frost" do |growing_zone|
      growing_zone.first_frost.strftime("%b %d")
    end
    default_actions
  end
end
