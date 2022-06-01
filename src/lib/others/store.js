import { writable } from "svelte/store";

export const cartItemsStore = writable([])
export const loading = writable(false)