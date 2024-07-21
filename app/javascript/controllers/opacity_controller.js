import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  static targets = [ 'allGames', 'less5Tries', 'tries67', 'tries810', 'more10Tries' ];

  connect() {
    this.allTargets = this.allGamesTargets.concat(
      this.less5TriesTargets,
      this.tries67Targets,
      this.tries810Targets,
      this.more10TriesTargets
    );
    this.allTargetsOpacity100(this.allTargets) // Задаём всем элементам opacity=100
    // this.loadFilter(); // Считываем данные из localStorage
  }

  allTargetsOpacity100(targets) {
    const savedFilter = localStorage.getItem('filter');
    targets.forEach(target => {
      target.classList.add("opacity-100");
        if (target.querySelector('input[type="radio"]').value === savedFilter) {
          // const radioButton = this.element.querySelector(`input[type="radio"][value="${savedFilter}"]`); //  Определяем кнопку
          target.classList.remove("opacity-100");
          target.classList.add("opacity-50");
          // radioButton.checked = true; // Задаём флаг "включено" на кнопке
        }
    });
    // if (savedFilter == null) {
    //   this.allGamesTarget.classList.remove('opacity-100')
    //   this.allGamesTarget.classList.add('opacity-50')
    // };
    localStorage.removeItem('filter');
  }

  submitForm(event) {
    event.preventDefault(); // Останавливает отправку формы
    // console.log('submitForm called'); // Сообщение для проверки вызова метода

    const form = event.target.closest('form'); // Получаем форму
    if (form) {
      // console.log('Form found'); // Сообщение для проверки нахождения формы
      const formData = new FormData(form);
      formData.forEach((value, key) => {
        console.log(`${key}: ${value}`);
        if (key === 'filter') {
          localStorage.setItem('filter', value); // Сохраняем значение filter в localStorage
          this.filterFound = true; 
        } 
      });
      // Если просто нажать на отправку формы без заданых параметров, передастся параметр в ocalStorage - 'allGames'
      if (!this.filterFound) {
        // console.log('NULL');
        localStorage.setItem('filter', 'allGames');
      }
    } else {
      console.log('Form not found'); // Сообщение если форма не найдена
    }

    // Здесь можно добавить логику для обработки данных формы
    // и, если нужно, отправить форму вручную
    form.submit(); // Продолжаем выполнение отправки формы
  }

  // loadFilter() {
  //   const savedFilter = localStorage.getItem('filter');
  //   if (savedFilter) {
  //     console.log(`Loaded filter: ${savedFilter}`); // Сообщение для проверки загрузки значения
  //     const radioButton = this.element.querySelector(`input[type="radio"][value="${savedFilter}"]`);
  //     if (radioButton) {
  //       radioButton.checked = true; // Устанавливаем радио-кнопку в состояние checked
  //     }
  //   }
  // }

  allGames() {
    console.log('All');
    this.allTargetsOpacity100(this.allTargets)
    this.allGamesTarget.classList.remove("opacity-100")
    this.allGamesTarget.classList.add("opacity-50")
  }
  less5Tries() {
    console.log('less5Tries');
    this.allTargetsOpacity100(this.allTargets)
    this.less5TriesTarget.classList.remove("opacity-100")
    this.less5TriesTarget.classList.add("opacity-50")
  }
  tries67() {
    console.log('tries67');
    this.allTargetsOpacity100(this.allTargets)
    this.tries67Target.classList.remove("opacity-100")
    this.tries67Target.classList.add("opacity-50")
  }
  tries810() {
    console.log('tries810');
    this.allTargetsOpacity100(this.allTargets)
    this.tries810Target.classList.remove("opacity-100")
    this.tries810Target.classList.add("opacity-50")
  }
  more10Tries() {
    console.log('more10Tries');
    this.allTargetsOpacity100(this.allTargets)
    this.more10TriesTarget.classList.remove("opacity-100")
    this.more10TriesTarget.classList.add("opacity-50")
  }
}


//////////////////////////////////////////////////////////////////


//   static targets = ["allGames", "less5Tries", "tries67", "tries810", "more10Tries"];

//   connect() {
//     this.allTargets = this.targets.findAll("allGames").concat(
//       this.targets.findAll("less5Tries"),
//       this.targets.findAll("tries67"),
//       this.targets.findAll("tries810"),
//       this.targets.findAll("more10Tries")
//     );

//     this.allTargets.forEach(target => {
//       console.log(target.querySelector('input[type="radio"]'))
//       // target.querySelector('input[type="radio"]').addEventListener('change', this.handleChange.bind(this));
//     });
//   }

//   // Метод для обработки изменений
//   handleChange(event) {
//     const target = event.currentTarget;
//     // const value = target.querySelector('input[type="radio"]').value;
    
//     console.log(`Цель: ${target.dataset.opacityTarget}`);
//   }


// }









//   static targets = ["option"];
//   static values = { selectedFilter: String };

//   connect() {
//     // Применить прозрачность после загрузки страницы
//     this.applyOpacity();
//   }

//   applyOpacity() {
//     const selectedFilter = this.selectedFilterValue;

//     // Сбросить прозрачность для всех элементов
//     this.optionTargets.forEach(option => {
//       option.closest('span').classList.remove("opacity-50");
//     });

//     // Применить прозрачность к выбранному элементу, если выбран
//     if (selectedFilter) {
//       const selectedOption = this.optionTargets.find(option => option.value === selectedFilter);
//       if (selectedOption) {
//         selectedOption.closest('span').classList.add("opacity-50");
//       }
//     }
//   }

//   // Слушать изменения фильтра и обновлять прозрачность
//   selectedFilterValueChanged() {
//     this.applyOpacity();
//   }
// }




// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   connect() {
//     // Находим все элементы с атрибутом data-opacity-target
//     const targets = this.element.querySelectorAll('[data-opacity-target]');

//     // Восстанавливаем состояние из localStorage
//     this.restoreState();

//     // Перебираем найденные элементы и добавляем обработчик события change
//     targets.forEach((target) => {
//       // Находим элемент input внутри span
//       const input = target.querySelector('input');
//       if (input) {
//         input.addEventListener('change', () => {
//           this.handleInputChange(target); // Передаем элемент target, а не объект события
//         });
//       }
//     });
//   }

//   handleInputChange(target) {
//     console.log('handleInputChange:', target);
//     this.updateOpacity(target);
//     this.saveState(target);
//   }

//   updateOpacity(element) {
//     console.log('updateOpacity:', element);
//     // Проверка существования элемента
//     if (element) {
//       // Удаляем класс прозрачности у всех элементов
//       this.clearOpacity();

//       // Добавляем класс Bootstrap для 50% прозрачности
//       element.classList.add('opacity-50');
//     } else {
//       console.error('Элемент не найден');
//     }
//   }

//   saveState(element) {
//     console.log('saveState:', element);
//     // Проверка существования элемента
//     if (element) {
//       // Сохраняем идентификатор выбранного элемента в localStorage
//       localStorage.setItem('selectedOpacityTarget', element.getAttribute('data-opacity-target'));
//     }
//   }

//   restoreState() {
//     // Восстанавливаем состояние из localStorage
//     const selectedOpacityTarget = localStorage.getItem('selectedOpacityTarget');
//     if (selectedOpacityTarget) {
//       const element = this.element.querySelector(`[data-opacity-target="${selectedOpacityTarget}"]`);
//       if (element) {
//         element.classList.add('opacity-50');
//       }
//     }
//   }

//   clearOpacity() {
//     // Удаляем класс прозрачности у всех элементов
//     const targets = this.element.querySelectorAll('[data-opacity-target]');
//     targets.forEach((target) => {
//       target.classList.remove('opacity-50');
//     });
//   }
// }







  // static targets = [ 'all_games_opasity', 'less_5_tries', 'tries_6_7', 'tries_8_10', 'more_10_tries' ];

  // updateOpacity() {
  //   console.log("Updating opacity");
  //   console.log(document.getElementByTarget(this.Target).getAttribute('value'));


    // this.parentElement.classList.add('opacity-50')

    // if (!this.hasRadioTarget) {
    //   console.error("No radio targets found");
    //   return;
    // }

    // this.radioTargets.forEach((radio) => {
    //   console.log(`Radio button ${radio.value} checked: ${radio.checked}`);
    //   if (radio.checked) {
    //     console.log("if, add opacity-50");
    //     radio.parentElement.classList.add("opacity-50");
    //   } else {
    //     console.log("else, remove opacity-50");
    //     radio.parentElement.classList.remove("opacity-50");
    //   }
    // });