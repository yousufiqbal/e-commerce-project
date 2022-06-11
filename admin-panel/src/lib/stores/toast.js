import { writable } from "svelte/store";

const toastType = { id: 0, type: '', dismissible: true, timeout: 0, message: '' }

export const toasts = writable([])

export const removeToast = id => {
  toasts.update(all => all.filter(t => t.id !== id))
}

/** @param {toastType} toast */
export const addToast = toast => {
  const id = Math.floor(Math.random() * 10000)
  const defaults = { id, type: 'success', dismissible: true, timeout: 3000 }
  let t = { ...defaults, ...toast }
  toasts.update(all => [t, ...all])
  if (t.timeout) setTimeout(() => removeToast(id), t.timeout)
}
