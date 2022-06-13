import { dev } from '$app/env';
import dayjs from 'dayjs';
import redaxios from 'redaxios'

export const stripTags = stringWithTags => stringWithTags.replace(/(<([^>]+)>)/gi, "");

export let isSafari = () => {
  return /^((?!chrome|android).)*safari/i.test(navigator.userAgent)
}

export const axios = redaxios.create({
  withCredentials: true,
})

// export const fileToBase64 = async (file) =>
//   new Promise((resolve, reject) => {
//   const reader = new FileReader()
//   reader.readAsDataURL(file)
//   reader.onload = () => resolve(reader.result)
//   reader.onerror = (e) => reject(e)
// })

/**
 * 
 * @param {Object} params 
 * @param {} $page 
 * @returns 
 */
export const setQuery = (params, $page) => {
  const url = new URL($page.url)
  for (const name in params) {
    url.searchParams.set(name, params[name])
  }
  return '?' + url.searchParams.toString()
}

export const internalError = error => {
  if (dev) console.log(error)
  return {
    status: 500, body: { message: 'Error from our side. We apologize' }
  }
}

export const convertToBase64 = imageString => imageString.replace(/^data:image\/png;base64,/, "");

export const beautifyDateTime = ISO8601 => {
  if (!ISO8601) return null
  return dayjs(ISO8601).format('MMM DD, YYYY hh:mm a')
}

export const beautifyDate = ISO8601 => {
  if (!ISO8601) return null
  return dayjs(ISO8601).format('MMM DD, YYYY')
}

// From stackoverflow.com
export const fileToBase64 = async (file) =>
  new Promise((resolve, reject) => {
  const reader = new FileReader()
  reader.readAsDataURL(file)
  reader.onload = () => resolve(reader.result)
  reader.onerror = (e) => reject(e)
})

export const getRandomCode = length => {
  let result           = '';
  let characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let charactersLength = characters.length;
  for (let i = 0; i < length; i++ ) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}