<div align="center">
  <a href="https://ton.org">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://ton.org/download/ton_logo_dark_background.svg">
      <img alt="TON logo" src="https://ton.org/download/ton_logo_light_background.svg">
    </picture>
  </a>
  <h3>Эталонная реализация узла TON и инструментов</h3>
  <hr/>
</div>

## 
[![TON Overflow Group][ton-overflow-badge]][ton-overflow-url]
[![Stack Overflow Group][stack-overflow-badge]][stack-overflow-url]
[![Telegram Community Chat][telegram-tondev-badge]][telegram-tondev-url]
[![Telegram Community Group][telegram-community-badge]][telegram-community-url]
[![Telegram Foundation Group][telegram-foundation-badge]][telegram-foundation-url]
[![Twitter Group][twitter-badge]][twitter-url]

[telegram-foundation-badge]: https://img.shields.io/badge/TON%20Foundation-2CA5E0?logo=telegram&logoColor=white&style=flat
[telegram-community-badge]: https://img.shields.io/badge/TON%20Community-2CA5E0?logo=telegram&logoColor=white&style=flat
[telegram-tondev-badge]: https://img.shields.io/badge/chat-TONDev-2CA5E0?logo=telegram&logoColor=white&style=flat
[telegram-foundation-url]: https://t.me/tonblockchain
[telegram-community-url]: https://t.me/toncoin
[telegram-tondev-url]: https://t.me/tondev_eng
[twitter-badge]: https://img.shields.io/twitter/follow/ton_blockchain
[twitter-url]: https://twitter.com/ton_blockchain
[stack-overflow-badge]: https://img.shields.io/badge/-Stack%20Overflow-FE7A16?style=flat&logo=stack-overflow&logoColor=white
[stack-overflow-url]: https://stackoverflow.com/questions/tagged/ton
[ton-overflow-badge]: https://img.shields.io/badge/-TON%20Overflow-FE7A16?style=flat&logo=stack-overflow&logoColor=white
[ton-overflow-url]: https://answers.ton.org



Основное монорепо TON, включающее код узла/валидатора, lite-клиента, tonlib, компилятора FunC и т.д.

## The Open Network

__The Open Network (TON)__ - это быстрый, безопасный, масштабируемый блокчейн, ориентированный на обработку _миллионов транзакций в секунду_ (TPS) с целью охватить сотни миллионов пользователей блокчейна.
- Чтобы узнать больше о различных аспектах блокчейна TON и лежащей в его основе экосистеме, ознакомьтесь с [документацией](https://ton.org/docs).
- Чтобы запустить ноду, валидатор или lite-сервер, проверьте [раздел "Участие"](https://ton.org/docs/participate/nodes/run-node)
- Для разработки децентрализованных приложений проверьте [Tutorials](https://ton.org/docs/develop/smart-contracts/), [FunC docs](https://ton.org/docs/develop/func/overview) и [DApp tutorials](https://ton.org/docs/develop/dapps/)
- Для работы с TON проверьте [кошельки](https://ton.app/wallets), [explorers](https://ton.app/explorers), [DEXes](https://ton.app/dex) и [utilities](https://ton.app/utilities)
- Для взаимодействия с TON проверьте [API](https://ton.org/docs/develop/dapps/apis/)

## Обновления

* **мастер-ветка** - основная сеть работает на этой стабильной ветке.

    Только экстренные обновления, срочные обновления или обновления, которые не влияют на основную кодовую базу (рабочие процессы GitHub / образы докеров / документация), фиксируются непосредственно в этой ветке.

* **testnet branch** - на этой ветке запущен testnet. Ветка содержит набор новых обновлений. После тестирования ветка testnet сливается с основной веткой, а затем в ветку testnet добавляется новый набор обновлений.

* **backlog** - другие ветки, которые являются кандидатами на попадание в ветку testnet в следующей итерации.

Обычно в ответе на ваш pull request будет указано, в какую секцию он попадает.


## "Мягкие" правила Pull Request

* Вы не должны сливать свои собственные PR, по крайней мере один человек должен просмотреть PR и слить его (правило 4 глаз)
* Вы должны убедиться, что рабочие процессы чисто завершены для вашего PR, прежде чем рассматривать возможность слияния

## Сборка блокчейна TON

### Ubuntu 20.4, 22.04 (x86-64, aarch64)
Установите дополнительные системные библиотеки
``bash
  sudo apt-get update
  sudo apt-get install -y build-essential git cmake ninja-build zlib1g-dev libsecp256k1-dev libmicrohttpd-dev libsodium-dev
          
  wget https://apt.llvm.org/llvm.sh
  chmod +x llvm.sh
  sudo ./llvm.sh 16 all
```
Компиляция двоичных файлов TON
``bash
  cp assembly/native/build-ubuntu-shared.sh .
  chmod +x build-ubuntu-shared.sh
  ./build-ubuntu-shared.sh  
```

### MacOS 11, 12 (x86-64, aarch64)
``bash
  cp assembly/native/build-macos-shared.sh .
  chmod +x build-macos-shared.sh
  ./build-macos-shared.sh
```

### Windows 10, 11, Server (x86-64)
Сначала необходимо установить `MS Visual Studio 2022`.
Перейдите на сайт https://www.visualstudio.com/downloads/ и скачайте `MS Visual Studio 2022 Community`.

Запустите программу установки и выберите `Desktop development with C++`. 
После установки также убедитесь, что `cmake` глобально доступен, добавив
`C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin` в системный `PATH` (настройте путь в соответствии с вашими потребностями).

Откройте повышенную (Run as Administrator) командную строку `x86-64 Native Tools Command Prompt for VS 2022`, перейдите в корневую папку и выполните: 
``bash
  копировать сборку\native\build-windows.bat .
  build-windows.bat
```

### Сборка TON на WebAssembly
Установка дополнительных системных библиотек на Ubuntu
``bash
  sudo apt-get update
  sudo apt-get install -y build-essential git cmake ninja-build zlib1g-dev libsecp256k1-dev libmicrohttpd-dev libsodium-dev
          
  wget https://apt.llvm.org/llvm.sh
  chmod +x llvm.sh
  sudo ./llvm.sh 16 all
```
Компиляция двоичных файлов TON с помощью emscripten
``bash
  cd assembly/wasm
  chmod +x fift-func-wasm-build-ubuntu.sh
  ./fift-func-wasm-build-ubuntu.sh
```

### Сборка библиотеки TON tonlib для Android (arm64-v8a, armeabi-v7a, x86, x86-64)
Установка дополнительных системных библиотек на Ubuntu
``bash
  sudo apt-get update
  sudo apt-get install -y build-essential git cmake ninja-build automake libtool texinfo autoconf libgflags-dev \
  zlib1g-dev libssl-dev libreadline-dev libmicrohttpd-dev pkg-config libgsl-dev python3 python3-dev \
  libtool autoconf libsodium-dev libsecp256k1-dev
```
Компиляция библиотеки TON tonlib
``bash
  cp assembly/android/build-android-tonlib.sh .
  chmod +x build-android-tonlib.sh
  ./build-android-tonlib.sh
```

### Сборка переносимых двоичных файлов TON с помощью менеджера пакетов Nix
Сначала необходимо установить Nix.
``bash
   sh <(curl -L https://nixos.org/nix/install) --daemon
```
Затем скомпилируйте TON с помощью Nix, выполнив следующую команду из корневой папки: 
``bash
  cp -r assembly/nix/* .
  export NIX_PATH=nixpkgs=https://github.com/nixOS/nixpkgs/archive/23.05.tar.gz
  nix-build linux-x86-64-static.nix
```
Другие примеры для других платформ можно найти в разделе `assembly/nix`.  

## Запуск тестов

Тесты выполняются путем запуска `ctest` в директории сборки. Дополнительную информацию смотрите в `doc/Tests.md`.
