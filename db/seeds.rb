require 'csv'

#Create 6 zones
zones_data = [
  {
    name: "Discovery Corner",
    description: "Enjoy up close encounters with animals in our children's zoo area and a butterfly house in our insectarium."
  },
  {
    name: "Historic Hill",
    description: "One of the oldest areas in the zoo, Historic Hill is home to reptiles, birds, and our primate house."
  },
  {
    name: "Lakeside Crossing",
    description: "Encounter stingrays in our touch pool located just a short distance from our immersive sea lion exhibit."
  },
  {
    name: "Red Rocks",
    description: "Follow the roars to the Red Rocks zone where you'll encounter big cats, towering gentle giants, and a range of graceful hoofed animals."
  },
  {
    name: "River's Edge",
    description: "Make your way past a waterfall to enter River's Edge where you'll find the world's largest rodent species, hippos, elephants and more."
  },
  {
    name: "The Wild",
    description: "Watch a polar bear cool off in icy blue water before heading up to the Fragile Forest to get to know our chimps and gorillas."
  }
]

zones_data.each {|zone| Zone.create!(zone)}

#Import CSV exhibit data
CSV.foreach(Rails.root.join('lib/exhibit_seeds.csv'), headers: true) do |row|
  exhibit = Exhibit.create!(name: row["Name"], description: row["Description"], species_fact: row["Fact"], zone_id: row["Zone ID"])
  exhibit.image.attach(io: File.open(Rails.root.join('lib/seed-images').join(row["Image Filename"])), filename: row["Image Filename"], content_type: "image/png") 
end

#Create reviews - need to figure this out
i = 1
10.times do 
  r = Review.create(
    name: Faker::Internet.username(specifier: 6..9),
    content: Faker::Lorem.paragraph(sentence_count: 4)
  )

  filename = "review_#{i}.png"
  c.image.attach(io: File.open(image_root.join(filename)), filename: filename, content_type: "image/png")
  i += 1
end
Rails.root.join('lib/seed-images').join(row["Image Filename"])), filename: row["Image Filename"]


#Create Attractions
CSV.foreach(Rails.root.join('lib/attraction_seeds.csv'), headers: true) do |row|
  Attraction.create!(name: row["Name"], zone_id: row["Zone ID"])
end