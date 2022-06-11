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

// Parent
export const parentSchema = yup.object({
  name: yup.string().min(3).max(50).required(),
}).noUnknown(true);

// Parent
export const childSchema = yup.object({
  parent_id: yup.number().required(),
  name: yup.string().min(3).max(50).required(),
}).noUnknown(true);