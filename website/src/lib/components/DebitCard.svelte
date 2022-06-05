<script>

import FieldGroup from "./FieldGroup.svelte";
import Input from "./Input.svelte";

</script>
<FieldGroup columns="1fr 1fr">
  <Input span="span 2" label="Name On Card" />
  <Input span="span 2" label="Card Number" />
  <Input label="Expiry" />
  <Input label="CVV" />
  <p>* All fields are required</p>
</FieldGroup>