#!/usr/bin/env ruby

git_bundles = [
]

hg_bundles = [
]

vim_org_scripts = [
  ["IndexedSearch",     "7062",  "vim"],
  ["a",                 "7218",  "vim"],
  ["c",                 "13077", "zip"]
  ["mru",               "11919", "vim"],
  ["omnicppcomplete",   "7722",  "zip"],
  ["vimball",           "11981", "tar.gz"],
]
require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

notrash = ARGV.include?('--notrash')

unless notrash
  puts "Trashing everything (lookout!)"
  Dir["*"].each {|d| FileUtils.rm_rf d }
end

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

hg_bundles.each do |url|
  dir = url.split('/').last.sub(/\.vim$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `hg clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".hg"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "  Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.#{script_type}")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
  if script_type == 'zip'
    %x(unzip -d #{name} #{local_file})
  end
  if script_type == 'tar.gz'
    %x(tar zxf #{local_file} -C #{name})
  end
end
