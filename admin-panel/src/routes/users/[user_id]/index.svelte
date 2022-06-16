<script>
  import Subtitle from "$lib/components/Subtitle.svelte";
import Text from "$lib/components/Text.svelte";
  export let user = {}
</script>

<Subtitle subtitle="About" icon="errorWarning" />
<Text>
  {user.email}
</Text>