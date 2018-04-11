namespace :utils do
  desc "Out put the structure of categories"
  task(:output_sub_in_cat => :environment) do


    Category.all.each do |cat|
      puts "Main category '#{cat.name}' id=#{cat.id} have #{cat.sub1_categories.count} sub1categories"
      puts "Main category '#{cat.name}' id=#{cat.id} have #{cat.sub2_categories.count} sub2categories"
      puts "This categoty contains #{Category.find(cat.id).products.all.count} products"
      puts "--------------------------------"
    end

    puts "/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*"
    puts "--------------------------------------"

    Sub1Category.all.each do |cat|
      puts "Sub1_category '#{cat.name}' id=#{cat.id} have #{cat.sub2_categories.count} sub2categories"
      puts "This sub1_categoty contains #{Sub1Category.find(cat.id).products.all.count} products"
      puts "--------------------------------"
    end

    puts "/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*"
    puts "--------------------------------------"

    Sub2Category.all.each do |cat|
      puts "This #{cat.name} sub2_categoty contains #{Sub2Category.find(cat.id).products.all.count} products"
      puts "--------------------------------"
    end

=begin

    puts "Input category's id, to see sub1_categories list:"
    id = STDIN.gets.chomp
    puts Category.find(id).name + " has such subcategories:"
    Category.find(id).sub1_categories.all.each do |name|
      puts name.name + '; id =' + name.id.to_s

    end
    puts "---------------------------------"

    puts "Input sub1_category's id, to see sub2_categories list:"
    sub1_id = STDIN.gets.chomp
    puts Sub1Category.find(sub1_id).name + " has such subcategories:"
    Sub1Category.find(sub1_id).sub2_category.all.each do |name|
      puts name.name + '; id =' + name.id.to_s

    end
    puts "---------------------------------"

    puts "Input category's id, to see sub2_categories list:"
    cat_id = STDIN.gets.chomp
    if Category.find(cat_id).sub2_category.all.count > 0
      puts Category.find(cat_id).name + " has such sub2_categories:"
      Category.find(cat_id).sub2_category.all.each do |name|
        puts name.name + '; id =' + name.id.to_s
      end
    else
      puts "There are no sub2_categories in #{Category.find(cat_id).name} category."
    end


    puts "---------------------------------"
    puts "Input category's id, to see products list :"
    cat_id = STDIN.gets.chomp
    if Category.find(cat_id).products.all.count > 0
    puts Category.find(cat_id).name + " has products:"

    Category.find(cat_id).products.all.each do |name|
    puts name.name + '; id = ' + name.id.to_s + '; url = ' + name.url.to_s
  end

    else
    puts "There are no products in #{Category.find(cat_id).name} category."
  end
=end


  end
end