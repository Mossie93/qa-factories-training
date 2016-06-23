class App < SitePrism::Page
  def countries_page
    CountriesPage.new
  end

  def birds_page
    BirdsPage.new
  end

  def bird_page
    BirdPage.new
  end
end
