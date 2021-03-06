require_relative "../../config/environment"

namespace :metadata do
  desc "Initiate a metadata harvest job"
  task :harvest, [:org, :project_org] do |_t, args|
    args.with_defaults(:org => ENV["GITHUB_ORG"])
    raise "No organization found. Set the GITHUB_ORG env variable or provide an argument to this task." if args.org.nil?
    HarvestMetadataJob.perform_now(args.org, args.project_org)
  end
end
