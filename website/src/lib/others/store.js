import { readable, writable } from "svelte/store";

export const loading = writable(false)
export const count = readable(0)