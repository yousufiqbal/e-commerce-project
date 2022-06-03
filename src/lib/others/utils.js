import { dev } from '$app/env';
import dayjs from 'dayjs';
import redaxios from 'redaxios'

export let isSafari = () => {
  return /^((?!chrome|android).)*safari/i.test(navigator.userAgent)
}

export const axios = redaxios.create({
  withCredentials: true,
})

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

// /**
//  * 
//  * @param {*} $page Page Store
//  * @param {*} current Name
//  * @returns 
//  */
// export const getOtherQueryParams = ($page, current) => {

//   let result = ''
//   const params = Object.fromEntries($page.url.searchParams.entries())

//   for (const param in params) {
//     if (param == current) continue
//     result += '&' + param + '=' + params[param]
//   }

//   return result
// }

export const capitalize = sentence => {
  const words = sentence.split(" ");
  for (let i = 0; i < words.length; i++) {
    words[i] = words[i][0].toUpperCase() + words[i].substr(1);
  }
  return words.join(" ");
}

/**
 * 
 * @param {string} sentence 
 */
export const kebabCase = sentence => {
  return sentence.toLowerCase().replace(/ /g, '-')
}

/** @param {String} word */
export const startCase = word => word.replace('-', ' ')

export const sumIt = (a, b) => +a + +b