:q
:qdate1=$(date +"%s")
sstableloader -d 127.0.0.1 data/mfgprod/test_results2/
date2=$(date +"%s")
diff=$(($date2-$date1))
echo ""
echo "$(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."