# Game Safe

### Changes in version 1.1 - (merge)
* Добавлены валидации на длинну в 4 символа, уникальность символов и неповторение вводимых резльтатов
* Перекладено на українську мову
* Виправлені закінчення
* Встановлено ліміт на спроби - 40 раз і GAME OVER
* Код приховано в сесії а не в куки

### Changes in version 2.0 - (merge)
* Змінено модель Game на Try(Tries), belongs_to :code
* Додано модель Code, has_many :tries
* current_code - код від сейфу, Code.id в сесії (в одному браузері 
  два вікна будуть мати один current_code, який останнім утвореться
  після натискання NEW GAME)
* Тінь курсора на NEW GAME, сірий
* Сповіщення про помилки у фреймі errors, replace
* До Code додано status: { not_over = 0, over = 1 }
* Змінено модель Code with Game 

### Changes in version User - (merge)
* Додано можливість реєструвати та змінювати профіль юзерів
* Юзер запам'ятовуеться в кукі
* Виведена уся статистика игор юзера
* Є можливість повертатися до незакінчених ігор
* Додано картинки з закритим і відкритим сейфами
* Гра підтримує дві мови: українську, англійську
* Додано кнопку в меню: "ГОЛОВНА"
* Підфарбовується сірим знаходження на сторінці

### Branch Bag statistic - (merge)
* Виправлено, зараз коректна робота статистики юзера
* Додано бейдж кількості для закінчених та незакінчених ігор


### Branch Drag and drop - (merge)
* Додано строку у незакінчених іграх про кількість використаних спроб
* Зроблено перетаскування вариантів відповідей:

#### Кроки:
* створюємо sortable_controller.js, та працюємо з ним

* додаемо gem 'requestjs-rails', для роботи з запитом PATCH з sortable_controller.js
+ ./bin/rails requestjs:install, що додасть:
import "@rails/request.js" до app/assets/javascripts/application.js

* додаємо gem 'sortablejs-rails', для сортування списку
+  bin/importmap pin sortablejs @rails/request.js, що додасть:
// config/importmap.rb
pin "sortablejs", to: "https://ga.jspm.io/npm:sortablejs@1.15.2/modular/sortable.esm.js"
pin "@rails/request.js", to: "https://ga.jspm.io/npm:@rails/request.js@0.0.9/src/index.js"

* додаємо gem 'positioning', дял запам'ятовування у БД позицій списку

### Branch Sorting finished games - (merge)
* Створено пошук закінчених ігор по кількості спроб
* Створено пошук незакінчених ігор по кількості спроб

### Branch Bag position - (merge)

* Виправлено баг зі збереженням в БД позицій спроб при переміщенні
* При відображенні спроб в грі та в незакінчених играх сортуємо їх за (position: :asc); в закінчених іграх сортуємо спробі за (created_at: :asc).

#### Add time in finished/unfinished games - (in main)

### Branch Opacity sort form - (merge)
* Відтворено прозоре позначення вибору при запиті сортування інструментами RAILS
* У контроллері Users дублюючийся код методів unfinished_games та finished_games винесено в метод statistics_processing(status)

### Branch Using JS opasity sort form - (навчальні цілі, не змерджено)
* Відтворено прозоре позначення вибору при запиті сортування інструментами JS

### Branch Deploy test job
* Гілка для відтворення джобу для щоденного видалення ігор без юзерів. Робота з Cron через EasyCron.
* для відображення прапора змінено на background-image: url(asset_path('flags_ua.png')); 