class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ticker

      t.timestamps
    end
    #ticker = ['BA', 'LMT', 'RTN', 'HON', 'GE', 'TXT', 'UTX', 'CAE', 'GD', 'NOC']
    Company.create :name => "Boeing Co", :ticker => "BA"
    Company.create :name => "Lockheed Martin Corp", :ticker => "LMT"
    Company.create :name => "Raytheon Co", :ticker => "RTN"
    Company.create :name => "Honeywell International Inc", :ticker => "HON"
    Company.create :name => "General Electric Co", :ticker => "GE"
    Company.create :name => "Textron Inc", :ticker => "TXT"
    Company.create :name => "United Technologies Corp", :ticker => "UTX"
    Company.create :name => "CAE Inc", :ticker => "CAE"
    Company.create :name => "General Dynamics Corp", :ticker => "GD"
    Company.create :name => "Northrop Grumman Corp", :ticker => "NOC"
  end
end
