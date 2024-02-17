TON logo
Эталонная реализация узла TON и инструменты
TON Overflow Group Stack Overflow Group Telegram Community Chat Telegram Community Group Telegram Foundation Group Twitter Group

Основной монорепо TON, включающий код ноды/валидатора, lite-клиента, tonlib, компилятора FunC и т.д.

The Open Network
The Open Network (TON) - это быстрый, безопасный, масштабируемый блокчейн, ориентированный на обработку миллионов транзакций в секунду (TPS) с целью охватить сотни миллионов пользователей блокчейна.

Чтобы узнать больше о различных аспектах блокчейна TON и лежащей в его основе экосистеме, ознакомьтесь с документацией
Чтобы запустить ноду, валидатор или lite-сервер, проверьте раздел Участие
Для разработки децентрализованных приложений проверьте учебники, документацию по FunC и учебники по DApp
Работать над кошельками, эксплорерами, DEXами и утилитами TON check
Взаимодействовать с API TON check
Поток обновлений
мастер-ветка - на этой стабильной ветке работает майнет.

Только экстренные обновления, срочные обновления или обновления, которые не влияют на основную кодовую базу (рабочие процессы GitHub / образы докеров / документация), фиксируются непосредственно в этой ветке.

Ветка testnet - на этой ветке запущен testnet. Ветка содержит набор новых обновлений. После тестирования ветка testnet сливается с основной веткой, а затем новый набор обновлений добавляется в ветку testnet.

backlog - другие ветки, которые являются кандидатами на попадание в ветку testnet в следующей итерации.

Обычно в ответе на ваш pull request будет указано, в какой раздел он попадает.

Правила "мягких" запросов
Вы не должны сливать свои собственные PR, по крайней мере один человек должен просмотреть PR и слить его (правило 4 глаз).
Вы должны убедиться, что рабочие процессы чисто завершены для вашего PR, прежде чем рассматривать возможность слияния
Сборка блокчейна TON
Ubuntu 20.4, 22.04 (x86-64, aarch64)
Установите дополнительные системные библиотеки

  sudo apt-get update
  sudo apt-get install -y build-essential git cmake ninja-build zlib1g-dev libsecp256k1-dev libmicrohttpd-dev libsodium-dev
          
  wget https://apt.llvm.org/llvm.sh
  chmod +x llvm.sh
  sudo ./llvm.sh 16 all
Скомпилируйте двоичные файлы TON

  cp assembly/native/build-ubuntu-shared.sh .
  chmod +x build-ubuntu-shared.sh
  ./build-ubuntu-shared.sh  
MacOS 11, 12 (x86-64, aarch64)
  cp assembly/native/build-macos-shared.sh .
  chmod +x build-macos-shared.sh
  ./build-macos-shared.sh
Windows 10, 11, Server (x86-64)
Сначала необходимо установить MS Visual Studio 2022. Перейдите на сайт https://www.visualstudio.com/downloads/ и скачайте MS Visual Studio 2022 Community.

Запустите программу установки и выберите Desktop development with C++. После установки также убедитесь, что cmake глобально доступен, добавив C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin в системный PATH (настройте путь в соответствии с вашими потребностями).

Откройте повышенную (Run as Administrator) командную строку x86-64 Native Tools для VS 2022, перейдите в корневую папку и выполните команду:

  copy assembly\native\build-windows.bat .
  build-windows.bat
Сборка TON в WebAssembly
Установите дополнительные системные библиотеки на Ubuntu

  sudo apt-get update
  sudo apt-get install -y build-essential git cmake ninja-build zlib1g-dev libsecp256k1-dev libmicrohttpd-dev libsodium-dev
          
  wget https://apt.llvm.org/llvm.sh
  chmod +x llvm.sh
  sudo ./llvm.sh 16 all
Скомпилируйте двоичные файлы TON с помощью emscripten

  cd assembly/wasm
  chmod +x fift-func-wasm-build-ubuntu.sh
  ./fift-func-wasm-build-ubuntu.sh
Сборка библиотеки TON tonlib для Android (arm64-v8a, armeabi-v7a, x86, x86-64)
Установите дополнительные системные библиотеки на Ubuntu

  sudo apt-get update
  sudo apt-get install -y build-essential git cmake ninja-build automake libtool texinfo autoconf libgflags-dev \
  zlib1g-dev libssl-dev libreadline-dev libmicrohttpd-dev pkg-config libgsl-dev python3 python3-dev \
  libtool autoconf libsodium-dev libsecp256k1-dev
Скомпилируйте библиотеку TON tonlib

  cp assembly/android/build-android-tonlib.sh .
  chmod +x build-android-tonlib.sh
  ./build-android-tonlib.sh
Сборка переносимых двоичных файлов TON с помощью менеджера пакетов Nix
Сначала необходимо установить Nix.

   sh <(curl -L https://nixos.org/nix/install) --daemon
Затем скомпилируйте TON с помощью Nix, выполнив следующую команду из корневой папки:

  cp -r assembly/nix/* .
  export NIX_PATH=nixpkgs=https://github.com/nixOS/nixpkgs/archive/23.05.tar.gz
  nix-build linux-x86-64-static.nix
Другие примеры для других платформ можно найти в разделе assembly/nix.

Запуск тестов
Тесты выполняются путем запуска ctest в каталоге сборки. Дополнительную информацию см. в doc/Tests.md.
