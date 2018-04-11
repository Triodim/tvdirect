require 'mechanize'


namespace :utils do
  desc "Pars categories structure and save it to db"
  task(:pars_categories => :environment) do



    agent = Mechanize.new()

    page = agent.get("https://www.tvdirect.tv/health?___from_store=th&___store=en")

      #puts page.body

    #name_list = page.search("//a[starts-with(@class, 'level')]/text()").to_a #find all categories's names
    url_list = page.search("//a[starts-with(@class, 'level0')]/@href").to_a   #find all main categories's urls

      #puts url_list.last.to_s
      #puts name_list.last.to_s

    url_name = {}
    url_list.each do |url|
      name = page.search("//a[@href='#{url.to_s}']").text
      url_name[name] = url.to_s
      categories = Category.find_by(name: name)

      if !categories
        category = Category.new(:name=>name,
                                :url=>url_name[name]
                                )
        category.save
        puts "#{name} category doesn't exist, saved to db #{name} => #{url_name}"
      else
        puts "#{name} already exists in db"
      end

    end
  end
end