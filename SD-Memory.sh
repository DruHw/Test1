#!/bin/bash
MY_DIRECTORIES="/home /var/log /etc"
echo "10 директорий"
for DIR in $MY_DIRECTORIES
do
	echo "В $DIR директории"
     	du -S $DIR 3>/dev/null |
	sort -rn   |
	head|				# head по умолчанию выыводит первые 10 строчек (мега удобно для такого случая, но наверное если нужно что бы все папки просмотреть то sed лучше)
	cat -n |			# cat -n выводит всё содержимое и нумерует его автоматом (так же удобнее, но не знаю работает ли это если нужно больше 10 строк и юзаешь sed)
	awk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'	
done
#du -S /var/log | 					#Команад du -S /var/log выводит данные о размере занятой памяти в папке /var/log
#	sort -rn |				#Команда sort -rn сортирует список по числовому уменьшению и выводит самое большое значение вверх -r(самое большое значение вверх) -n(задает порядок значений)
#	sed '{11,$D; =}' |				# sed это потоковый редактор, тут мы удаляем все строки начиная с 11 $D-параметр
#	sed 'N; s/\n/ /' |				#Тут добавляем номер для кождой строки, за это отвечает N 	
#	awk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'	#awk - утилита, которая используется для фильтрации и обработки текста. printf - вывести на экран, $1-номер строки, $2-объем дискового пространства, $3-							имя папки. \t-табуляция, \n-перекидывает на следующую строку вывод текста


#sed '{11,$D; =}' |
#sed 'N; s/\n/ /' |
#Первый sed удалит из потока все строки, начиная с одиннадцатой, и пронумерует результат таким образом, что номер строки будет выше самой строки (строкой выше).
#Второй sed удалит возврат каретки из нечётных строк и тем самым объединит строку с номером со строкой с информацией о каталоге.


