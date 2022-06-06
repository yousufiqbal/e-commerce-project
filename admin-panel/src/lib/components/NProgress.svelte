<script>
  import NProgress from 'nprogress'
  import { navigating } from '$app/stores'
  import 'nprogress/nprogress.css'
  // import { loading } from '$lib/others/store';

  NProgress.configure({ showSpinner: false })
  $: $navigating ? NProgress.start() : NProgress.done()
  // $: $loading ? NProgress.start() : NProgress.done()
</script>