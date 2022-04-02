
module Search
  class MostDownloadsOption
    def apply(gems)
      gems.sort! { |a,b| b.downloads <=> a.downloads }
    end
  end
end
