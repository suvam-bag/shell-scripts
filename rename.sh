cd /home/yolo/google_street_view/test_images
dummy="_"
classNo=1
for dir in `ls /home/yolo/google_street_view/test_images`;
do
    foo="Hello"
    tempClass="class$classNo"
    imageNo=1
    cd $dir 
    for f in *.jpg;
    do
      ls
      tempImage="image$imageNo$dummy$classNo"
      mv "${f}" "${tempImage}.jpg"
      ((imageNo+=1)) 
    done
    cd /home/yolo/google_street_view/test_images
    name="$tempClass $dir"
    echo $name >> file.txt
    mv $dir $tempClass
    ((classNo+=1))
done
cat file.txt

