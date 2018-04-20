require 'mechanize'

namespace :utils do
  desc "Pars sub1 categories structure and save it to db"
  task(:pars_sub1_categories => :environment) do


    agent = Mechanize.new()

    begin
    page = agent.get("https://www.tvdirect.tv/health?___from_store=th&___store=en")
    rescue Mechanize::RedirectLimitReachedError => error
      puts "The main page is not available for parsing" + error.message
    end

    sub1_url_list = page.search("//a[starts-with(@class, 'level1')]/@href").to_a   #find all subcategories's urls

    url_name = {}

    Category.all.each do |cat|

      sub1_url_list.each do |url|

          if url.to_s.include?(cat.url.to_s)

            name = page.search("//a[@href='#{url.to_s}'][starts-with(@class, 'level1')]").text
            url_name[name] = url.to_s
            categories = Sub1Category.find_by(name: name)

            if !categories
              category = cat.sub1_categories.build(:name=>name,
                                      :url=>url_name[name],
                                      :category_id=>cat.id
                                      )
              category.save
              puts "#{name} sub1 category doesn't exist, saved to db #{name} => #{url_name}"
            else
              puts "#{name} already exists in db"
            end

          end
      end #of sub1 each
        puts "---------------------------------"
    end #of Category each
  end
end