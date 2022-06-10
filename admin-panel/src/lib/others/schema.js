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

// Category
export const categorySchema = yup.object({
  parent_id: yup.number().optional(),
  name: yup.string().min(3).max(50).required(),
  url_name: yup.string().min(3).max(50).required(),
}).noUnknown(true);

// Subcategory
export const makeSubcategorySchema = category_ids => {
  return yup.object({
    parent_id: yup.number().oneOf(category_ids, 'Invalid Category').optional(),
    name: yup.string().min(3).max(50).required(),
    url_name: yup.string().min(3).max(50).required(),
  }).noUnknown(true);
}