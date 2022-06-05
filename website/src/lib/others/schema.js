import * as yup from 'yup'

yup.addMethod(yup.mixed, 'ne', function () {
  return this.transform(value => {
    if (value == '' || value == "") return undefined
    return value
  })
})

yup.setLocale({ mixed: { 'required': 'Required' } })

export const extractYupErrors = err => {
  return err.inner.reduce((acc, err) => {
    return { ...acc, [err.path]: err.message };
  }, {});
}

// Register
export const registerSchema = yup.object({
  name: yup.string().min(3).max(50).required(),
  email: yup.string().email().required(),
  password: yup.string().min(8).max(16).required(),
  repeatPassword: yup.string().required().oneOf([yup.ref('password')], 'Passwords do not match'),
  city: yup.string().min(3).max(50).required(),
  address: yup.string().min(3).max(50).required(),
}).noUnknown(true);

// Login
export const loginSchema = yup.object({
  email: yup.string().email().required(),
  password: yup.string().min(8).max(16).required(),
}).noUnknown(true);

// address
export const addressSchema = yup.object({
  label: yup.string().oneOf(['home', 'office', 'company']).required(),
  city: yup.string().min(3).max(50).required(),
  address: yup.string().min(10).max(200).required(),
  default: yup.string().oneOf(['0', '1'])
}).noUnknown(true);

// Promo
export const promoSchema = yup.object({
  code: yup.string().length(5).ne().nullable(),
}).noUnknown(true);