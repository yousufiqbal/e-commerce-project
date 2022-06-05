/// <reference types="@sveltejs/kit" />

// See https://kit.svelte.dev/docs/types#app
// for information about these interfaces
declare namespace App {
	interface Locals {
    user_id: number
    guest_id: number
    name: string
  }
	// interface Platform {}
	interface Session {
    user_id: number
    guest_id: number
    name: string
  }
	// interface Stuff {}
}
