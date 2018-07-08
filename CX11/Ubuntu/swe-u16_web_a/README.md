# Vagrant  U16_web_A + CX11
V0.1 от 6.04.18

## Описание
Данный Vagrant проект позволяет вам развернуть на локальной машине виртуальную среду, представляющую собой  SWE U16_web_A и HWE CX11 (см. соответсвующие разделы Wiki).
Для работы Вам потребуется установленный на машине Virtualbox версии не ниже 5.0 и Vagrant, версии не ниже 2.0.
Виртуальная машина создается на основании Base Vagrant Box ubuntu/xenial64 (https://app.vagrantup.com/ubuntu/boxes/xenial64). Вы можете сами установить его, выполним команду "*vagrant box add ubuntu/xenial64*" либо он будет автоматически скачан при первом запуске проекта (просто потребует дополнительное время на инициализацию).

## Структура проекта
Структура проекта представляет собой следующее дерево каталогов и файлов:

**Основной каталог** - содержит все материалы проекта. Будет скопирован к Вам на машину при вводе команды "git clone"   
├── **configs** - в этом каталоге содержатся конфигурационные файлы, которые должны быть загружены в ВМ   
│   ├── apache.conf - конфигурационный файл веб сервера apache   
│   └── README.md   
├── **other** - прочие файлы проекта   
│   ├── **info.php** - скрипт, выполняющий проверку работоспособности php   
│   └── README.md   
├── README.md   
├── **scripts** - Скрипты, необходимые для провиженинга и кастомизации ВМ.   
├── **sources** - каталог для исходных кодов. Монтируется внутрь ВМ в папку /var/www/site   
│   └── README.md   
├── **ssh_keys** - каталог для ssh ключей. Пока не используется но создан на будущее   
│   └── README.md   
├── **u16_web_n.sh** - скрипт установки Software и выполнения предконфигурации ВМ   
└── **Vagrantfile** - файл конфигурации для vagrant, содержащий описание ВМ и механизмов провиженинга.   

## Особенности
После выполнения всех операций, Вы получаете ВМ, с предустановленным и преднастроенным ПО.
Основной каталог проекта автоматически монтируется в ВМ и доступен по пути /vagrant. Каталог Sources доступен как /var/www/site, с уже установленными правами владения для пользователя и группы www-data.

Ip адрес ВМ - 192.168.100.100 и может быть изменен по вашему усмотрению.

## Управление
Основные команды управления:

 - vagran up - создать (при первом запуске) или включить (ранее выключенную) ВМ.
 - vagrant destroy - уничтожить ВМ.
 - vagrant reload - принудительно перезагрузить ВМ
 - vagrant snapshot -управление снапшотами ВМ (создать, посмотреть список, вернуться)
 - vagrant ssh - подключиться к консоли ВМ (работает только для гостевых ВМ на базе Linux)
 - vagrant hult - выключить вм
 - vagrant suspend - остановить ВМ ( сохранив ее состояние)
 - vagrant global-status - список созданных с помощью Vagrant  и их состояние.

Полный список команд и их опций можно узнать по следующей ссылке: https://www.vagrantup.com/docs/cli/snapshot.html

## П.С.
Все действия с ВМ, изначально созданной через интерфейс Vagrant, необходимо производить так же через него, несмотря на то, что ВМ доступна вам в интерфейсе Virtualbox. Vagrant сохраняет информацию о состоянии ВМ в своем файле метаданных, а не получает эту информацию от Virtualbox.
