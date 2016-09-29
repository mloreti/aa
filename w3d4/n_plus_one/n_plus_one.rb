def better_tracks_query
    albums = self.albums
      .select("albums.*, COUNT(*) AS tracks_count")
      .join(:tracks)
      .group("albums_id")

    album_counts = {}
    albums.each do |album|
      album_counts[album.name] = album.tracks_count
    end
    album_counts
end

def better_seeds_query
  plants = self.plants.includes(:seeds)
  seeds  = []

  plants.each do |plant|
    seeds << plant
  end

  seeds
end

def better_seeds_query
  buses = self.buses.includes(:drivers)

  all_drivers = {}
  buses.each do |bus|
    drivers = []
    bus.drivers.each do |driver|
      drivers << drivers.name
    end
    all_drivers[bus.id] = drivers
  end
  all_drivers
end
