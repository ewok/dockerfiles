#Виртуальное окружение bitrix 5

Виртуальное окружение bitrix 5 на базе Centos 6.6. Устанавливается "родным" установщиком. Дополнительно установлен ffmpeg + phpffpmeg. Запущен cron. Установлен ssh.

##Использование:

###Простой запуск

        docker run -ti -p 80:80 -d ewok/bitrix-env
        
Сайт будет доступен по адресу http://localhost


###Доступ к ssh

####Подключение
Порт по умолчанию:

        docker run -ti -p 22:22 ewok/bitrix-env
        
SSH будет доступен по ssh *bitrix@localhost*
*пароль по умолчанию "bitrix"*

Нестандартный порт:

        docker run -ti -p 2222:22 ewok/bitrix-env
        
SSH будет доступен по *ssh bitrix@localhost -p2222*
*пароль по умолчанию "bitrix"*

####Указание собственного пароля для ssh
    
        docker run -ti -p 22:22 -e SSH_PASS=<ваш пароль> ewok/bitrix-env
   
        
###Указание часового пояса

По умолчанию выбран московский часовой пояс. Указать собственный можно:

        docker run -ti -e TIMEZONE="Europe/Moscow" ewok/bitrix-env
        

###Подключение сайта с хостовой машины

        docker run -ti -v /путь к вашему сайту/:/home/bitrix/www ewok/bitrix-env

###Ограничение памяти для контейнера
По умолчанию виртуальное окружение запускается с ограничением 256M(mysql,php). Если требуется увеличить потребление ресурсов:

256M:

        docker run -ti -e BVAT_MEM=262144 ewok/bitrix-env

512M:
        
        docker run -ti -e BVAT_MEM=524288 ewok/bitrix-env
        
        
*Объем указывается в килобайтах*

Можно ограничить память ко всему контейнеру:

        docker run -ti -e BVAT_MEM=524288 -m 512m ewok/bitrix-env
        

###Выключение встроенного mysql

Если не требуется запускать mysql внутри контейнера:

        docker run -ti -e NOMYSQL=1 ewok/bitrix-env
                