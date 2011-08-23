set -x
ctags -R -f ~/.vim/cubit.tags --c++-kinds=+pl --fields=+iaS --extra=+q /usr/local/ATD/cubit/cubit
ctags -R -f ~/.vim/kaboodle.tags --c++-kinds=+pl --fields=+iaS --extra=+q /usr/local/ATD/kaboodle/kaboodle
ctags -R -f ~/.vim/qbus.tags --c++-kinds=+pl --fields=+iaS --extra=+q /home/nsmith/projects/qbus
#ctags -R -f ~/.vim/boost.tags --c++-kinds=+p --fields=+iaS --extra=+q /usr/local/ATD/boost/ATD1_44_0
#ctags -R -f ~/.vim/ndds.tags --c++-kinds=+p --fields=+iaS --extra=+q /home/nsmith/projects/atddds_release3/atddds
#ctags -R -f ~/.vim/rti.tags --c++-kinds=+p --fields=+iaS --extra=+q /home/nsmith/projects/rti/releases/ndds.4.2e 
#ctags -R -f ~/.vim/ace.tags --c++-kinds=+p --fields=+iaS --extra=+q /home/nsmith/projects/ACE_wrappers/ace
