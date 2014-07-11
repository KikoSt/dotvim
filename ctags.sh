#!/bin/bash
cd /var/www/www.merchantcenter.dev/
exec ctags-exuberant -f ~/.vim/mytags/merchantcenter \
-h \".php\" -R \
--exclude=\"\.git\" \
--exclude=public/scripts \
--exclude=public/jqwidgets \
--exclude=public/jqwidgets* \
--totals=yes \
--tag-relative=yes \
--PHP-kinds=+cf \
--regex-PHP='/abstract class ([^ ]*)/\1/c/' \
--regex-PHP='/interface ([^ ]*)/\1/c/' \
--regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'
