#!/usr/bin/env ruby

git_bundles = [
  "http://github.com/scrooloose/nerdtree.git",
  "http://github.com/scrooloose/nerdcommenter.git",
  "http://github.com/tpope/vim-fugitive.git",
  "http://github.com/tpope/vim-surround.git",
  "http://github.com/tpope/vim-repeat.git",
  "http://github.com/astashov/vim-ruby-debugger.git",
  "http://github.com/tsaleh/vim-align.git",
  "http://github.com/ervandew/supertab.git",
  "http://github.com/vim-ruby/vim-ruby.git"
]

hg_bundles = [
]

vim_org_scripts = [
  ["taglist",           "7701",  "zip"],
  ["yankring",          "13554", "zip"],
  ["vcscommand",        "13751", "zip"],
  ["vimball",           "11981", "tar.gz"],
  ["a",                 "7218",  "vim"],
  ["IndexedSearch",     "7062",  "vim"],
  ["bufexplorer",       "12904", "zip"],
  ["mru",               "11919", "vim"],
  ["commandt",          "11919", "vim"],
  ["omnicppcomplete",   "7722",  "zip"],
  ["c",                 "13077", "zip"]
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
