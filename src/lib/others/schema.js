import * as yup from 'yup'

yup.setLocale({ mixed: { 'required': 'Required' } })

export const extractYupErrors = err => {
  return err.inner.reduce((acc, err) => {
    return { ...acc, [err.path]: err.message };
  }, {});
}

// Example..
export const registerSchema = yup.object({
  name: yup.string().min(3).max(50).required(),
  email: yup.string().email().required(),
  password: yup.string().min(8).max(16).required(),
  repeatPassword: yup.string().required().oneOf([yup.ref('password')], 'Passwords do not match'),
}).noUnknown(true)