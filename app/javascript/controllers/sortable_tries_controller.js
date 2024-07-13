import { Controller } from '@hotwired/stimulus'
// import { patch } from '@rails/request.ls'
import Sortable from 'sortablejs'

export default class extends Controller {
  connect() {
    this.sortable = new Sortable(this.element)
  }
}