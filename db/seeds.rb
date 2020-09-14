table_names = %w(dishes allergies workers customers box_kinds)
table_names.each do |table_name|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Createing #{table_name}..."
    require path
  end
end

    
