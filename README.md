# InterestingPlaces SwiftUI + MVVM
Приложение для показа интересных мест Приморья.

# Использованный стек
SwiftUI, Kingfisher, Animations, URLSession, UserDefaults, GCD.

# Паттерны
SimpleFactory, Caretaker

# Описание

* При запуске приложения происходит загрузка данных с RestAPI или же, в случае отсутствия интернет-подключения, с диска пользователя сохраненных при прошлой загрузке данных.
* Стартовый экран - категории всех интересных мест Приморья.

![1](https://user-images.githubusercontent.com/81301775/236993383-9b493cdc-314d-46bb-a9d9-d61e8571738b.png)

* При тапе на категорию попадаем на экран интересных мест определенной категории.

![2](https://user-images.githubusercontent.com/81301775/236993627-d4c98a24-eadc-4dbb-a8b7-b1f91fd949df.png)

* При тапе на конкретное место попадаем на экран подробной информации. Если у места ограничено возможное время посещения, то появится информация о графике работы. Тапаем на "Проложить маршрут" и попадаем в приложение 2ГИС, если оно установлено у пользователя, либо попадаем в AppStore на страницу с 2ГИС.

![3](https://user-images.githubusercontent.com/81301775/236993677-e504e02e-4341-4018-903a-abd7d04f7c32.png) ![4](https://user-images.githubusercontent.com/81301775/236993706-aa6fca77-6597-4581-b5fc-4b2bb8cf7a39.png)

![5](https://user-images.githubusercontent.com/81301775/236993907-a0b196b2-d94c-415c-a8b2-360226a88945.png) ![6](https://user-images.githubusercontent.com/81301775/236993967-d6a5cf93-b6db-408c-b200-1d07f0412806.png)

