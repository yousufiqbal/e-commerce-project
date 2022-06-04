// products.product_id', 'products.name',  'products.url_name', `${table}.quantity`, 'products.price

import { writable } from "svelte/store"

const createCartItemsStore = () => {
  const { set, update, subscribe } = writable([])

  return {
    set,
    subscribe,
    addItem: product => update(items => {
      // if product_id already exist increament quantity by 1
      let previousProduct = items.filter(item => item.product_id == product.product_id)[0]
      if (previousProduct) {
        previousProduct.quantity++
        return [{...previousProduct}, ...items.filter(item => item.product_id != product.product_id)]
      } else {
        // if no product_id add product and set quanity to 1
        return [{quantity: 1, ...product}, ...items]
      }
    }),
    removeItem: product => update(items => {
      let previousProduct = items.filter(item => item.product_id == product.product_id)[0]
      // if product_id has greater than 1 quantity, decrease quantity by 1
      if (previousProduct.quantity >= 2) {
        previousProduct.quantity--
        return [{...previousProduct}, ...items.filter(item => item.product_id != product.product_id)]
      } else {
        // if product_id has 1 quantity, remove it
        return [...items.filter(item => item.product_id != product.product_id)]
      }
    })
  }

}

export const cartItems = createCartItemsStore()