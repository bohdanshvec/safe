// opacity_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["option"];
  static values = { selectedFilter: String };

  connect() {
    // Применить прозрачность после загрузки страницы
    this.applyOpacity();
  }

  applyOpacity() {
    const selectedFilter = this.selectedFilterValue;

    // Сбросить прозрачность для всех элементов
    this.optionTargets.forEach(option => {
      option.closest('span').classList.remove("opacity-50");
    });

    // Применить прозрачность к выбранному элементу, если выбран
    if (selectedFilter) {
      const selectedOption = this.optionTargets.find(option => option.value === selectedFilter);
      if (selectedOption) {
        selectedOption.closest('span').classList.add("opacity-50");
      }
    }
  }

  // Слушать изменения фильтра и обновлять прозрачность
  selectedFilterValueChanged() {
    this.applyOpacity();
  }
}




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