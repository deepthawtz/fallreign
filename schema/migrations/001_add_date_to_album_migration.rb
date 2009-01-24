migration 1, :add_date_to_album  do
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
