# InterestingPlaces SwiftUI + MVVM
Приложение для показа интересных мест Приморья.

# Использованный стек
SwiftUI, Kingfisher, Animations, URLSession, UserDefaults, GCD.

# Паттерны
SimpleFactory, Caretaker

# Описание

* При запуске приложения происходит загрузка данных с RestAPI или же, в случае отсутствия интернет-подключения, с диска пользователя сохраненных при прошлой загрузке данных.
* Стартовый экран - категории всех интересных мест Приморья.

![1](https://user-images.githubusercontent.com/81301775/236991026-6c676800-c674-495d-b69c-bddccf68eb7f.png)

* При тапе на категорию попадаем на экран интересных мест определенной категории.

![2](https://user-images.githubusercontent.com/81301775/236991277-70d6507a-5be5-4bee-90d0-741b6b4e330f.png)

* При тапе на конкретное место попадаем на экран подробной информации. Если у места ограничено возможное время посещения, то появится информация о графике работы. Тапаем на "Проложить маршрут" и попадаем в приложение 2ГИС, если оно установлено у пользователя, либо попадаем в AppStore на страницу с 2ГИС.

![3](https://user-images.githubusercontent.com/81301775/236992343-a032f290-da56-417c-ad79-5ae2e4cf3192.png)

![4](https://user-images.githubusercontent.com/81301775/236992392-72b24b97-5b6b-49c5-9bb6-d7e6f4194a33.png)

![5](https://user-images.githubusercontent.com/81301775/236992435-a452bd20-8da5-44a1-a1d3-63358972431d.png)

![6](https://user-images.githubusercontent.com/81301775/236992457-3f7e9ed9-7ec8-4bd9-ad83-2c321c8d7a93.png)
