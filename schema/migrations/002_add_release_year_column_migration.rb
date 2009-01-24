migration 2, :add_release_year_column  do
  up do
    modify_table :albums do
      add_column("release_year", Integer)
    end
  end

  down do
    modify_table :albums do
      drop_column(release_year)
    end 
  end
end
