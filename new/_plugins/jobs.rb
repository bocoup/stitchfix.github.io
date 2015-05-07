module Jekyll
  module Jobs
    def find_jobs(jobs, filter)
      list = []

      jobs.map do |team|
        teamname = team['teamname']
        team['jobs'].map do |job|
          job['team'] = teamname
        end
      end

      if filter != ''
        selected = jobs.select do |team|
          team['teamname'] == filter
        end

        list = selected[0]['jobs']
      elsif
        jobs.each do |team|
          list += team['jobs']
        end
      end

      list
    end
  end
end

Liquid::Template.register_filter(Jekyll::Jobs)
