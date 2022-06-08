<script>
  import NProgress from 'nprogress'
  import { navigating } from '$app/stores'
  import 'nprogress/nprogress.css'

  // TODO other delay strategy
  NProgress.doStart = NProgress.start;
  NProgress.doDone = NProgress.done;
  NProgress.clearDelay = function () {
    if (this.startDelay) {
      clearTimeout(this.startDelay);
      this.startDelay = undefined;
    }
  }
  NProgress.start = function () {
    this.clearDelay();
    this.startDelay = setTimeout(function () {
      NProgress.doStart();
    }, this.settings.delay || 0);
  };
  NProgress.done = function () {
    this.clearDelay();
    this.doDone();
  };
  // import { loading } from '$lib/others/store';


  NProgress.configure({ showSpinner: false, minimum: 0.16, easing: 'ease', delay: 100 })
  $: $navigating ? NProgress.start() : NProgress.done()
  // $: $loading ? NProgress.start() : NProgress.done()
</script>