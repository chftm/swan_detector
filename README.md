![Статус проекта: Почти Закончен](https://raw.githubusercontent.com/chftm/brand/main/Project%20Status/almost_finished.svg)

# swan_detector
## О программе 🌐

Программа была создана в качестве решения задачи от [Минприроды](https://www.mnr.gov.ru/about/) хакатона "[Цифровой прорыв](https://hacks-ai.ru/)". Она предназначена для анализа изображений лебедей. Задачей было посчитать количество лебедей разных видов (всего 3 вида - кликуны, малые, шипуны).

## Использованные ЯП и библиотеки 📚

- Python:
	- [numpy](https://numpy.org/)
	- [PIL](https://pypi.org/project/Pillow/)
	- [cv2](https://pypi.org/project/opencv-python/)
	- [tensorflow](https://www.tensorflow.org/?hl=ru)
	- [ultralytics](https://ultralytics.com)
- Flutter

## Для запуска нужно ✨

- Установить [Python](https://python.org/)
- Установить библиотеки:
    `pip install ultralytics tensorflow numpy opencv-python`
- Скачать архив из раздела [releases](https://github.com/chftm/swan_classifier/releases)
- Распаковать архив
- Запустить программу

## Как работает приложение? ⚙

При запуске приложения у вас откроется такое окно (размеры частей могу отличаться в зависимости от размера окна приложения)

![ui-start | 450](https://i.imgur.com/GyyRKiZ.png)

Загрузите файл в нужную область и у вас откроется окно с информацией про лебедей.

![ui-file | 450](https://i.imgur.com/QP5uBEi.png)

Или вы можете сразу загрузить папку с фотографиями. Тогда результат будет таким.

![ui-folder | 450](https://i.imgur.com/yvdJ6bA.png)

Также вы можете нажать кнопку "Назад" чтобы загрузить файл/папку повторно.

## Принцип работы ⚒

1.  Вы загружаете изображение
2.  ИИ обрабатывает изображение и подсчитывает всю нужную информацию
3.  Результаты выводятся на экран

## Создатели ❤
 
[UltraGeoPro1966](https://github.com/Ultrageopro1966) - разработка ИИ

[SokolLonely](https://github.com/SokolLonely) - обучение моделей и разметка данных

[sh1sha](https://github.com/onl1yw) - дизайн UI

[flexagoon](https://github.com/flexagoon) - разработка UI и обучение ИИ

[FoxFil](https://github.com/FoxFil) - помощь в дизайне UI и разработке ИИ
