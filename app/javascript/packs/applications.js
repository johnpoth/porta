import '@babel/polyfill'

import { initialize as planSelector } from 'Applications/plan_selector'

document.addEventListener('DOMContentLoaded', () => {
  planSelector()
})
