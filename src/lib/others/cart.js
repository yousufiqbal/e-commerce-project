// products.product_id', 'products.name',  'products.url_name', `${table}.quantity`, 'products.price

import { orderBy } from "lodash-es"
import { writable } from "svelte/store"

const createCartItemsStore = () => {
  const { set, update, subscribe } = writable([])

  return {
    set,
    subscribe,
    addItem: product => update(items => {
      let result
      // if product_id already exist increament quantity by 1
      let previousProduct = items.filter(item => item.product_id == product.product_id)[0]
      if (previousProduct) {
        previousProduct.quantity++;
        result = [{...previousProduct}, ...items.filter(item => item.product_id != product.product_id)]
      } else {
        // if no product_id add product and set quanity to 1
        result = [{quantity: 1, ...product}, ...items]
      }
      return orderBy(result, ['name'])
    }),
    removeItem: product => update(items => {
      let result
      let previousProduct = items.filter(item => item.product_id == product.product_id)[0]
      // if product_id has greater than 1 quantity, decrease quantity by 1
      if (previousProduct.quantity >= 2) {
        previousProduct.quantity--;
        result = [{...previousProduct}, ...items.filter(item => item.product_id != product.product_id)]
      } else {
        // if product_id has 1 quantity, remove it
        result = [...items.filter(item => item.product_id != product.product_id)]
      }
      return orderBy(result, ['name'])
    })
  }

}


export const cartItems = createCartItemsStore()